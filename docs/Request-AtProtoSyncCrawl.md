Request-AtProtoSyncCrawl
------------------------




### Synopsis
com.atproto.sync.requestCrawl



---


### Description

com.atproto.sync.requestCrawl



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/requestCrawl.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/requestCrawl.json)





---


### Parameters
#### **Hostname**

Hostname of the service that is requesting to be crawled.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



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
Request-AtProtoSyncCrawl [[-Hostname] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
