Add-AtprotoModerationReport
---------------------------




### Synopsis
com.atproto.moderation.createReport



---


### Description

com.atproto.moderation.createReport



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/moderation/createReport.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/moderation/createReport.json)





---


### Parameters
#### **ReasonType**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|



#### **Reason**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **Subject**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |3       |true (ByPropertyName)|



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
Add-AtprotoModerationReport [[-ReasonType] <PSObject>] [[-Reason] <String>] [[-Subject] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
