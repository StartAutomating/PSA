function Search-BskyUnspeccedPostsSkeleton  {
<#
.Synopsis
    app.bsky.unspecced.searchPostsSkeleton
.Description
    app.bsky.unspecced.searchPostsSkeleton
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/searchPostsSkeleton.json
#>
[Alias('Search-BlueSkyUnspeccedPostsSkeleton','bsky.unspecced.searchPostsSkeleton','app.bsky.unspecced.searchPostsSkeleton')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('q')]
[String]
$Q,
# Specifies the ranking order of results.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('sort')]
[String]
$Sort,
# Filter results for posts after the indicated datetime (inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYYY-MM-DD).
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('since')]
[String]
$Since,
# Filter results for posts before the indicated datetime (not inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYY-MM-DD).
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('until')]
[String]
$Until,
# Filter to posts which mention the given account. Handles are resolved to DID before query-time. Only matches rich-text facet mentions.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('mentions')]
[String]
$Mentions,
# Filter to posts by the given account. Handles are resolved to DID before query-time.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('author')]
[String]
$Author,
# Filter to posts in the given language. Expected to be based on post language field, though server may override language detection.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('lang')]
[String]
$Lang,
# Filter to posts with URLs (facet links or embeds) linking to the given domain (hostname). Server may apply hostname normalization.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('domain')]
[String]
$Domain,
# Filter to posts with links (facet links or embeds) pointing to this URL. Server may apply URL normalization or fuzzy matching.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('url')]
[String]
$Url,
# Filter to posts with the given tag (hashtag), based on rich-text facet or tag field. Do not include the hash (#) prefix. Multiple tags can be specified, with 'AND' matching.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('tag')]
[Management.Automation.PSObject]
$Tag,
# DID of the account making the request (not included for public/unauthenticated queries). Used for 'from:me' queries.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('viewer')]
[String]
$Viewer,
# A limit to the number of results returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
# Optional pagination mechanism; may not necessarily allow scrolling through entire result set.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# If set, will cache results for performance.
[Management.Automation.SwitchParameter]
$Cache,
# The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.
[Alias('Authentication','AppPassword','Credential','PSCredential')]
[Management.Automation.SwitchParameter]
$Authorization,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'app.bsky.unspecced.searchPostsSkeleton'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'posts'='app.bsky.unspecced.defs#skeletonSearchPost'
}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
$parameterAliases = [Ordered]@{}
$DataboundParameters = @()
$AsByte = $false


    
:nextParameter foreach ($paramMetadata in 
    ([Management.Automation.CommandMetadata]$MyInvocation.MyCommand).Parameters.Values) {
    
    foreach ($attr in $paramMetadata.Attributes) {
        if ($attr -is [ComponentModel.DefaultBindingPropertyAttribute]) {
            $parameterAliases[$paramMetadata.Name] = $attr.Name
            $DataboundParameters += $paramMetadata.Name
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
                    $RestParameters =[Ordered]@{}
                    foreach ($parameterName in $DataboundParameters) {
                        if ($null -ne $_.($ParameterName)) {
                            $RestParameters[$parameterName] = $_.($ParameterName)
                        }
                    }
                    $RestParameters
                } -ParameterAlias $parameterAliases @InvokeAtSplat -ContentType $(
                    if ($ContentType) {
                        $ContentType
                    } else {
                        "application/json"   
                    }
                ) -AsByte:$AsByte -Property {
                    $_
                } -Cache:$(
                    if ($cache) {$cache} else { $false }
                ) -Raw:$Raw -Authorization {
                    if ($_.Authorization) { 
                        $_.Authorization
                    } else { 
                        $null
                    }
                }
        
}
} 

