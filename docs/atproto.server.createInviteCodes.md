Add-AtProtoServerInviteCodes
----------------------------




### Synopsis
com.atproto.server.createInviteCodes



---


### Description

com.atproto.server.createInviteCodes



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createInviteCodes.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createInviteCodes.json)





---


### Parameters
#### **CodeCount**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|



#### **UseCount**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **ForAccounts**




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
Add-AtProtoServerInviteCodes [[-CodeCount] <PSObject>] [[-UseCount] <PSObject>] [[-ForAccounts] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
