Set-AtProtoRepoWrites
---------------------




### Synopsis
com.atproto.repo.applyWrites



---


### Description

com.atproto.repo.applyWrites



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/applyWrites.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/applyWrites.json)





---


### Parameters
#### **Repo**

The handle or DID of the repo.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



#### **Validate**

Validate the records?






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



#### **Writes**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |



#### **SwapCommit**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



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
Set-AtProtoRepoWrites [[-Repo] <String>] [-Validate] [[-Writes] <PSObject>] [[-SwapCommit] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
