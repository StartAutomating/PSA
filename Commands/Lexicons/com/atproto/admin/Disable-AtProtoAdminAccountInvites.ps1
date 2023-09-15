function Disable-AtProtoAdminAccountInvites  {
<#
.Synopsis
    com.atproto.admin.disableAccountInvites
.Description
    com.atproto.admin.disableAccountInvites
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/disableAccountInvites.json
#>
[Alias('Disable-AtProtocolAdminAccountInvites','atproto.admin.disableAccountInvites','com.atproto.admin.disableAccountInvites')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('account')]
[String]
$Account,
# Additionally add a note describing why the invites were disabled
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('note')]
[String]
$Note
)

begin {
$NamespaceID = 'com.atproto.admin.disableAccountInvites'
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

