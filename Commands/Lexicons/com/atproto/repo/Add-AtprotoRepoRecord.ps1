function Add-AtprotoRepoRecord  {
<#
.Synopsis
    com.atproto.repo.createRecord
.Description
    com.atproto.repo.createRecord
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/createRecord.json
#>
[Alias('PSA.com.atproto.repo.createRecord')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo.
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo,
# The NSID of the record collection.
[ComponentModel.DefaultBindingProperty('collection')]
[String]
$Collection,
# The key of the record.
[ComponentModel.DefaultBindingProperty('rkey')]
[String]
$Rkey,
# Validate the record?
[ComponentModel.DefaultBindingProperty('validate')]
[Management.Automation.SwitchParameter]
$Validate,
# The record to create.
[ComponentModel.DefaultBindingProperty('record')]
[Management.Automation.PSObject]
$Record,
# Compare and swap with the previous commit by cid.
[ComponentModel.DefaultBindingProperty('swapCommit')]
[String]
$SwapCommit
)

begin {
$NamespaceID = 'com.atproto.repo.createRecord'
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

