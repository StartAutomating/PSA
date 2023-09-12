function Get-AtAdminRepo  {
<#
.Synopsis
    com.atproto.admin.getRepo
.Description
    com.atproto.admin.getRepo
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getRepo.json
#>
[Alias('PSA.com.atproto.admin.getRepo')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('did')]
[String]
$Did
)

begin {
$NamespaceID = 'com.atproto.admin.getRepo'
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

