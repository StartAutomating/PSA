Set-AtProtoRepoRecord
---------------------




### Synopsis
com.atproto.repo.putRecord



---


### Description

com.atproto.repo.putRecord



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/putRecord.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/putRecord.json)





---


### Parameters
#### **Repo**

The handle or DID of the repo.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



#### **Collection**

The NSID of the record collection.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



#### **Rkey**

The key of the record.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



#### **Validate**

Validate the record?






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



#### **Record**

The record to write.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |4       |false        |



#### **SwapRecord**

Compare and swap with the previous record by cid.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |



#### **SwapCommit**

Compare and swap with the previous commit by cid.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |



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
Set-AtProtoRepoRecord [[-Repo] <String>] [[-Collection] <String>] [[-Rkey] <String>] [-Validate] [[-Record] <PSObject>] [[-SwapRecord] <String>] [[-SwapCommit] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
