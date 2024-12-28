Search-OzoneModerationStatuses
------------------------------

### Synopsis
tools.ozone.moderation.queryStatuses

---

### Description

tools.ozone.moderation.queryStatuses

---

### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryStatuses.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryStatuses.json)

---

### Parameters
#### **QueueCount**
Number of queues being used by moderators. Subjects will be split among all queues.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|

#### **QueueIndex**
Index of the queue to fetch subjects from. Works only when queueCount value is specified.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|

#### **QueueSeed**
A seeder to shuffle/balance the queue items.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **IncludeAllUserRecords**
All subjects, or subjects from given 'collections' param, belonging to the account specified in the 'subject' param will be returned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Subject**
The subject to get the status for.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Comment**
Search subjects by keyword from comments

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **ReportedAfter**
Search subjects reported after a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **ReportedBefore**
Search subjects reported before a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **ReviewedAfter**
Search subjects reviewed after a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **HostingDeletedAfter**
Search subjects where the associated record/account was deleted after a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |9       |true (ByPropertyName)|

#### **HostingDeletedBefore**
Search subjects where the associated record/account was deleted before a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |10      |true (ByPropertyName)|

#### **HostingUpdatedAfter**
Search subjects where the associated record/account was updated after a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |11      |true (ByPropertyName)|

#### **HostingUpdatedBefore**
Search subjects where the associated record/account was updated before a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |12      |true (ByPropertyName)|

#### **HostingStatuses**
Search subjects by the status of the associated record/account

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |13      |true (ByPropertyName)|

#### **ReviewedBefore**
Search subjects reviewed before a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |14      |true (ByPropertyName)|

#### **IncludeMuted**
By default, we don't include muted subjects in the results. Set this to true to include them.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **OnlyMuted**
When set to true, only muted subjects and reporters will be returned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ReviewState**
Specify when fetching subjects in a certain state

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |15      |true (ByPropertyName)|

#### **IgnoreSubjects**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |16      |true (ByPropertyName)|

#### **LastReviewedBy**
Get all subject statuses that were reviewed by a specific moderator

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |17      |true (ByPropertyName)|

#### **SortField**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |18      |true (ByPropertyName)|

#### **SortDirection**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |19      |true (ByPropertyName)|

#### **Takendown**
Get subjects that were taken down

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Appealed**
Get subjects in unresolved appealed status

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Limit**
A limit to the number of results returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |20      |true (ByPropertyName)|

#### **Tags**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |21      |true (ByPropertyName)|

#### **ExcludeTags**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |22      |true (ByPropertyName)|

#### **Cursor**
A cursor that can be used to get more results.
Any command that accepts a -Cursor parameter returns a .Cursor property.
You can provide this -Cursor to the same command with the same input to get more results.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |23      |true (ByPropertyName)|

#### **Collections**
If specified, subjects belonging to the given collections will be returned. When subjectType is set to 'account', this will be ignored.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |24      |true (ByPropertyName)|

#### **SubjectType**
If specified, subjects of the given type (account or record) will be returned. When this is set to 'account' the 'collections' parameter will be ignored. When includeAllUserRecords or subject is set, this will be ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |25      |true (ByPropertyName)|

#### **Cache**
If set, will cache results for performance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Authorization**
The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.

|Type      |Required|Position|PipelineInput|Aliases                                                       |
|----------|--------|--------|-------------|--------------------------------------------------------------|
|`[Switch]`|false   |named   |false        |Authentication<br/>AppPassword<br/>Credential<br/>PSCredential|

#### **Raw**
If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Search-OzoneModerationStatuses [[-QueueCount] <PSObject>] [[-QueueIndex] <PSObject>] [[-QueueSeed] <String>] [-IncludeAllUserRecords] [[-Subject] <String>] [[-Comment] <String>] [[-ReportedAfter] <String>] [[-ReportedBefore] <String>] [[-ReviewedAfter] <String>] [[-HostingDeletedAfter] <String>] [[-HostingDeletedBefore] <String>] [[-HostingUpdatedAfter] <String>] [[-HostingUpdatedBefore] <String>] [[-HostingStatuses] <PSObject>] [[-ReviewedBefore] <String>] [-IncludeMuted] [-OnlyMuted] [[-ReviewState] <String>] [[-IgnoreSubjects] <PSObject>] [[-LastReviewedBy] <String>] [[-SortField] <String>] [[-SortDirection] <String>] [-Takendown] [-Appealed] [[-Limit] <PSObject>] [[-Tags] <PSObject>] [[-ExcludeTags] <PSObject>] [[-Cursor] <String>] [[-Collections] <PSObject>] [[-SubjectType] <String>] [-Cache] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
