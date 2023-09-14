Get-BskyFeedTimeline
--------------------




### Synopsis
app.bsky.feed.getTimeline



---


### Description

app.bsky.feed.getTimeline



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getTimeline.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getTimeline.json)





---


### Parameters
#### **Algorithm**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|



#### **Limit**

A limit to the number of results returned.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



#### **Cursor**

A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



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
Get-BskyFeedTimeline [[-Algorithm] <String>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
