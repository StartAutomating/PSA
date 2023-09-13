function Block-BskyGraphActorList  {
<#
.Synopsis
    app.bsky.graph.muteActorList
.Description
    app.bsky.graph.muteActorList
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/muteActorList.json
#>
[Alias('Block-BlueSkyGraphActorList','bsky.graph.muteActorList','app.bsky.graph.muteActorList')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('list')]
[String]
$List
)

begin {
$NamespaceID = 'app.bsky.graph.muteActorList'
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
                ) -AsByte:$AsByte
        
}
} 

