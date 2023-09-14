Invoke-AtProtoAdminModerationAction
-----------------------------------




### Synopsis
com.atproto.admin.takeModerationAction



---


### Description

com.atproto.admin.takeModerationAction



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/takeModerationAction.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/takeModerationAction.json)





---


### Parameters
#### **Action**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



#### **Subject**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |



#### **SubjectBlobCids**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |3       |false        |



#### **CreateLabelVals**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |4       |false        |



#### **NegateLabelVals**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |5       |false        |



#### **Reason**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



#### **DurationInHours**

Indicates how long this action was meant to be in effect before automatically expiring.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |7       |false        |



#### **CreatedBy**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |



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
Invoke-AtProtoAdminModerationAction [[-Action] <String>] [[-Subject] <PSObject>] [[-SubjectBlobCids] <PSObject>] [[-CreateLabelVals] <PSObject>] [[-NegateLabelVals] <PSObject>] [[-Reason] <String>] [[-DurationInHours] <PSObject>] [[-CreatedBy] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
