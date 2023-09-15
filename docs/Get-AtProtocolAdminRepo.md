Get-AtprotoAdminRepo
--------------------




### Synopsis
com.atproto.admin.getRepo



---


### Description

com.atproto.admin.getRepo



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getRepo.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/admin/getRepo.json)





---


### Parameters
#### **Did**

The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



#### **Cache**

If set, will cache results for performance.






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
Get-AtprotoAdminRepo [-Did] <String> [-Cache] [-WhatIf] [-Confirm] [<CommonParameters>]
```
