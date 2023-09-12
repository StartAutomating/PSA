function Set-AtUnspeccedLabels  {
<#
.Synopsis
    app.bsky.unspecced.applyLabels
.Description
    app.bsky.unspecced.applyLabels
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/applyLabels.json
#>
[Alias('PSA.app.bsky.unspecced.applyLabels')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('labels')]
[Management.Automation.PSObject]
$Labels
)

begin {
$NamespaceID = 'app.bsky.unspecced.applyLabels'
$httpMethod  = 'POST'
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

