Get-BskyFeedPosts
-----------------




### Synopsis
app.bsky.feed.getPosts



---


### Description

app.bsky.feed.getPosts



---


### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getPosts.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/feed/getPosts.json)





---


### Parameters
#### **Uris**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|true    |1       |true (ByPropertyName)|



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
Get-BskyFeedPosts [-Uris] <PSObject> [-WhatIf] [-Confirm] [<CommonParameters>]
```
