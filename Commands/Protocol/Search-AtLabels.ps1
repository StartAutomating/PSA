function Search-AtLabels  {
<#
.Synopsis
    com.atproto.label.queryLabels
.Description
    com.atproto.label.queryLabels
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/queryLabels.json
#>
[Alias('PSA.com.atproto.label.queryLabels')]
[CmdletBinding(SupportsShouldProcess)]
param(
# List of AT URI patterns to match (boolean 'OR'). Each may be a prefix (ending with '*'; will match inclusive of the string leading to '*'), or a full URI
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('uriPatterns')]
[Management.Automation.PSObject]
$UriPatterns,
# Optional list of label sources (DIDs) to filter on
[ComponentModel.DefaultBindingProperty('sources')]
[Management.Automation.PSObject]
$Sources,
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor
)

begin {
$NamespaceID = 'com.atproto.label.queryLabels'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
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

