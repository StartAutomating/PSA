function Get-AtRepoRecord  {
<#
.Synopsis
    com.atproto.repo.getRecord
.Description
    com.atproto.repo.getRecord
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/getRecord.json
#>
[Alias('PSA.com.atproto.repo.getRecord')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo,
# The NSID of the record collection.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('collection')]
[String]
$Collection,
# The key of the record.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('rkey')]
[String]
$Rkey,
# The CID of the version of the record. If not specified, then return the most recent version.
[ComponentModel.DefaultBindingProperty('cid')]
[String]
$Cid
)

begin {
$NamespaceID = 'com.atproto.repo.getRecord'
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

