function Get-AtRepoRecords  {
<#
.Synopsis
    com.atproto.repo.listRecords
.Description
    com.atproto.repo.listRecords
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/listRecords.json
#>
[Alias('PSA.com.atproto.repo.listRecords')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo,
# The NSID of the record type.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('collection')]
[String]
$Collection,
# The number of records to return.
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# DEPRECATED: The lowest sort-ordered rkey to start from (exclusive)
[ComponentModel.DefaultBindingProperty('rkeyStart')]
[String]
$RkeyStart,
# DEPRECATED: The highest sort-ordered rkey to stop at (exclusive)
[ComponentModel.DefaultBindingProperty('rkeyEnd')]
[String]
$RkeyEnd,
# Reverse the order of the returned records?
[ComponentModel.DefaultBindingProperty('reverse')]
[Management.Automation.SwitchParameter]
$Reverse
)

begin {
$NamespaceID = 'com.atproto.repo.listRecords'
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

