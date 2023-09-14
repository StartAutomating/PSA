Connect-AtProto
---------------




### Synopsis
Connects to the AtProtocol



---


### Description

Connects using the AtProtocol.



---


### Parameters
#### **Authentication**

The authorization.  This can be a credential.    
The username is a handle or email.
The password is the app password.
If no credential is provided, some environment variables can be used:
`$env:AT_PROTOCOL_HANDLE` or `$env:AT_PROTOCOL_EMAIL can define the identity.
`$env:AT_PROTOCOL_APP_PASSWORD` can define the app password.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|





---


### Syntax
```PowerShell
Connect-AtProto [[-Authentication] <PSObject>] [<CommonParameters>]
```
