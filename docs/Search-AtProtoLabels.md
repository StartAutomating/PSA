Search-AtProtoLabels
--------------------




### Synopsis
com.atproto.label.queryLabels



---


### Description

com.atproto.label.queryLabels



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/queryLabels.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/com/atproto/label/queryLabels.json)





---


### Parameters
#### **UriPatterns**

List of AT URI patterns to match (boolean 'OR'). Each may be a prefix (ending with '*'; will match inclusive of the string leading to '*'), or a full URI






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|true    |1       |false        |



#### **Sources**

Optional list of label sources (DIDs) to filter on






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |



#### **Limit**




|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |3       |false        |



#### **Cursor**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |



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
Search-AtProtoLabels [-UriPatterns] <PSObject> [[-Sources] <PSObject>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
