function Search-BskyActors  {
<#
.Synopsis
    app.bsky.actor.searchActors
.Description
    app.bsky.actor.searchActors
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/searchActors.json
#>
[Alias('Search-BlueSkyActors','bsky.actor.searchActors','app.bsky.actor.searchActors')]
[CmdletBinding(SupportsShouldProcess)]
param(
# DEPRECATED: use 'q' instead
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('term')]
[String]
$Term,
# search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('q')]
[String]
$Q,
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
$NamespaceID = 'app.bsky.actor.searchActors'
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

