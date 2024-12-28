function Get-AtProtoRepoDefinition {

[Alias('atproto.repo.defs','com.atproto.repo.defs','com.atproto.repo.defs#commitMeta')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "com.atproto.repo.defs",
  "defs": {
    "commitMeta": {
      "type": "object",
      "required": ["cid", "rev"],
      "properties": {
        "cid": { "type": "string", "format": "cid" },
        "rev": { "type": "string" }
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

