Update-BskyModerationActorAccess
--------------------------------

### Synopsis
chat.bsky.moderation.updateActorAccess

---

### Description

chat.bsky.moderation.updateActorAccess

---

### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/chat/bsky/moderation/updateActorAccess.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/chat/bsky/moderation/updateActorAccess.json)

---

### Parameters
#### **Actor**
The Actor.
This can be either a handle (e.g. @AtProto.com) or a Decentralized Identifier (.did)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **AllowAccess**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Ref**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Authorization**
The authorization. This can be a JWT that accesses the at protocol or a credential. If this is provided as a credential the username is a handle or email and the password is the app password.

|Type      |Required|Position|PipelineInput|Aliases                                                       |
|----------|--------|--------|-------------|--------------------------------------------------------------|
|`[Switch]`|false   |named   |false        |Authentication<br/>AppPassword<br/>Credential<br/>PSCredential|

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
Update-BskyModerationActorAccess [[-Actor] <String>] [-AllowAccess] [[-Ref] <String>] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
