function Get-OzoneSignatureDefinition {

[Alias('ozone.signature.defs','tools.ozone.signature.defs','tools.ozone.signature.defs#sigDetail')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "tools.ozone.signature.defs",
  "defs": {
    "sigDetail": {
      "type": "object",
      "required": ["property", "value"],
      "properties": {
        "property": { "type": "string" },
        "value": { "type": "string" }
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

