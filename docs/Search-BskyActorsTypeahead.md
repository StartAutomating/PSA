Search-BskyActorsTypeahead
--------------------------




### Synopsis
app.bsky.actor.searchActorsTypeahead



---


### Description

app.bsky.actor.searchActorsTypeahead



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/searchActorsTypeahead.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/actor/searchActorsTypeahead.json)





---


### Parameters
#### **Term**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Limit**

A limit to the number of results returned.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **Cache**

If set, will cache results for performance.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |



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
Search-BskyActorsTypeahead [[-Term] <String>] [[-Limit] <PSObject>] [-Cache] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
