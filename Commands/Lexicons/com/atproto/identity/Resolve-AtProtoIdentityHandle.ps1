function Resolve-AtProtoIdentityHandle  {
<#
.Synopsis
    com.atproto.identity.resolveHandle
.Description
    com.atproto.identity.resolveHandle
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/identity/resolveHandle.json
#>
[Alias('Resolve-AtProtocolIdentityHandle','atproto.identity.resolveHandle','com.atproto.identity.resolveHandle')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle to resolve.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('handle')]
[String]
$Handle
)

begin {
$NamespaceID = 'com.atproto.identity.resolveHandle'
$httpMethod  = 'GET'
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

