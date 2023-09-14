Get-AtprotoSyncBlobs
--------------------




### Synopsis
com.atproto.sync.listBlobs



---


### Description

com.atproto.sync.listBlobs



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/listBlobs.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/sync/listBlobs.json)





---


### Parameters
#### **Did**

The DID of the repo.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|



#### **Since**

Optional revision of the repo to list blobs since






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **Limit**

A limit to the number of results returned.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |3       |true (ByPropertyName)|



#### **Cursor**

A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|



#### **Cache**

If set, will cache results for performance.






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
Get-AtprotoSyncBlobs [-Did] <String> [[-Since] <String>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-Cache] [-WhatIf] [-Confirm] [<CommonParameters>]
```
