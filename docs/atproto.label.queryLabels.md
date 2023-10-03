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






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|true    |1       |true (ByPropertyName)|



#### **Sources**

Optional list of label sources (DIDs) to filter on






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |2       |true (ByPropertyName)|



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
Search-AtProtoLabels [-UriPatterns] <PSObject> [[-Sources] <PSObject>] [[-Limit] <PSObject>] [[-Cursor] <String>] [-Cache] [-Authorization] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
