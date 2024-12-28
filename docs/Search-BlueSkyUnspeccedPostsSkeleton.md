Search-BskyUnspeccedPostsSkeleton
---------------------------------

### Synopsis
app.bsky.unspecced.searchPostsSkeleton

---

### Description

app.bsky.unspecced.searchPostsSkeleton

---

### Related Links
* [https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/searchPostsSkeleton.json](https://github.com/bluesky-social/atproto/tree/main/lexicons/app/bsky/unspecced/searchPostsSkeleton.json)

---

### Parameters
#### **Q**
Search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Sort**
Specifies the ranking order of results.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Since**
Filter results for posts after the indicated datetime (inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYYY-MM-DD).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Until**
Filter results for posts before the indicated datetime (not inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYY-MM-DD).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Mentions**
Filter to posts which mention the given account. Handles are resolved to DID before query-time. Only matches rich-text facet mentions.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **Author**
Filter to posts by the given account. Handles are resolved to DID before query-time.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **Lang**
Filter to posts in the given language. Expected to be based on post language field, though server may override language detection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **Domain**
Filter to posts with URLs (facet links or embeds) linking to the given domain (hostname). Server may apply hostname normalization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **Url**
Filter to posts with links (facet links or embeds) pointing to this URL. Server may apply URL normalization or fuzzy matching.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |9       |true (ByPropertyName)|

#### **Tag**
Filter to posts with the given tag (hashtag), based on rich-text facet or tag field. Do not include the hash (#) prefix. Multiple tags can be specified, with 'AND' matching.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |10      |true (ByPropertyName)|

#### **Viewer**
DID of the account making the request (not included for public/unauthenticated queries). Used for 'from:me' queries.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |11      |true (ByPropertyName)|

#### **Limit**
A limit to the number of results returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |12      |true (ByPropertyName)|

#### **Cursor**
Optional pagination mechanism; may not necessarily allow scrolling through entire result set.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |13      |true (ByPropertyName)|

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
Search-BskyUnspeccedPostsSkeleton [-Q] <String> [[-Sort] <String>] [[-Since] <String>] [[-Until] <String>] [[-Mentions] <String>] [[-Author] <String>] [[-Lang] <String>] [[-Domain] <String>] [[-Url] <String>] [[-Tag] <PSObject>] [[-Viewer] <String>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-Cache] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
