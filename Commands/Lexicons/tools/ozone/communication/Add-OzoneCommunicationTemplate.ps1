function Add-OzoneCommunicationTemplate  {
<#
.Synopsis
    tools.ozone.communication.createTemplate
.Description
    tools.ozone.communication.createTemplate
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/communication/createTemplate.json
#>
[Alias('ozone.communication.createTemplate','tools.ozone.communication.createTemplate')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Name of the template.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('name')]
[String]
$Name,
# Content of the template, markdown supported, can contain variable placeholders.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('contentMarkdown')]
[String]
$ContentMarkdown,
# Subject of the message, used in emails.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subject')]
[String]
$Subject,
# Message language.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('lang')]
[String]
$Lang,
# DID of the user who is creating the template.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createdBy')]
[String]
$CreatedBy,
# The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.
[Alias('Authentication','AppPassword','Credential','PSCredential')]
[Management.Automation.SwitchParameter]
$Authorization,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'tools.ozone.communication.createTemplate'
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

