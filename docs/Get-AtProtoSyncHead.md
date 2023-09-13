Get-AtProtoSyncHead
-------------------




### Synopsis
com.atproto.sync.getHead



---


### Description

com.atproto.sync.getHead



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getHead.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getHead.json)





---


### Parameters
#### **Did**

The DID of the repo.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



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
Get-AtProtoSyncHead [-Did] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```
