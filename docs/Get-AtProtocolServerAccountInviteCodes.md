Get-AtprotoServerAccountInviteCodes
-----------------------------------




### Synopsis
com.atproto.server.getAccountInviteCodes



---


### Description

com.atproto.server.getAccountInviteCodes



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/getAccountInviteCodes.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/getAccountInviteCodes.json)





---


### Parameters
#### **IncludeUsed**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



#### **CreateAvailable**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



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
Get-AtprotoServerAccountInviteCodes [-IncludeUsed] [-CreateAvailable] [-Cache] [-WhatIf] [-Confirm] [<CommonParameters>]
```
