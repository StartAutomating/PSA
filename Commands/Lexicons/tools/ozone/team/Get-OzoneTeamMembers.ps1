function Get-OzoneTeamMembers  {
<#
.Synopsis
    tools.ozone.team.listMembers
.Description
    tools.ozone.team.listMembers
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/team/listMembers.json
#>
[Alias('ozone.team.listMembers','tools.ozone.team.listMembers')]
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
$NamespaceID = 'tools.ozone.team.listMembers'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'members'='tools.ozone.team.defs#member'
    'members.profile'='app.bsky.actor.defs#profileViewDetailed'
    'members.profile.associated'='app.bsky.actor.defs#profileAssociated'
    'members.profile.associated.chat'='app.bsky.actor.defs#profileAssociatedChat'
    'members.profile.joinedViaStarterPack'='app.bsky.graph.defs#starterPackViewBasic'
    'members.profile.joinedViaStarterPack.creator'='app.bsky.actor.defs#profileViewBasic'
    'members.profile.joinedViaStarterPack.creator.associated'='app.bsky.actor.defs#profileAssociated'
    'members.profile.joinedViaStarterPack.creator.associated.chat'='app.bsky.actor.defs#profileAssociatedChat'
    'members.profile.joinedViaStarterPack.creator.viewer'='app.bsky.graph.defs#viewerState'
    'members.profile.joinedViaStarterPack.creator.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'members.profile.joinedViaStarterPack.creator.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'members.profile.joinedViaStarterPack.creator.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
    'members.profile.joinedViaStarterPack.creator.viewer.blockingByList'='app.bsky.graph.defs#listViewBasic'
    'members.profile.joinedViaStarterPack.creator.viewer.blockingByList.purpose'='app.bsky.graph.defs#listPurpose'
    'members.profile.joinedViaStarterPack.creator.viewer.blockingByList.viewer'='app.bsky.graph.defs#listViewerState'
    'members.profile.joinedViaStarterPack.creator.viewer.knownFollowers'='app.bsky.graph.defs#knownFollowers'
    'members.profile.viewer'='app.bsky.graph.defs#viewerState'
    'members.profile.pinnedPost'='com.atproto.repo.strongRef'
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

