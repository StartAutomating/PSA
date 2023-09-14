function Invoke-AtProtoAdminModerationAction  {
<#
.Synopsis
    com.atproto.admin.takeModerationAction
.Description
    com.atproto.admin.takeModerationAction
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/takeModerationAction.json
#>
[Alias('Invoke-AtProtocolAdminModerationAction','atproto.admin.takeModerationAction','com.atproto.admin.takeModerationAction')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('action')]
[String]
$Action,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subject')]
[Management.Automation.PSObject]
$Subject,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subjectBlobCids')]
[Management.Automation.PSObject]
$SubjectBlobCids,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createLabelVals')]
[Management.Automation.PSObject]
$CreateLabelVals,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('negateLabelVals')]
[Management.Automation.PSObject]
$NegateLabelVals,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reason')]
[String]
$Reason,
# Indicates how long this action was meant to be in effect before automatically expiring.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('durationInHours')]
[Management.Automation.PSObject]
$DurationInHours,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createdBy')]
[String]
$CreatedBy
)

begin {
$NamespaceID = 'com.atproto.admin.takeModerationAction'
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

