function Get-OzoneSetDefinition {

[Alias('ozone.set.defs','tools.ozone.set.defs','tools.ozone.set.defs#set','tools.ozone.set.defs#setView')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "tools.ozone.set.defs",
  "defs": {
    "set": {
      "type": "object",
      "required": ["name"],
      "properties": {
        "name": {
          "type": "string",
          "minLength": 3,
          "maxLength": 128
        },
        "description": {
          "type": "string",
          "maxGraphemes": 1024,
          "maxLength": 10240
        }
      }
    },
    "setView": {
      "type": "object",
      "required": ["name", "setSize", "createdAt", "updatedAt"],
      "properties": {
        "name": {
          "type": "string",
          "minLength": 3,
          "maxLength": 128
        },
        "description": {
          "type": "string",
          "maxGraphemes": 1024,
          "maxLength": 10240
        },
        "setSize": {
          "type": "integer"
        },
        "createdAt": {
          "type": "string",
          "format": "datetime"
        },
        "updatedAt": {
          "type": "string",
          "format": "datetime"
        }
      }
    }
  }
}

'@
$lexicon = $lexiconText | ConvertFrom-JSON
if ($myInvocation.InvocationName -eq $myInvocation.MyCommand.Name) {
    $lexicon
} elseif ($myInvocation.InvocationName -like '*#*') {
    $lexicon.defs.$(@($myInvocation.InvocationName -split '\#',2)[1])
} else {
    $lexicon
}


} 

