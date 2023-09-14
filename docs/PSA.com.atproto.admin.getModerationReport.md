Get-AtprotoAdminModerationReport
--------------------------------




### Synopsis
com.atproto.admin.getModerationReport



---


### Description

com.atproto.admin.getModerationReport



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationReport.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getModerationReport.json)





---


### Parameters
#### **Id**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|true    |1       |true (ByPropertyName)|



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
Get-AtprotoAdminModerationReport [-Id] <PSObject> [-WhatIf] [-Confirm] [<CommonParameters>]
```