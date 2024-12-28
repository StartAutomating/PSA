function Add-AtProtoServerAccount  {
<#
.Synopsis
    com.atproto.server.createAccount
.Description
    com.atproto.server.createAccount
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createAccount.json
#>
[Alias('Add-AtProtocolServerAccount','atproto.server.createAccount','com.atproto.server.createAccount')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('email')]
[String]
$Email,
# Requested handle for the account.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('handle')]
[String]
$Handle,
# Pre-existing atproto DID, being imported to a new account.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('inviteCode')]
[String]
$InviteCode,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('verificationCode')]
[String]
$VerificationCode,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('verificationPhone')]
[String]
$VerificationPhone,
# Initial account password. May need to meet instance-specific password strength requirements.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('password')]
[String]
$Password,
# DID PLC rotation key (aka, recovery key) to be included in PLC creation operation.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('recoveryKey')]
[String]
$RecoveryKey,
# A signed DID PLC operation to be submitted as part of importing an existing account to this instance. NOTE: this optional field may be updated when full account migration is implemented.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('plcOp')]
[Management.Automation.PSObject]
$PlcOp,
# The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.
[Alias('Authentication','AppPassword','Credential','PSCredential')]
[Management.Automation.SwitchParameter]
$Authorization,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'com.atproto.server.createAccount'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
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

