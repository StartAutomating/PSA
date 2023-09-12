function Get-AtSyncRecord  {
<#
.Synopsis
    com.atproto.sync.getRecord
.Description
    com.atproto.sync.getRecord
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getRecord.json
#>
[Alias('PSA.com.atproto.sync.getRecord')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did,
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('collection')]
[String]
$Collection,
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('rkey')]
[String]
$Rkey,
# An optional past commit CID.
[ComponentModel.DefaultBindingProperty('commit')]
[String]
$Commit
)

begin {
$NamespaceID = 'com.atproto.sync.getRecord'
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

