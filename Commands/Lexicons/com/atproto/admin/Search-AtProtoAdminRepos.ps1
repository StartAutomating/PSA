function Search-AtProtoAdminRepos  {
<#
.Synopsis
    com.atproto.admin.searchRepos
.Description
    com.atproto.admin.searchRepos
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/searchRepos.json
#>
[Alias('Search-AtProtocolAdminRepos','atproto.admin.searchRepos','com.atproto.admin.searchRepos')]
[CmdletBinding(SupportsShouldProcess)]
param(
[ComponentModel.DefaultBindingProperty('term')]
[String]
$Term,
[ComponentModel.DefaultBindingProperty('invitedBy')]
[String]
$InvitedBy,
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor
)

begin {
$NamespaceID = 'com.atproto.admin.searchRepos'
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

