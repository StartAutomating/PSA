Request-AtProtoServerPasswordReset
----------------------------------




### Synopsis
com.atproto.server.requestPasswordReset



---


### Description

com.atproto.server.requestPasswordReset



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/requestPasswordReset.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/requestPasswordReset.json)





---


### Parameters
#### **Email**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Raw**

If set, will return raw results. This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.






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
Request-AtProtoServerPasswordReset [[-Email] <String>] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
