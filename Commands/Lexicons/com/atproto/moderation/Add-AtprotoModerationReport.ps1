function Add-AtprotoModerationReport  {
<#
.Synopsis
    com.atproto.moderation.createReport
.Description
    com.atproto.moderation.createReport
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/moderation/createReport.json
#>
[Alias('PSA.com.atproto.moderation.createReport')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('reasonType')]
[Management.Automation.PSObject]
$ReasonType,
[ComponentModel.DefaultBindingProperty('reason')]
[String]
$Reason,
[ComponentModel.DefaultBindingProperty('subject')]
[Management.Automation.PSObject]
$Subject
)

begin {
$NamespaceID = 'com.atproto.moderation.createReport'
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

