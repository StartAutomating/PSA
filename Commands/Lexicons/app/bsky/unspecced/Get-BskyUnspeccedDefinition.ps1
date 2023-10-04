function Get-BskyUnspeccedDefinition {
[Alias('bsky.unspecced.defs','app.bsky.unspecced.defs','app.bsky.unspecced.defs#skeletonSearchPost','app.bsky.unspecced.defs#skeletonSearchActor')]
param(
)
$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.unspecced.defs",
  "defs": {
    "skeletonSearchPost": {
      "type": "object",
      "required": ["uri"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" }
      }
    },
    "skeletonSearchActor": {
      "type": "object",
      "required": ["did"],
      "properties": {
        "did": { "type": "string", "format": "did" }
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

