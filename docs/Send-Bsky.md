Send-AtProto
------------




### Synopsis
Sends to the At Protocol



---


### Description

Sends a BlueSky post using the At Protocol



---


### Examples
Send a Hello World

```PowerShell
Send-AtProto "Hello World (from https://github.com/StartAutomating/PSA )"
```
Don't send Hello World, ask -WhatIf I did, and get back the object you would post.

```PowerShell
Send-AtProto "Hello World (from https://github.com/StartAutomating/PSA )" -WhatIf
```


---


### Parameters
#### **Text**

The text of a post






|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|false   |1       |true (ByPropertyName)|Post<br/>Skeet<br/>Title|



#### **Image**

One or more images to attach to a post.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|



#### **AlternateImageText**

One or more alternate image texts, for accessibility.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|



#### **QuotePost**

A post that will be quoted by this post.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|



#### **Reply**

A post that this post will reply to.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |5       |true (ByPropertyName)|



#### **WebCard**

A web card, containing rich links






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |6       |true (ByPropertyName)|



#### **LinkPattern**

Patterns within a message to replace with links.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |7       |true (ByPropertyName)|



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
Send-AtProto [[-Text] <String>] [[-Image] <String[]>] [[-AlternateImageText] <String[]>] [[-QuotePost] <PSObject>] [[-Reply] <PSObject>] [[-WebCard] <PSObject>] [[-LinkPattern] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
