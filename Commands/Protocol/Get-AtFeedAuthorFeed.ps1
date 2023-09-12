function Get-AtFeedAuthorFeed  {
<#
.Synopsis
    app.bsky.feed.getAuthorFeed
.Description
    app.bsky.feed.getAuthorFeed
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getAuthorFeed.json
#>
[Alias('PSA.app.bsky.feed.getAuthorFeed')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('actor')]
[String]
$Actor,
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
[ComponentModel.DefaultBindingProperty('filter')]
[String]
$Filter
)

begin {
$NamespaceID = 'app.bsky.feed.getAuthorFeed'
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

