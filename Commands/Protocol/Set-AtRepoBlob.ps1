function Set-AtRepoBlob  {
<#
.Synopsis
    com.atproto.repo.uploadBlob
.Description
    com.atproto.repo.uploadBlob
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/uploadBlob.json
#>
[Alias('PSA.com.atproto.repo.uploadBlob')]
[CmdletBinding(SupportsShouldProcess)]
param(

)

begin {
$NamespaceID = 'com.atproto.repo.uploadBlob'
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

