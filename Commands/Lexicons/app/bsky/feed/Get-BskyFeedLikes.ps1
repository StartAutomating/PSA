function Get-BskyFeedLikes  {
<#
.Synopsis
    app.bsky.feed.getLikes
.Description
    app.bsky.feed.getLikes
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getLikes.json
#>
[Alias('Get-BlueSkyFeedLikes','bsky.feed.getLikes','app.bsky.feed.getLikes')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory,ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('uri')]
[String]
$Uri,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cid')]
[String]
$Cid,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor
)

begin {
$NamespaceID = 'app.bsky.feed.getLikes'
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

