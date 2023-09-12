function Reset-AtServerPassword  {
<#
.Synopsis
    com.atproto.server.resetPassword
.Description
    com.atproto.server.resetPassword
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/resetPassword.json
#>
[Alias('PSA.com.atproto.server.resetPassword')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('token')]
[String]
$Token,
[ComponentModel.DefaultBindingProperty('password')]
[String]
$Password
)

begin {
$NamespaceID = 'com.atproto.server.resetPassword'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$parameterAliases = [Ordered]@{}


    
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
                } -ParameterAlias $parameterAliases @InvokeAtSplat
        
}
} 

