Set-AtProtoRepoBlob
-------------------




### Synopsis
com.atproto.repo.uploadBlob



---


### Description

com.atproto.repo.uploadBlob



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/uploadBlob.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/repo/uploadBlob.json)





---


### Parameters
#### **Data**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Byte[]]`|false   |1       |true (ByPropertyName)|



#### **ContentType**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



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
Set-AtProtoRepoBlob [[-Data] <Byte[]>] [[-ContentType] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
