function Get-BskyGraphList  {
<#
.Synopsis
    app.bsky.graph.getList
.Description
    app.bsky.graph.getList
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/getList.json
#>
[Alias('Get-BlueSkyGraphList','bsky.graph.getList','app.bsky.graph.getList')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Reference (AT-URI) of the list record to hydrate.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('list')]
[String]
$List,
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
$NamespaceID = 'app.bsky.graph.getList'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'list'='app.bsky.graph.defs#listView'
    'list.creator'='app.bsky.actor.defs#profileView'
    'list.creator.associated'='app.bsky.actor.defs#profileAssociated'
    'list.creator.associated.chat'='app.bsky.actor.defs#profileAssociatedChat'
    'list.creator.viewer'='app.bsky.graph.defs#viewerState'
    'list.creator.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'list.creator.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'list.creator.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
    'list.creator.viewer.blockingByList'='app.bsky.graph.defs#listViewBasic'
    'list.creator.viewer.blockingByList.purpose'='app.bsky.graph.defs#listPurpose'
    'list.creator.viewer.blockingByList.viewer'='app.bsky.graph.defs#listViewerState'
    'list.creator.viewer.knownFollowers'='app.bsky.graph.defs#knownFollowers'
    'list.purpose'='app.bsky.graph.defs#listPurpose'
    'list.viewer'='app.bsky.graph.defs#listViewerState'
    'items'='app.bsky.graph.defs#listItemView'
    'items.subject'='app.bsky.actor.defs#profileView'
    'items.subject.associated'='app.bsky.actor.defs#profileAssociated'
    'items.subject.associated.chat'='app.bsky.actor.defs#profileAssociatedChat'
    'items.subject.viewer'='app.bsky.graph.defs#viewerState'
    'items.subject.viewer.mutedByList'='app.bsky.graph.defs#listViewBasic'
    'items.subject.viewer.mutedByList.purpose'='app.bsky.graph.defs#listPurpose'
    'items.subject.viewer.mutedByList.viewer'='app.bsky.graph.defs#listViewerState'
    'items.subject.viewer.blockingByList'='app.bsky.graph.defs#listViewBasic'
    'items.subject.viewer.blockingByList.purpose'='app.bsky.graph.defs#listPurpose'
    'items.subject.viewer.blockingByList.viewer'='app.bsky.graph.defs#listViewerState'
    'items.subject.viewer.knownFollowers'='app.bsky.graph.defs#knownFollowers'
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

