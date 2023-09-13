function Get-AtProtoServerAppPasswords  {
<#
.Synopsis
    com.atproto.server.listAppPasswords
.Description
    com.atproto.server.listAppPasswords
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/listAppPasswords.json
#>
[Alias('Get-AtProtocolServerAppPasswords','atproto.server.listAppPasswords','com.atproto.server.listAppPasswords')]
[CmdletBinding(SupportsShouldProcess)]
param(

)

begin {
$NamespaceID = 'com.atproto.server.listAppPasswords'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
$parameterAliases = [Ordered]@{}
$AsByte = $false


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

