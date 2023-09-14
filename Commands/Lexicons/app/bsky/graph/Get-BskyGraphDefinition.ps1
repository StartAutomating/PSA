function Get-BskyGraphDefinition {
[Alias('bsky.graph.defs','app.bsky.graph.defs','app.bsky.graph.defs#listViewBasic','app.bsky.graph.defs#listView','app.bsky.graph.defs#listItemView','app.bsky.graph.defs#listPurpose','app.bsky.graph.defs#modlist','app.bsky.graph.defs#listViewerState')]
param(
)
$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.graph.defs",
  "defs": {
    "listViewBasic": {
      "type": "object",
      "required": ["uri", "cid", "name", "purpose"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "name": { "type": "string", "maxLength": 64, "minLength": 1 },
        "purpose": { "type": "ref", "ref": "#listPurpose" },
        "avatar": { "type": "string" },
        "viewer": { "type": "ref", "ref": "#listViewerState" },
        "indexedAt": { "type": "string", "format": "datetime" }
      }
    },
    "listView": {
      "type": "object",
      "required": ["uri", "cid", "creator", "name", "purpose", "indexedAt"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "creator": { "type": "ref", "ref": "app.bsky.actor.defs#profileView" },
        "name": { "type": "string", "maxLength": 64, "minLength": 1 },
        "purpose": { "type": "ref", "ref": "#listPurpose" },
        "description": {
          "type": "string",
          "maxGraphemes": 300,
          "maxLength": 3000
        },
        "descriptionFacets": {
          "type": "array",
          "items": { "type": "ref", "ref": "app.bsky.richtext.facet" }
        },
        "avatar": { "type": "string" },
        "viewer": { "type": "ref", "ref": "#listViewerState" },
        "indexedAt": { "type": "string", "format": "datetime" }
      }
    },
    "listItemView": {
      "type": "object",
      "required": ["subject"],
      "properties": {
        "subject": { "type": "ref", "ref": "app.bsky.actor.defs#profileView" }
      }
    },
    "listPurpose": {
      "type": "string",
      "knownValues": ["app.bsky.graph.defs#modlist"]
    },
    "modlist": {
      "type": "token",
      "description": "A list of actors to apply an aggregate moderation action (mute/block) on"
    },
    "listViewerState": {
      "type": "object",
      "properties": {
        "muted": { "type": "boolean" }
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
