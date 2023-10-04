Set-BskyUnspeccedLabels
-----------------------




### Synopsis
app.bsky.unspecced.applyLabels



---


### Description

app.bsky.unspecced.applyLabels



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/applyLabels.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/applyLabels.json)





---


### Parameters
#### **Labels**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|



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
Set-BskyUnspeccedLabels [[-Labels] <PSObject>] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
