function Update-AtTempRepoVersion  {
<#
.Synopsis
    com.atproto.temp.upgradeRepoVersion
.Description
    com.atproto.temp.upgradeRepoVersion
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/temp/upgradeRepoVersion.json
#>
[Alias('PSA.com.atproto.temp.upgradeRepoVersion')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
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
                ) -AsByte:$AsByte
        
}
} 

