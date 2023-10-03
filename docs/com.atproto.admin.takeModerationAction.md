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




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Subject**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **SubjectBlobCids**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |3       |true (ByPropertyName)|



#### **CreateLabelVals**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|



#### **NegateLabelVals**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |5       |true (ByPropertyName)|



#### **Reason**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|



#### **DurationInHours**

Indicates how long this action was meant to be in effect before automatically expiring.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |7       |true (ByPropertyName)|



#### **CreatedBy**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|



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
Invoke-AtProtoAdminModerationAction [[-Action] <String>] [[-Subject] <PSObject>] [[-SubjectBlobCids] <PSObject>] [[-CreateLabelVals] <PSObject>] [[-NegateLabelVals] <PSObject>] [[-Reason] <String>] [[-DurationInHours] <PSObject>] [[-CreatedBy] <String>] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
