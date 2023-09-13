function Get-AtprotoAdminModerationReports  {
<#
.Synopsis
    com.atproto.admin.getModerationReports
.Description
    com.atproto.admin.getModerationReports
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationReports.json
#>
[Alias('PSA.com.atproto.admin.getModerationReports')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('subject')]
[String]
$Subject,
[ComponentModel.DefaultBindingProperty('ignoreSubjects')]
[Management.Automation.PSObject]
$IgnoreSubjects,
# Get all reports that were actioned by a specific moderator
[ComponentModel.DefaultBindingProperty('actionedBy')]
[String]
$ActionedBy,
# Filter reports made by one or more DIDs
[ComponentModel.DefaultBindingProperty('reporters')]
[Management.Automation.PSObject]
$Reporters,
[ComponentModel.DefaultBindingProperty('resolved')]
[Management.Automation.SwitchParameter]
$Resolved,
[ComponentModel.DefaultBindingProperty('actionType')]
[String]
$ActionType,
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# Reverse the order of the returned records? when true, returns reports in chronological order
[ComponentModel.DefaultBindingProperty('reverse')]
[Management.Automation.SwitchParameter]
$Reverse
)

begin {
$NamespaceID = 'com.atproto.admin.getModerationReports'
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

