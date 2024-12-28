function Get-OzoneCommunicationDefinition {

[Alias('ozone.communication.defs','tools.ozone.communication.defs','tools.ozone.communication.defs#templateView')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "tools.ozone.communication.defs",
  "defs": {
    "templateView": {
      "type": "object",
      "required": [
        "id",
        "name",
        "contentMarkdown",
        "disabled",
        "lastUpdatedBy",
        "createdAt",
        "updatedAt"
      ],
      "properties": {
        "id": { "type": "string" },
        "name": { "type": "string", "description": "Name of the template." },
        "subject": {
          "type": "string",
          "description": "Content of the template, can contain markdown and variable placeholders."
        },
        "contentMarkdown": {
          "type": "string",
          "description": "Subject of the message, used in emails."
        },
        "disabled": { "type": "boolean" },
        "lang": {
          "type": "string",
          "format": "language",
          "description": "Message language."
        },
        "lastUpdatedBy": {
          "type": "string",
          "format": "did",
          "description": "DID of the user who last updated the template."
        },
        "createdAt": { "type": "string", "format": "datetime" },
        "updatedAt": { "type": "string", "format": "datetime" }
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

