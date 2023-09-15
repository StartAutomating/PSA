Add-AtProtoServerSession
------------------------




### Synopsis
com.atproto.server.createSession



---


### Description

com.atproto.server.createSession



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createSession.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createSession.json)





---


### Parameters
#### **Identifier**

Handle or other identifier supported by the server for the authenticating user.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Password**




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
Add-AtProtoServerSession [[-Identifier] <String>] [[-Password] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
