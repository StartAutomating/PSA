function Get-BskyActorProfiles  {
<#
.Synopsis
    app.bsky.actor.getProfiles
.Description
    app.bsky.actor.getProfiles
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/getProfiles.json
#>
[Alias('Get-BlueSkyActorProfiles','bsky.actor.getProfiles','app.bsky.actor.getProfiles')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('actors')]
[Management.Automation.PSObject]
$Actors,
# If set, will cache results for performance.
[Management.Automation.SwitchParameter]
$Cache,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'app.bsky.actor.getProfiles'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'profiles'='app.bsky.actor.defs#profileViewDetailed'
    'profiles.viewer'='app.bsky.graph.defs#viewerState'
    'profiles.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'profiles.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'profiles.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
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
                ) -Raw:$Raw
        
}
} 

