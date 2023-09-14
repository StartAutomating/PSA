function Get-AtProtoServerAccountInviteCodes  {
<#
.Synopsis
    com.atproto.server.getAccountInviteCodes
.Description
    com.atproto.server.getAccountInviteCodes
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/getAccountInviteCodes.json
#>
[Alias('Get-AtProtocolServerAccountInviteCodes','atproto.server.getAccountInviteCodes','com.atproto.server.getAccountInviteCodes')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('includeUsed')]
[Management.Automation.SwitchParameter]
$IncludeUsed,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createAvailable')]
[Management.Automation.SwitchParameter]
$CreateAvailable,
# If set, will cache results for performance.
[Management.Automation.SwitchParameter]
$Cache
)

begin {
$NamespaceID = 'com.atproto.server.getAccountInviteCodes'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'codes'='com.atproto.server.defs#inviteCode'
}
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

