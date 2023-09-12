function Watch-AtLabels  {
<#
.Synopsis
    com.atproto.label.subscribeLabels
.Description
    com.atproto.label.subscribeLabels
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/subscribeLabels.json
#>
[Alias('PSA.com.atproto.label.subscribeLabels')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The last known event to backfill from.
[ComponentModel.DefaultBindingProperty('cursor')]
[Management.Automation.PSObject]
$Cursor
)

begin {
$NamespaceID = 'com.atproto.label.subscribeLabels'
$httpMethod  = ''
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

