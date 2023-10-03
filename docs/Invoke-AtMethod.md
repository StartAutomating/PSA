Invoke-AtProto
--------------




### Synopsis
Invokes the AT Protocol



---


### Description

Invokes the RESTful methods of the At Protocol.



---


### Related Links
* [Connect-AtProto](Connect-AtProto.md)





---


### Parameters
#### **Uri**

The URI being invoked.  If this is empty, a -NamespaceID is required.






|Type   |Required|Position|PipelineInput        |Aliases|
|-------|--------|--------|---------------------|-------|
|`[Uri]`|false   |1       |true (ByPropertyName)|Url    |



#### **Method**

The HTTP Method.



Valid Values:

* GET
* DELETE
* HEAD
* MERGE
* OPTIONS
* PATCH
* POST
* PUT
* TRACE






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|



#### **NamespaceID**

The Namespace ID.  
In the AT Protocol, every request has a NamespaceID.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|



#### **Parameter**

Any parameters to the request.
If the HTTP Method is get, these will become QueryParameters
Otherwise, they will become -BodyParameters.






|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|Parameters|



#### **QueryParameter**

One or more query parameters.






|Type        |Required|Position|PipelineInput        |Aliases                  |
|------------|--------|--------|---------------------|-------------------------|
|`[PSObject]`|false   |5       |true (ByPropertyName)|QueryParameters<br/>Query|



#### **BodyParameter**

One or more body parameters.






|Type        |Required|Position|PipelineInput        |Aliases                |
|------------|--------|--------|---------------------|-----------------------|
|`[PSObject]`|false   |6       |true (ByPropertyName)|BodyParameters<br/>Body|



#### **Authorization**

The authorization.
This can be a JWT that accesses the protocol.
It can also be a credential.
The username is a handle or email.
The password is the app password.






|Type        |Required|Position|PipelineInput        |Aliases                       |
|------------|--------|--------|---------------------|------------------------------|
|`[PSObject]`|false   |7       |true (ByPropertyName)|Authentication<br/>AppPassword|



#### **ContentType**

The content type of the request.  
If not provided, this will be assumed to be application/json.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|



#### **ParameterAlias**

Aliases for parameters.
If these parameters are found, they will be called using their alias instead.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |9       |true (ByPropertyName)|



#### **PSTypeName**

The typename of the results.






|Type        |Required|Position|PipelineInput        |Aliases                             |
|------------|--------|--------|---------------------|------------------------------------|
|`[String[]]`|false   |10      |true (ByPropertyName)|Decorate<br/>Decoration<br/>TypeName|



#### **Property**

A set of additional properties to add to an object






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |11      |true (ByPropertyName)|



#### **RemoveProperty**

A list of property names to remove from an object.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |12      |true (ByPropertyName)|



#### **ExpandProperty**

If provided, will expand a given property returned from the REST api.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |13      |true (ByPropertyName)|



#### **DecorateProperty**

If provided, will decorate the values within a property in the return object.
This allows nested REST properties to work with the PowerShell Extended Type System.






|Type           |Required|Position|PipelineInput        |Aliases           |
|---------------|--------|--------|---------------------|------------------|
|`[IDictionary]`|false   |14      |true (ByPropertyName)|TypeNameOfProperty|



#### **AsByte**

If set, will receive results as a byte array.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



#### **Cache**

If set, will cache results from a request.  Only HTTP GET results will be cached.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



#### **Raw**

If set, will return raw results.
This will ignore -Property, -DecorateProperty, -ExpandProperty, and -PSTypeName.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



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
Invoke-AtProto [[-Uri] <Uri>] [[-Method] <String>] [[-NamespaceID] <String>] [[-Parameter] <PSObject>] [[-QueryParameter] <PSObject>] [[-BodyParameter] <PSObject>] [[-Authorization] <PSObject>] [[-ContentType] <String>] [[-ParameterAlias] <PSObject>] [[-PSTypeName] <String[]>] [[-Property] <IDictionary>] [[-RemoveProperty] <String[]>] [[-ExpandProperty] <String>] [[-DecorateProperty] <IDictionary>] [-AsByte] [-Cache] [-Raw] [-WhatIf] [-Confirm] [<CommonParameters>]
```
