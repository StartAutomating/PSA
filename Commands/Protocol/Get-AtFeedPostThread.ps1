function Get-AtFeedPostThread  {
<#
.Synopsis
    app.bsky.feed.getPostThread
.Description
    app.bsky.feed.getPostThread
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getPostThread.json
#>
[Alias('PSA.app.bsky.feed.getPostThread')]
[CmdletBinding(SupportsShouldProcess)]
param(
[Parameter(Mandatory)]
[ComponentModel.DefaultBindingProperty('uri')]
[String]
$Uri,
[ComponentModel.DefaultBindingProperty('depth')]
[Management.Automation.PSObject]
$Depth,
[ComponentModel.DefaultBindingProperty('parentHeight')]
[Management.Automation.PSObject]
$ParentHeight
)

begin {
$NamespaceID = 'app.bsky.feed.getPostThread'
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

