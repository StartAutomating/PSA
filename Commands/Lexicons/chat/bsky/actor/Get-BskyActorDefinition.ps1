function Get-BskyActorDefinition {

[Alias('bsky.actor.defs','chat.bsky.actor.defs','chat.bsky.actor.defs#profileViewBasic')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "chat.bsky.actor.defs",
  "defs": {
    "profileViewBasic": {
      "type": "object",
      "required": ["did", "handle"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "handle": { "type": "string", "format": "handle" },
        "displayName": {
          "type": "string",
          "maxGraphemes": 64,
          "maxLength": 640
        },
        "avatar": { "type": "string", "format": "uri" },
        "associated": {
          "type": "ref",
          "ref": "app.bsky.actor.defs#profileAssociated"
        },
        "viewer": { "type": "ref", "ref": "app.bsky.actor.defs#viewerState" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        },
        "chatDisabled": {
          "type": "boolean",
          "description": "Set to true when the actor cannot actively participate in converations"
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

