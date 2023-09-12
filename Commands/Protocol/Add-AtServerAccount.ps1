function Add-AtServerAccount  {
<#
.Synopsis
    com.atproto.server.createAccount
.Description
    com.atproto.server.createAccount
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createAccount.json
#>
[Alias('PSA.com.atproto.server.createAccount')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('email')]
[String]
$Email,
[ComponentModel.DefaultBindingProperty('handle')]
[String]
$Handle,
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
[ComponentModel.DefaultBindingProperty('inviteCode')]
[String]
$InviteCode,
[ComponentModel.DefaultBindingProperty('password')]
[String]
$Password,
[ComponentModel.DefaultBindingProperty('recoveryKey')]
[String]
$RecoveryKey
)

begin {
$NamespaceID = 'com.atproto.server.createAccount'
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

