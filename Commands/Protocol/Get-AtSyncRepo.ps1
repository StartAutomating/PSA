function Get-AtSyncRepo  {
<#
.Synopsis
    com.atproto.sync.getRepo
.Description
    com.atproto.sync.getRepo
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getRepo.json
#>
[Alias('PSA.com.atproto.sync.getRepo')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
# The revision of the repo to catch up from.
[ComponentModel.DefaultBindingProperty('since')]
[String]
$Since
)

begin {
$NamespaceID = 'com.atproto.sync.getRepo'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
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

