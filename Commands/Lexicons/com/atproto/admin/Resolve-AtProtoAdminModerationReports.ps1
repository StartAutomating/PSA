function Resolve-AtProtoAdminModerationReports  {
<#
.Synopsis
    com.atproto.admin.resolveModerationReports
.Description
    com.atproto.admin.resolveModerationReports
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/resolveModerationReports.json
#>
[Alias('Resolve-AtProtocolAdminModerationReports','atproto.admin.resolveModerationReports','com.atproto.admin.resolveModerationReports')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('actionId')]
[Management.Automation.PSObject]
$ActionId,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reportIds')]
[Management.Automation.PSObject]
$ReportIds,
[Parameter(ValueFromPipelineByPropertyName)]
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

