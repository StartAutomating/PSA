function Enable-AtProtoAdminAccountInvites  {
<#
.Synopsis
    com.atproto.admin.enableAccountInvites
.Description
    com.atproto.admin.enableAccountInvites
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/enableAccountInvites.json
#>
[Alias('Enable-AtProtocolAdminAccountInvites','atproto.admin.enableAccountInvites','com.atproto.admin.enableAccountInvites')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('account')]
[String]
$Account,
# Additionally add a note describing why the invites were enabled
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('note')]
[String]
$Note
)

begin {
$NamespaceID = 'com.atproto.admin.enableAccountInvites'
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

