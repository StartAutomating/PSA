function Send-AtProto
{
    <#
    .SYNOPSIS
        Sends to the At Protocol
    .DESCRIPTION
        Sends a BlueSky post using the At Protocol
    .EXAMPLE
        # Send a Hello World
        Send-AtProto "Hello World (from https://github.com/StartAutomating/PSA )"
    .EXAMPLE
        # Don't send Hello World, ask -WhatIf I did, and get back the object you would post.
        Send-AtProto "Hello World (from https://github.com/StartAutomating/PSA )" -WhatIf
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [Alias(
        'Send-AtProtocol', # Longform
        'Send-Bsky',       # Alternate lexicon
        'Send-BlueSky',    # Alternate longform
        'Send-Skeet',      # PowerShell Colloquial
        'Skeet'            # Colloqiual        
    )]
    param(
    # The text of a post
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Post','Skeet','Title')]
    [string]
    $Text,

    # One or more images to attach to a post.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string[]]
    $Image,

    # One or more alternate image texts, for accessibility.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string[]]
    $AlternateImageText = @(),

    # A post that will be quoted by this post.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $QuotePost,

    # A post that this post will reply to.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $Reply,

    # A web card, containing rich links
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $WebCard,

    # Patterns within a message to replace with links.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $LinkPattern
    )

    begin {
        if (-not $script:KnownAtActors) {
            $script:KnownAtActors = [Ordered]@{}
        }

        filter MatchToFacet {
            param($type)
            [Ordered]@{
                index = [ordered]@{
                    byteStart = $_.Index
                    byteEnd = $_.Index + $_.Length
                }
                features = @([Ordered]@{
                    '$type' = $type
                })
            }          
        }

        <#
        Thankful author's note:
        
        This function owes a lot to this [AtProtocol Blog Post](https://atproto.com/blog/create-post).
        
        #>

        
    }

    process {
        # First up, if there's nothing to say, we're done.
        if (-not $Text) { return }


        # Next, we want to prepare facets.

        # Facets are BlueSkys/ At Protocols way of including extra information within a message.
        $facets = @()

        # One facet is mentions
        foreach ($mention in [Regex]::Matches($text, "\@(?<Mention>[\p{L}\d\.]+)")) {
            # For each potential mention
            $actorMentioned = $mention.Groups["Mention"].Value
            if (-not $script:KnownAtActors[$actorMentioned]) {
                $actorMentioned = $mention.Groups["Mention"].Value
                $foundProfile =  # see if we can find a profile of an actor
                    if ($actorMentioned -notlike '*.*') { 
                        Get-BskyActorProfile -Actor "$actorMentioned.bsky.social"
                    } else {
                        Get-BskyActorProfile -Actor $actorMentioned
                    }
                
                if ($foundProfile) { # (cache it if we find one)
                    $script:KnownAtActors[$actorMentioned] = $foundProfile
                }
            }
            
            # Assuming we've resolved the mention
            if ($script:KnownAtActors[$actorMentioned]) {
                # we can simply turn the match into a facet
                $facet = $mention | MatchToFacet -type "app.bsky.richtext.facet#mention"
                # and set the did (a unique identifier in At)
                $facet.features[0].did = $script:KnownAtActors[$actorMentioned].did
                $facets += $facet
            }            
        }

        # Links also become a facet
        foreach ($urlLink in [regex]::Matches($text, "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._/\+~#=]{1,256}")) {
            $facet = $urlLink | MatchToFacet -type "app.bsky.richtext.facet#link"
            $facet.features[0].uri = $urlLink.Value
            $facets += $facet
        }

        # If there was a link pattern provided, and it was dictionary,
        if ($LinkPattern -is [Collections.IDictionary]) {
            $LinkPattern = [PSCustomObject]$LinkPattern # make it a property bag.
        }

        # Walk thru each potential property to link
        foreach ($linkPatternInfo in $LinkPattern.psobject.properties) {
            foreach ($match in [Regex]::Matches($text, $linkPatternInfo.Name)) {
                # replacing any matches
                $facet = $match | MatchToFacet -type "app.bsky.richtext.facet#link"
                # with a facet linking to this text.
                $facet.features[0].uri = $linkPatternInfo.Value
                $facets += $facet
            }                    
        }

        # (quick note here, this is something that the protocol is capable of but the web client isn't yet)

        # Now we create the post object
        $postObject = [Ordered]@{
            '$type' = 'app.bsky.feed.post'
            text=$Text
            createdAt=[DateTime]::Now.ToString('o')
            langs = @(
                "$([Globalization.CultureInfo]::CurrentCulture.TwoLetterISOLanguageName)" -replace "^iv$", "en"
            )
        }        

        if ($facets) { # and add any facets we have.
            $postObject.facets = $facets
        }
        
        # Next up, handling replies:
        if ($reply) {            
            # The first part is easy, the parent of a reply is basically what was in -Reply
            $postObject.reply = [Ordered]@{}
            $postObject.reply.root = [Ordered]@{}
            $postobject.reply.parent = [Ordered]@{
                uri = $reply.Uri
                cid = $reply.cid
            }

            # Replies in AtProtocol have to have the root as well.
            # Since this is true, if we're replying to a reply, it already has a root
            if ($Reply.record.reply.root) {                
                $reRoot = $Reply.record.reply.root
                # and we can just use that to reply to the whole thread.
                $postObject.reply.root.uri = $reRoot.Uri
                $postObject.reply.root.cid = $reRoot.cid
            } else {
                # otherwise, we're the first reply, and this what we're replying to becomes the root as well.
                $postObject.reply.root.uri = $reply.Uri
                $postObject.reply.root.cid = $reply.cid
            }
        }

        # Next up are the three different things we can embed into a post.

        # First, images:
        if ($Image) {
            $messageImages = @()

            $index = -1

            # Multiple images can be attached
            foreach ($img in $image) {
                $index++
                                
                $imgUri = $img -as [uri]
                $imgBytes = [byte[]]$null
                # but we need to upload them, so, if we're linking to a web image, download it first.
                if ($imgUri.Scheme -in 'http', 'https') {
                    $webResponse = Invoke-WebRequest -Uri $imgUri
                    $imgBytes = $webResponse.Content -as [byte[]]
                }
                elseif ($img -is [byte[]]) {
                    $imgBytes =  $img
                }
                else {
                    foreach ($imgFile in $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($img)) {
                        $imgBytes = [io.file]::ReadAllBytes("$imgFile")
                        break
                    }
                }

                if (-not $imgBytes.Length) { continue }
                # Get the potential alternate text for this image.
                $altText = $AlternateImageText[$index]

                # And add the image and it's uploaded blob to the list.
                $messageImages += [Ordered]@{
                    alt = "$altText"
                    image = Set-AtprotoRepoBlob -Data $imgBytes -ContentType "image/jpeg"
                }
            }

            # Then we embed each of the attached images into the post.
            $postObject.embed = [Ordered]@{
                '$type' = 'app.bsky.embed.images'
                images = $messageImages
            }
        } 
        elseif ($QuotePost) {
            # For quote posting, we're embedding a record to the post.
            $postObject.embed = [Ordered]@{
                '$type' = 'app.bsky.embed.record'
                record = [Ordered]@{
                    uri = $QuotePost.uri
                    cid = $QuotePost.cid
                }                
            }
        }
        elseif ($WebCard.Url -or $WebCard.Uri) {
            # For web cards, we want to try to provide a .title, .url., .description, and .image
            $postObject.embed = [Ordered]@{
                '$type' = 'app.bsky.embed.external'
                external = [Ordered]@{}
            }

            # A webcard could be as little as a uri/url
            $WebCardUri = 
                if ($WebCard.uri) { 
                    $WebCard.uri
                }
                else { $WebCard.Url }


            
            # If the webcard does not have a title, description, or image
            
            if (-not ($WebCard.title) -or (-not $WebCard.description) -or (-not $webcard.Image)) {
                # Get it's content
                $gotWebCardContent = Invoke-RestMethod -Uri $WebCardUri
                # and find all of the meta tags
                foreach ($metaMatch in  [Regex]::Matches($gotWebCardContent, "<meta.+?/>", 'IgnoreCase')) {
                    $metaXml = ($metaMatch.Value -as [xml])
                    # and pick out the opengraph title
                    if ($metaXml.meta.property -eq 'og:title' -and -not $WebCard.title) {
                        $WebCard.title = $metaXml.meta.content
                    }
                    # description
                    if ($metaXml.meta.property -eq 'og:description' -and -not $WebCard.description) {
                        $WebCard.description = $metaXml.meta.content
                    }
                    # and image.
                    if ($metaXml.meta.property -eq 'og:image' -and -not $WebCard.image) {
                        $WebCard.image = $metaXml.meta.content
                    }
                }
            }

            # Then embed it into the post
            $postObject.embed.external.uri = $WebCardUri
            $postObject.embed.external.title = "$($WebCard.title)"
            $postObject.embed.external.description = "$($WebCard.description)"

            if ($WebCard.Image) {
                $webCardImageUrl = $WebCard.Image                
                $webCardImageResponse = Invoke-WebRequest -Uri $webCardImageUrl 
                if ($webCardImageResponse -and $webCardImageResponse.Content -is [byte[]]) {
                    $postObject.embed.external.thumb =
                        Set-AtprotoRepoBlob -Data $webCardImageResponse.Content -ContentType "image/jpeg"                    
                }
            }
        }

        # PowerShell Bonus points:  Passing -WhatIf 
        if ($WhatIfPreference) {
            [PSCustomObject]$postObject # will output what we would post, without posting.
        } elseif (
            # Also, -Confirm will check that you want to post something first.
            $PSCmdlet.ShouldProcess("Post $($postObject.Text)")
        ) { 
            # Get the most recent session           
            $atSession = $script:AtServerSessions[-1]

            # and, if we have a did for the current user
            if ($atSession.did) {
                # create a post under their account.
                Add-AtProtoRepoRecord -Record ([PSCustomObject]$postObject) -Repo $atSession.did -Collection 'app.bsky.feed.post'
            }            
        }
    }
}