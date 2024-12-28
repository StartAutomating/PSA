function Set-AtProtoRepoWrites  {
<#
.Synopsis
    com.atproto.repo.applyWrites
.Description
    com.atproto.repo.applyWrites
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/applyWrites.json
#>
[Alias('Set-AtProtocolRepoWrites','atproto.repo.applyWrites','com.atproto.repo.applyWrites')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo (aka, current account).
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo,
# Can be set to 'false' to skip Lexicon schema validation of record data across all operations, 'true' to require it, or leave unset to validate only for known Lexicons.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('validate')]
[Management.Automation.SwitchParameter]
$Validate,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('writes')]
[Management.Automation.PSObject]
$Writes,
# If provided, the entire operation will fail if the current repo commit CID does not match this value. Used to prevent conflicting repo mutations.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('swapCommit')]
[String]
$SwapCommit,
# The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.
[Alias('Authentication','AppPassword','Credential','PSCredential')]
[Management.Automation.SwitchParameter]
$Authorization,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'com.atproto.repo.applyWrites'
$httpMethod  = 'POST'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'commit'='com.atproto.repo.defs#commitMeta'
}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
$parameterAliases = [Ordered]@{}
$DataboundParameters = @()
$AsByte = $false


    
:nextParameter foreach ($paramMetadata in 
    ([Management.Automation.CommandMetadata]$MyInvocation.MyCommand).Parameters.Values) {
    
    foreach ($attr in $paramMetadata.Attributes) {
        if ($attr -is [ComponentModel.DefaultBindingPropertyAttribute]) {
            $parameterAliases[$paramMetadata.Name] = $attr.Name
            $DataboundParameters += $paramMetadata.Name
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
                    $RestParameters =[Ordered]@{}
                    foreach ($parameterName in $DataboundParameters) {
                        if ($null -ne $_.($ParameterName)) {
                            $RestParameters[$parameterName] = $_.($ParameterName)
                        }
                    }
                    $RestParameters
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
                ) -Raw:$Raw -Authorization {
                    if ($_.Authorization) { 
                        $_.Authorization
                    } else { 
                        $null
                    }
                }
        
}
} 

