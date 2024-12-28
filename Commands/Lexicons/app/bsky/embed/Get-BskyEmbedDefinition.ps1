function Get-BskyEmbedDefinition {

[Alias('bsky.embed.defs','app.bsky.embed.defs','app.bsky.embed.defs#aspectRatio')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.embed.defs",
  "defs": {
    "aspectRatio": {
      "type": "object",
      "description": "width:height represents an aspect ratio. It may be approximate, and may not correspond to absolute dimensions in any given unit.",
      "required": ["width", "height"],
      "properties": {
        "width": { "type": "integer", "minimum": 1 },
        "height": { "type": "integer", "minimum": 1 }
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

