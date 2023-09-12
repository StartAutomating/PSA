function Get-AtFeedActorFeeds  {
<#
.Synopsis
    app.bsky.feed.getActorFeeds
.Description
    app.bsky.feed.getActorFeeds
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getActorFeeds.json
#>
[Alias('PSA.app.bsky.feed.getActorFeeds')]
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
$Cursor
)

begin {
$NamespaceID = 'app.bsky.feed.getActorFeeds'
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

