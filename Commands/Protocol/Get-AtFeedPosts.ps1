function Get-AtFeedPosts  {
<#
.Synopsis
    app.bsky.feed.getPosts
.Description
    app.bsky.feed.getPosts
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getPosts.json
#>
[Alias('PSA.app.bsky.feed.getPosts')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('uris')]
[Management.Automation.PSObject]
$Uris
)

begin {
$NamespaceID = 'app.bsky.feed.getPosts'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$parameterAliases = [Ordered]@{}


    
:nextParameter foreach ($paramMetadata in 
    ([Management.Automation.CommandMetadata]$MyInvocation.MyCommand).Parameters.Values) {
    
    foreach ($attr in $paramMetadata.Attributes) {
        if ($attr -is [ComponentModel.DefaultBindingPropertyAttribute]) {
            $parameterAliases[$paramMetadata.Name] = $attr.Name
            continue nextParameter
        }
    }
}



    $parameterQueue = [Collections.Queue]::new()

}
process {

$parameterQueue.Enqueue([Ordered]@{} + $PSBoundParameters)            
        
}
end {

            $parameterQueue.ToArray() |
                Invoke-AtProtocol -Method $httpMethod -NamespaceID $NamespaceID -Parameter {
                    $_
                } -ParameterAlias $parameterAliases @InvokeAtSplat
        
}
} 

