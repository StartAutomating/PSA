Get-BskyGraphListMutes
----------------------




### Synopsis
app.bsky.graph.getListMutes



---


### Description

app.bsky.graph.getListMutes



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/getListMutes.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/graph/getListMutes.json)





---


### Parameters
#### **Limit**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|



#### **Cursor**




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
Get-BskyGraphListMutes [[-Limit] <PSObject>] [[-Cursor] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
