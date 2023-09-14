function Get-AtProtoAdminRepo  {
<#
.Synopsis
    com.atproto.admin.getRepo
.Description
    com.atproto.admin.getRepo
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getRepo.json
#>
[Alias('Get-AtProtocolAdminRepo','atproto.admin.getRepo','com.atproto.admin.getRepo')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did
)

begin {
$NamespaceID = 'com.atproto.admin.getRepo'
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

