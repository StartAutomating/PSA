Watch-AtProtoLabels
-------------------




### Synopsis
com.atproto.label.subscribeLabels



---


### Description

com.atproto.label.subscribeLabels



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/subscribeLabels.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/subscribeLabels.json)





---


### Parameters
#### **Cursor**

The last known event to backfill from.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |1       |false        |



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
Watch-AtProtoLabels [[-Cursor] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
