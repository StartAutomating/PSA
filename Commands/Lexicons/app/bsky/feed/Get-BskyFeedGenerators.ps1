function Get-BskyFeedGenerators  {
<#
.Synopsis
    app.bsky.feed.getFeedGenerators
.Description
    app.bsky.feed.getFeedGenerators
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getFeedGenerators.json
#>
[Alias('Get-BlueSkyFeedGenerators','bsky.feed.getFeedGenerators','app.bsky.feed.getFeedGenerators')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('feeds')]
[Management.Automation.PSObject]
$Feeds
)

begin {
$NamespaceID = 'app.bsky.feed.getFeedGenerators'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'feeds'='app.bsky.feed.defs#generatorView'
    'feeds.creator'='app.bsky.actor.defs#profileView'
    'feeds.viewer'='app.bsky.feed.defs#generatorViewerState'
}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
$parameterAliases = [Ordered]@{}
$AsByte = $false


    
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
                } -ParameterAlias $parameterAliases @InvokeAtSplat -ContentType $(
                    if ($ContentType) {
                        $ContentType
                    } else {
                        "application/json"   
                    }
                ) -AsByte:$AsByte
        
}
} 

