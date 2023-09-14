function Get-BskyActorSuggestions  {
<#
.Synopsis
    app.bsky.actor.getSuggestions
.Description
    app.bsky.actor.getSuggestions
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/getSuggestions.json
#>
[Alias('Get-BlueSkyActorSuggestions','bsky.actor.getSuggestions','app.bsky.actor.getSuggestions')]
[CmdletBinding(SupportsShouldProcess)]
param(
# A limit to the number of results returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
<#
A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor
)

begin {
$NamespaceID = 'app.bsky.actor.getSuggestions'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'actors'='app.bsky.actor.defs#profileView'
    'actors.viewer'='app.bsky.graph.defs#viewerState'
    'actors.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'actors.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'actors.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
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

