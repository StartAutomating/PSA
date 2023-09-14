function Get-AtProtoRepoRecords  {
<#
.Synopsis
    com.atproto.repo.listRecords
.Description
    com.atproto.repo.listRecords
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/listRecords.json
#>
[Alias('Get-AtProtocolRepoRecords','atproto.repo.listRecords','com.atproto.repo.listRecords')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo,
# The NSID of the record type.
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('collection')]
[String]
$Collection,
# The number of records to return.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
<#
A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# DEPRECATED: The lowest sort-ordered rkey to start from (exclusive)
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('rkeyStart')]
[String]
$RkeyStart,
# DEPRECATED: The highest sort-ordered rkey to stop at (exclusive)
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('rkeyEnd')]
[String]
$RkeyEnd,
# Reverse the order of the returned records?
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reverse')]
[Management.Automation.SwitchParameter]
$Reverse
)

begin {
$NamespaceID = 'com.atproto.repo.listRecords'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'records'='#record'
}
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

