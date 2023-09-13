function Add-AtProtoServerAppPassword  {
<#
.Synopsis
    com.atproto.server.createAppPassword
.Description
    com.atproto.server.createAppPassword
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createAppPassword.json
#>
[Alias('Add-AtProtocolServerAppPassword','atproto.server.createAppPassword','com.atproto.server.createAppPassword')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('name')]
[String]
$Name
)

begin {
$NamespaceID = 'com.atproto.server.createAppPassword'
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

