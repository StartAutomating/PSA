Get-AtprotoSyncRecord
---------------------




### Synopsis
com.atproto.sync.getRecord



---


### Description

com.atproto.sync.getRecord



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getRecord.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/getRecord.json)





---


### Parameters
#### **Did**

The DID of the repo.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



#### **Collection**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|



#### **Rkey**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|



#### **Commit**

An optional past commit CID.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|



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
Get-AtprotoSyncRecord [-Did] <String> [-Collection] <String> [-Rkey] <String> [[-Commit] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
