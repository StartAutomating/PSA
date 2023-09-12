function Get-AtSyncBlocks  {
<#
.Synopsis
    com.atproto.sync.getBlocks
.Description
    com.atproto.sync.getBlocks
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getBlocks.json
#>
[Alias('PSA.com.atproto.sync.getBlocks')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('cids')]
[Management.Automation.PSObject]
$Cids
)

begin {
$NamespaceID = 'com.atproto.sync.getBlocks'
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

