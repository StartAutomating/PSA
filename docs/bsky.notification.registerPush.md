Register-BskyNotificationPush
-----------------------------




### Synopsis
app.bsky.notification.registerPush



---


### Description

app.bsky.notification.registerPush



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/notification/registerPush.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/notification/registerPush.json)





---


### Parameters
#### **ServiceDid**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Token**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **Platform**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



#### **AppId**




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
Register-BskyNotificationPush [[-ServiceDid] <String>] [[-Token] <String>] [[-Platform] <String>] [[-AppId] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
