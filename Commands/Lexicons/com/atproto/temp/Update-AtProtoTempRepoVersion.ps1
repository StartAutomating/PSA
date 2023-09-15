function Update-AtProtoTempRepoVersion  {
<#
.Synopsis
    com.atproto.temp.upgradeRepoVersion
.Description
    com.atproto.temp.upgradeRepoVersion
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/temp/upgradeRepoVersion.json
#>
[Alias('Update-AtProtocolTempRepoVersion','atproto.temp.upgradeRepoVersion','com.atproto.temp.upgradeRepoVersion')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('force')]
[Management.Automation.SwitchParameter]
$Force
)

begin {
$NamespaceID = 'com.atproto.temp.upgradeRepoVersion'
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
                ) -AsByte:$AsByte -Property {
                    $_
                } -Cache:$(
                    if ($cache) {$cache} else { $false }
                )
        
}
} 

