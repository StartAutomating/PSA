Request-AtProtoServerAccountDelete
----------------------------------




### Synopsis
com.atproto.server.requestAccountDelete



---


### Description

com.atproto.server.requestAccountDelete



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/requestAccountDelete.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/requestAccountDelete.json)





---


### Parameters
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
Request-AtProtoServerAccountDelete [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
