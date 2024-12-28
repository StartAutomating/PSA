function Search-OzoneModerationEvents  {
<#
.Synopsis
    tools.ozone.moderation.queryEvents
.Description
    tools.ozone.moderation.queryEvents
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryEvents.json
#>
[Alias('ozone.moderation.queryEvents','tools.ozone.moderation.queryEvents')]
[CmdletBinding(SupportsShouldProcess)]
param(
# The types of events (fully qualified string in the format of tools.ozone.moderation.defs#modEvent<name>) to filter by. If not specified, all events are returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('types')]
[Management.Automation.PSObject]
$Types,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createdBy')]
[String]
$CreatedBy,
# Sort direction for the events. Defaults to descending order of created at timestamp.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('sortDirection')]
[String]
$SortDirection,
# Retrieve events created after a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createdAfter')]
[String]
$CreatedAfter,
# Retrieve events created before a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('createdBefore')]
[String]
$CreatedBefore,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subject')]
[String]
$Subject,
# If specified, only events where the subject belongs to the given collections will be returned. When subjectType is set to 'account', this will be ignored.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('collections')]
[Management.Automation.PSObject]
$Collections,
# If specified, only events where the subject is of the given type (account or record) will be returned. When this is set to 'account' the 'collections' parameter will be ignored. When includeAllUserRecords or subject is set, this will be ignored.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subjectType')]
[String]
$SubjectType,
# If true, events on all record types (posts, lists, profile etc.) or records from given 'collections' param, owned by the did are returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('includeAllUserRecords')]
[Management.Automation.SwitchParameter]
$IncludeAllUserRecords,
# A limit to the number of results returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
# If true, only events with comments are returned
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hasComment')]
[Management.Automation.SwitchParameter]
$HasComment,
# If specified, only events with comments containing the keyword are returned. Apply || separator to use multiple keywords and match using OR condition.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('comment')]
[String]
$Comment,
# If specified, only events where all of these labels were added are returned
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('addedLabels')]
[Management.Automation.PSObject]
$AddedLabels,
# If specified, only events where all of these labels were removed are returned
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('removedLabels')]
[Management.Automation.PSObject]
$RemovedLabels,
# If specified, only events where all of these tags were added are returned
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('addedTags')]
[Management.Automation.PSObject]
$AddedTags,
# If specified, only events where all of these tags were removed are returned
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('removedTags')]
[Management.Automation.PSObject]
$RemovedTags,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reportTypes')]
[Management.Automation.PSObject]
$ReportTypes,
<#
A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# If set, will cache results for performance.
[Management.Automation.SwitchParameter]
$Cache,
# The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.
[Alias('Authentication','AppPassword','Credential','PSCredential')]
[Management.Automation.SwitchParameter]
$Authorization,
# If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.
[Management.Automation.SwitchParameter]
$Raw
)

begin {
$NamespaceID = 'tools.ozone.moderation.queryEvents'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'events'='tools.ozone.moderation.defs#modEventView'
}
$InvokeAtSplat["PSTypeName"] = $NamespaceID
$parameterAliases = [Ordered]@{}
$DataboundParameters = @()
$AsByte = $false


    
:nextParameter foreach ($paramMetadata in 
    ([Management.Automation.CommandMetadata]$MyInvocation.MyCommand).Parameters.Values) {
    
    foreach ($attr in $paramMetadata.Attributes) {
        if ($attr -is [ComponentModel.DefaultBindingPropertyAttribute]) {
            $parameterAliases[$paramMetadata.Name] = $attr.Name
            $DataboundParameters += $paramMetadata.Name
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
                    $RestParameters =[Ordered]@{}
                    foreach ($parameterName in $DataboundParameters) {
                        if ($null -ne $_.($ParameterName)) {
                            $RestParameters[$parameterName] = $_.($ParameterName)
                        }
                    }
                    $RestParameters
                } -ParameterAlias $parameterAliases @InvokeAtSplat -ContentType $(
                    if ($ContentType) {
                        $ContentType
                    } else {
                        "application/json"   
                    }
                ) -AsByte:$AsByte -Property {
                    $_
                } -Cache:$(
                    if ($cache) {$cache} else { $false }
                ) -Raw:$Raw -Authorization {
                    if ($_.Authorization) { 
                        $_.Authorization
                    } else { 
                        $null
                    }
                }
        
}
} 

