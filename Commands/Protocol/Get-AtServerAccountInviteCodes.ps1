function Get-AtServerAccountInviteCodes  {
<#
.Synopsis
    com.atproto.server.getAccountInviteCodes
.Description
    com.atproto.server.getAccountInviteCodes
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/getAccountInviteCodes.json
#>
[Alias('PSA.com.atproto.server.getAccountInviteCodes')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('includeUsed')]
[Management.Automation.SwitchParameter]
$IncludeUsed,
[ComponentModel.DefaultBindingProperty('createAvailable')]
[Management.Automation.SwitchParameter]
$CreateAvailable
)

begin {
$NamespaceID = 'com.atproto.server.getAccountInviteCodes'
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

