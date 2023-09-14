Get-AtprotoAdminModerationActions
---------------------------------




### Synopsis
com.atproto.admin.getModerationActions



---


### Description

com.atproto.admin.getModerationActions



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationActions.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationActions.json)





---


### Parameters
#### **Subject**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Limit**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **Cursor**




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
Get-AtprotoAdminModerationActions [[-Subject] <String>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
