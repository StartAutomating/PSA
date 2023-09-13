Get-AtprotoAdminModerationReports
---------------------------------




### Synopsis
com.atproto.admin.getModerationReports



---


### Description

com.atproto.admin.getModerationReports



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationReports.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationReports.json)





---


### Parameters
#### **Subject**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **IgnoreSubjects**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **ActionedBy**

Get all reports that were actioned by a specific moderator






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



#### **Reporters**

Filter reports made by one or more DIDs






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|



#### **Resolved**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



#### **ActionType**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|



#### **Limit**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |6       |true (ByPropertyName)|



#### **Cursor**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|



#### **Reverse**

Reverse the order of the returned records? when true, returns reports in chronological order






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



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
Get-AtprotoAdminModerationReports [[-Subject] <String>] [[-IgnoreSubjects] <PSObject>] [[-ActionedBy] <String>] [[-Reporters] <PSObject>] [-Resolved] [[-ActionType] <String>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-Reverse] [-WhatIf] [-Confirm] [<CommonParameters>]
```
