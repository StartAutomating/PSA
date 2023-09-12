function Send-AtAdminEmail  {
<#
.Synopsis
    com.atproto.admin.sendEmail
.Description
    com.atproto.admin.sendEmail
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/sendEmail.json
#>
[Alias('PSA.com.atproto.admin.sendEmail')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('recipientDid')]
[String]
$RecipientDid,
[ComponentModel.DefaultBindingProperty('content')]
[String]
$Content,
[ComponentModel.DefaultBindingProperty('subject')]
[String]
$Subject
)

begin {
$NamespaceID = 'com.atproto.admin.sendEmail'
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

