function Invoke-AtAdminModerationAction  {
<#
.Synopsis
    com.atproto.admin.takeModerationAction
.Description
    com.atproto.admin.takeModerationAction
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/takeModerationAction.json
#>
[Alias('PSA.com.atproto.admin.takeModerationAction')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('action')]
[String]
$Action,
[ComponentModel.DefaultBindingProperty('subject')]
[Management.Automation.PSObject]
$Subject,
[ComponentModel.DefaultBindingProperty('subjectBlobCids')]
[Management.Automation.PSObject]
$SubjectBlobCids,
[ComponentModel.DefaultBindingProperty('createLabelVals')]
[Management.Automation.PSObject]
$CreateLabelVals,
[ComponentModel.DefaultBindingProperty('negateLabelVals')]
[Management.Automation.PSObject]
$NegateLabelVals,
[ComponentModel.DefaultBindingProperty('reason')]
[String]
$Reason,
# Indicates how long this action was meant to be in effect before automatically expiring.
[ComponentModel.DefaultBindingProperty('durationInHours')]
[Management.Automation.PSObject]
$DurationInHours,
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
                ) -AsByte:$AsByte
        
}
} 

