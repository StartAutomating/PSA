function Undo-AtProtoAdminModerationAction  {
<#
.Synopsis
    com.atproto.admin.reverseModerationAction
.Description
    com.atproto.admin.reverseModerationAction
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/reverseModerationAction.json
#>
[Alias('Undo-AtProtocolAdminModerationAction','atproto.admin.reverseModerationAction','com.atproto.admin.reverseModerationAction')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('id')]
[Management.Automation.PSObject]
$Id,
[ComponentModel.DefaultBindingProperty('reason')]
[String]
$Reason,
[ComponentModel.DefaultBindingProperty('createdBy')]
[String]
$CreatedBy
)

begin {
$NamespaceID = 'com.atproto.admin.reverseModerationAction'
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

