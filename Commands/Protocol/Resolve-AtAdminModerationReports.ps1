function Resolve-AtAdminModerationReports  {
<#
.Synopsis
    com.atproto.admin.resolveModerationReports
.Description
    com.atproto.admin.resolveModerationReports
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/resolveModerationReports.json
#>
[Alias('PSA.com.atproto.admin.resolveModerationReports')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('actionId')]
[Management.Automation.PSObject]
$ActionId,
[ComponentModel.DefaultBindingProperty('reportIds')]
[Management.Automation.PSObject]
$ReportIds,
[ComponentModel.DefaultBindingProperty('createdBy')]
[String]
$CreatedBy
)

begin {
$NamespaceID = 'com.atproto.admin.resolveModerationReports'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
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

