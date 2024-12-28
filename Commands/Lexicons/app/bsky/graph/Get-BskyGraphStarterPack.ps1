function Get-BskyGraphStarterPack  {
<#
.Synopsis
    app.bsky.graph.getStarterPack
.Description
    app.bsky.graph.getStarterPack
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/getStarterPack.json
#>
[Alias('Get-BlueSkyGraphStarterPack','bsky.graph.getStarterPack','app.bsky.graph.getStarterPack')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Reference (AT-URI) of the starter pack record.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('starterPack')]
[String]
$StarterPack,
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
$NamespaceID = 'app.bsky.graph.getStarterPack'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'starterPack'='app.bsky.graph.defs#starterPackView'
    'starterPack.creator'='app.bsky.actor.defs#profileViewBasic'
    'starterPack.creator.associated'='app.bsky.actor.defs#profileAssociated'
    'starterPack.creator.associated.chat'='app.bsky.actor.defs#profileAssociatedChat'
    'starterPack.creator.viewer'='app.bsky.graph.defs#viewerState'
    'starterPack.creator.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'starterPack.creator.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'starterPack.creator.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
    'starterPack.creator.viewer.blockingByList'='app.bsky.graph.defs#listViewBasic'
    'starterPack.creator.viewer.blockingByList.purpose'='app.bsky.graph.defs#listPurpose'
    'starterPack.creator.viewer.blockingByList.viewer'='app.bsky.graph.defs#listViewerState'
    'starterPack.creator.viewer.knownFollowers'='app.bsky.graph.defs#knownFollowers'
    'starterPack.list'='app.bsky.graph.defs#listViewBasic'
    'starterPack.list.purpose'='app.bsky.graph.defs#listPurpose'
    'starterPack.list.viewer'='app.bsky.graph.defs#listViewerState'
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

