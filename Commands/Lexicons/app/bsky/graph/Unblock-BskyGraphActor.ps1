function Unblock-BskyGraphActor  {
<#
.Synopsis
    app.bsky.graph.unmuteActor
.Description
    app.bsky.graph.unmuteActor
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/unmuteActor.json
#>
[Alias('Unblock-BlueSkyGraphActor','bsky.graph.unmuteActor','app.bsky.graph.unmuteActor')]
[CmdletBinding(SupportsShouldProcess)]
param(
<#
The Actor.

This can be either a handle (e.g. @AtProto.com) or a Decentralized Identifier (.did)
#>
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('actor')]
[String]
$Actor
)

begin {
$NamespaceID = 'app.bsky.graph.unmuteActor'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
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
                ) -AsByte:$AsByte -Property {
                    $_
                } -Cache:$(
                    if ($cache) {$cache} else { $false }
                )
        
}
} 

