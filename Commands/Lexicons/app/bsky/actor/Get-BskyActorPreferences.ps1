function Get-BskyActorPreferences  {
<#
.Synopsis
    app.bsky.actor.getPreferences
.Description
    app.bsky.actor.getPreferences
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/getPreferences.json
#>
[Alias('Get-BlueSkyActorPreferences','bsky.actor.getPreferences','app.bsky.actor.getPreferences')]
[CmdletBinding(SupportsShouldProcess)]
param(

)

begin {
$NamespaceID = 'app.bsky.actor.getPreferences'
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

