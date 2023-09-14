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
Set-BskyUnspeccedLabels [[-Labels] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
