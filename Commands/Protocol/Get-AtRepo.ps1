function Get-AtRepo  {
<#
.Synopsis
    com.atproto.repo.describeRepo
.Description
    com.atproto.repo.describeRepo
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/describeRepo.json
#>
[Alias('PSA.com.atproto.repo.describeRepo')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The handle or DID of the repo.
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('repo')]
[String]
$Repo
)

begin {
$NamespaceID = 'com.atproto.repo.describeRepo'
$httpMethod  = 'GET'
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

