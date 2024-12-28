function Search-OzoneModerationStatuses  {
<#
.Synopsis
    tools.ozone.moderation.queryStatuses
.Description
    tools.ozone.moderation.queryStatuses
.Link
    https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryStatuses.json
#>
[Alias('ozone.moderation.queryStatuses','tools.ozone.moderation.queryStatuses')]
[CmdletBinding(SupportsShouldProcess)]
param(
# Number of queues being used by moderators. Subjects will be split among all queues.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('queueCount')]
[Management.Automation.PSObject]
$QueueCount,
# Index of the queue to fetch subjects from. Works only when queueCount value is specified.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('queueIndex')]
[Management.Automation.PSObject]
$QueueIndex,
# A seeder to shuffle/balance the queue items.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('queueSeed')]
[String]
$QueueSeed,
# All subjects, or subjects from given 'collections' param, belonging to the account specified in the 'subject' param will be returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('includeAllUserRecords')]
[Management.Automation.SwitchParameter]
$IncludeAllUserRecords,
# The subject to get the status for.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subject')]
[String]
$Subject,
# Search subjects by keyword from comments
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('comment')]
[String]
$Comment,
# Search subjects reported after a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reportedAfter')]
[String]
$ReportedAfter,
# Search subjects reported before a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reportedBefore')]
[String]
$ReportedBefore,
# Search subjects reviewed after a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reviewedAfter')]
[String]
$ReviewedAfter,
# Search subjects where the associated record/account was deleted after a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostingDeletedAfter')]
[String]
$HostingDeletedAfter,
# Search subjects where the associated record/account was deleted before a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostingDeletedBefore')]
[String]
$HostingDeletedBefore,
# Search subjects where the associated record/account was updated after a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostingUpdatedAfter')]
[String]
$HostingUpdatedAfter,
# Search subjects where the associated record/account was updated before a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostingUpdatedBefore')]
[String]
$HostingUpdatedBefore,
# Search subjects by the status of the associated record/account
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('hostingStatuses')]
[Management.Automation.PSObject]
$HostingStatuses,
# Search subjects reviewed before a given timestamp
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reviewedBefore')]
[String]
$ReviewedBefore,
# By default, we don't include muted subjects in the results. Set this to true to include them.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('includeMuted')]
[Management.Automation.SwitchParameter]
$IncludeMuted,
# When set to true, only muted subjects and reporters will be returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('onlyMuted')]
[Management.Automation.SwitchParameter]
$OnlyMuted,
# Specify when fetching subjects in a certain state
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('reviewState')]
[String]
$ReviewState,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('ignoreSubjects')]
[Management.Automation.PSObject]
$IgnoreSubjects,
# Get all subject statuses that were reviewed by a specific moderator
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('lastReviewedBy')]
[String]
$LastReviewedBy,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('sortField')]
[String]
$SortField,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('sortDirection')]
[String]
$SortDirection,
# Get subjects that were taken down
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('takendown')]
[Management.Automation.SwitchParameter]
$Takendown,
# Get subjects in unresolved appealed status
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('appealed')]
[Management.Automation.SwitchParameter]
$Appealed,
# A limit to the number of results returned.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('limit')]
[Management.Automation.PSObject]
$Limit,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('tags')]
[Management.Automation.PSObject]
$Tags,
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('excludeTags')]
[Management.Automation.PSObject]
$ExcludeTags,
<#
A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('cursor')]
[String]
$Cursor,
# If specified, subjects belonging to the given collections will be returned. When subjectType is set to 'account', this will be ignored.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('collections')]
[Management.Automation.PSObject]
$Collections,
# If specified, subjects of the given type (account or record) will be returned. When this is set to 'account' the 'collections' parameter will be ignored. When includeAllUserRecords or subject is set, this will be ignored.
[Parameter(ValueFromPipelineByPropertyName)]
[ComponentModel.DefaultBindingProperty('subjectType')]
[String]
$SubjectType,
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
$NamespaceID = 'tools.ozone.moderation.queryStatuses'
$httpMethod  = 'GET'
$InvokeAtSplat = [Ordered]@{Method=$httpMethod}
$InvokeAtSplat.DecorateProperty = [Ordered]@{
    'subjectStatuses'='tools.ozone.moderation.defs#subjectStatusView'
    'subjectStatuses.reviewState'='tools.ozone.moderation.defs#subjectReviewState'
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

