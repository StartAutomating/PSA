function Add-AtServerInviteCodes  {
<#
.Synopsis
    com.atproto.server.createInviteCodes
.Description
    com.atproto.server.createInviteCodes
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createInviteCodes.json
#>
[Alias('PSA.com.atproto.server.createInviteCodes')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('codeCount')]
[Management.Automation.PSObject]
$CodeCount,
[ComponentModel.DefaultBindingProperty('useCount')]
[Management.Automation.PSObject]
$UseCount,
[ComponentModel.DefaultBindingProperty('forAccounts')]
[Management.Automation.PSObject]
$ForAccounts
)

begin {
$NamespaceID = 'com.atproto.server.createInviteCodes'
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

