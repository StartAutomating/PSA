function Add-AtProtoServerInviteCode  {
<#
.Synopsis
    com.atproto.server.createInviteCode
.Description
    com.atproto.server.createInviteCode
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createInviteCode.json
#>
[Alias('Add-AtProtocolServerInviteCode','atproto.server.createInviteCode','com.atproto.server.createInviteCode')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('useCount')]
[Management.Automation.PSObject]
$UseCount,
[ComponentModel.DefaultBindingProperty('forAccount')]
[String]
$ForAccount
)

begin {
$NamespaceID = 'com.atproto.server.createInviteCode'
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

