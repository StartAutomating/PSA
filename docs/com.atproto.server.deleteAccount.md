Remove-AtprotoServerAccount
---------------------------




### Synopsis
com.atproto.server.deleteAccount



---


### Description

com.atproto.server.deleteAccount



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/deleteAccount.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/deleteAccount.json)





---


### Parameters
#### **Did**

The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Password**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **Token**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



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
Remove-AtprotoServerAccount [[-Did] <String>] [[-Password] <String>] [[-Token] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
