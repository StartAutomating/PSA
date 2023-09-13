function Request-AtProtoSyncCrawl  {
<#
.Synopsis
    com.atproto.sync.requestCrawl
.Description
    com.atproto.sync.requestCrawl
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/requestCrawl.json
#>
[Alias('Request-AtProtocolSyncCrawl','atproto.sync.requestCrawl','com.atproto.sync.requestCrawl')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Hostname of the service that is requesting to be crawled.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostname')]
[String]
$Hostname
)

begin {
$NamespaceID = 'com.atproto.sync.requestCrawl'
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

