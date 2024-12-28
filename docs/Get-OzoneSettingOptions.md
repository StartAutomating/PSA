Get-OzoneSettingOptions
-----------------------

### Synopsis
tools.ozone.setting.listOptions

---

### Description

tools.ozone.setting.listOptions

---

### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/setting/listOptions.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/tools/ozone/setting/listOptions.json)

---

### Parameters
#### **Limit**
A limit to the number of results returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|

#### **Cursor**
A cursor that can be used to get more results.
Any command that accepts a -Cursor parameter returns a .Cursor property.
You can provide this -Cursor to the same command with the same input to get more results.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Scope**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Prefix**
Filter keys by prefix

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Keys**
Filter for only the specified keys. Ignored if prefix is provided

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |5       |true (ByPropertyName)|

#### **Cache**
If set, will cache results for performance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Get-OzoneSettingOptions [[-Limit] <PSObject>] [[-Cursor] <String>] [[-Scope] <String>] [[-Prefix] <String>] [[-Keys] <PSObject>] [-Cache] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
