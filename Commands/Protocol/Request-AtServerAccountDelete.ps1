function Request-AtServerAccountDelete  {
<#
.Synopsis
    com.atproto.server.requestAccountDelete
.Description
    com.atproto.server.requestAccountDelete
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/requestAccountDelete.json
#>
[Alias('PSA.com.atproto.server.requestAccountDelete')]
[CmdletBinding(SupportsShouldProcess)]
param(

)

begin {
$NamespaceID = 'com.atproto.server.requestAccountDelete'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$parameterAliases = [Ordered]@{}


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

