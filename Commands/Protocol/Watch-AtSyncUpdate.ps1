function Watch-AtSyncUpdate  {
<#
.Synopsis
    com.atproto.sync.notifyOfUpdate
.Description
    com.atproto.sync.notifyOfUpdate
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/notifyOfUpdate.json
#>
[Alias('PSA.com.atproto.sync.notifyOfUpdate')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Hostname of the service that is notifying of update.
[ComponentModel.DefaultBindingProperty('hostname')]
[String]
$Hostname
)

begin {
$NamespaceID = 'com.atproto.sync.notifyOfUpdate'
$httpMethod  = 'POST'
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

