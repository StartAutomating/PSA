Resolve-AtProtoAdminModerationReports
-------------------------------------




### Synopsis
com.atproto.admin.resolveModerationReports



---


### Description

com.atproto.admin.resolveModerationReports



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/resolveModerationReports.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/resolveModerationReports.json)





---


### Parameters
#### **ActionId**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|



#### **ReportIds**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **CreatedBy**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



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
Resolve-AtProtoAdminModerationReports [[-ActionId] <PSObject>] [[-ReportIds] <PSObject>] [[-CreatedBy] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
