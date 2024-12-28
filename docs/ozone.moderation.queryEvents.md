Search-OzoneModerationEvents
----------------------------

### Synopsis
tools.ozone.moderation.queryEvents

---

### Description

tools.ozone.moderation.queryEvents

---

### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryEvents.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/moderation/queryEvents.json)

---

### Parameters
#### **Types**
The types of events (fully qualified string in the format of tools.ozone.moderation.defs#modEvent<name>) to filter by. If not specified, all events are returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|

#### **CreatedBy**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **SortDirection**
Sort direction for the events. Defaults to descending order of created at timestamp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **CreatedAfter**
Retrieve events created after a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **CreatedBefore**
Retrieve events created before a given timestamp

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **Subject**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **Collections**
If specified, only events where the subject belongs to the given collections will be returned. When subjectType is set to 'account', this will be ignored.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |7       |true (ByPropertyName)|

#### **SubjectType**
If specified, only events where the subject is of the given type (account or record) will be returned. When this is set to 'account' the 'collections' parameter will be ignored. When includeAllUserRecords or subject is set, this will be ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **IncludeAllUserRecords**
If true, events on all record types (posts, lists, profile etc.) or records from given 'collections' param, owned by the did are returned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Limit**
A limit to the number of results returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |9       |true (ByPropertyName)|

#### **HasComment**
If true, only events with comments are returned

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Comment**
If specified, only events with comments containing the keyword are returned. Apply || separator to use multiple keywords and match using OR condition.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |10      |true (ByPropertyName)|

#### **AddedLabels**
If specified, only events where all of these labels were added are returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |11      |true (ByPropertyName)|

#### **RemovedLabels**
If specified, only events where all of these labels were removed are returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |12      |true (ByPropertyName)|

#### **AddedTags**
If specified, only events where all of these tags were added are returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |13      |true (ByPropertyName)|

#### **RemovedTags**
If specified, only events where all of these tags were removed are returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |14      |true (ByPropertyName)|

#### **ReportTypes**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |15      |true (ByPropertyName)|

#### **Cursor**
A cursor that can be used to get more results.
Any command that accepts a -Cursor parameter returns a .Cursor property.
You can provide this -Cursor to the same command with the same input to get more results.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |16      |true (ByPropertyName)|

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
Search-OzoneModerationEvents [[-Types] <PSObject>] [[-CreatedBy] <String>] [[-SortDirection] <String>] [[-CreatedAfter] <String>] [[-CreatedBefore] <String>] [[-Subject] <String>] [[-Collections] <PSObject>] [[-SubjectType] <String>] [-IncludeAllUserRecords] [[-Limit] <PSObject>] [-HasComment] [[-Comment] <String>] [[-AddedLabels] <PSObject>] [[-RemovedLabels] <PSObject>] [[-AddedTags] <PSObject>] [[-RemovedTags] <PSObject>] [[-ReportTypes] <PSObject>] [[-Cursor] <String>] [-Cache] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
