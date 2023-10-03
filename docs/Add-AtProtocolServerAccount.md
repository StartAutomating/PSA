Add-AtProtoServerAccount
------------------------




### Synopsis
com.atproto.server.createAccount



---


### Description

com.atproto.server.createAccount



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createAccount.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/server/createAccount.json)





---


### Parameters
#### **Email**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Handle**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **Did**

The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



#### **InviteCode**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|



#### **Password**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|



#### **RecoveryKey**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|



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
Add-AtProtoServerAccount [[-Email] <String>] [[-Handle] <String>] [[-Did] <String>] [[-InviteCode] <String>] [[-Password] <String>] [[-RecoveryKey] <String>] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
