function Get-BskyLabelerDefinition {

[Alias('bsky.labeler.defs','app.bsky.labeler.defs','app.bsky.labeler.defs#labelerView','app.bsky.labeler.defs#labelerViewDetailed','app.bsky.labeler.defs#labelerViewerState','app.bsky.labeler.defs#labelerPolicies')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.labeler.defs",
  "defs": {
    "labelerView": {
      "type": "object",
      "required": ["uri", "cid", "creator", "indexedAt"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "creator": { "type": "ref", "ref": "app.bsky.actor.defs#profileView" },
        "likeCount": { "type": "integer", "minimum": 0 },
        "viewer": { "type": "ref", "ref": "#labelerViewerState" },
        "indexedAt": { "type": "string", "format": "datetime" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "labelerViewDetailed": {
      "type": "object",
      "required": ["uri", "cid", "creator", "policies", "indexedAt"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "creator": { "type": "ref", "ref": "app.bsky.actor.defs#profileView" },
        "policies": {
          "type": "ref",
          "ref": "app.bsky.labeler.defs#labelerPolicies"
        },
        "likeCount": { "type": "integer", "minimum": 0 },
        "viewer": { "type": "ref", "ref": "#labelerViewerState" },
        "indexedAt": { "type": "string", "format": "datetime" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "labelerViewerState": {
      "type": "object",
      "properties": {
        "like": { "type": "string", "format": "at-uri" }
      }
    },
    "labelerPolicies": {
      "type": "object",
      "required": ["labelValues"],
      "properties": {
        "labelValues": {
          "type": "array",
          "description": "The label values which this labeler publishes. May include global or custom labels.",
          "items": {
            "type": "ref",
            "ref": "com.atproto.label.defs#labelValue"
          }
        },
        "labelValueDefinitions": {
          "type": "array",
          "description": "Label values created by this labeler and scoped exclusively to it. Labels defined here will override global label definitions for this labeler.",
          "items": {
            "type": "ref",
            "ref": "com.atproto.label.defs#labelValueDefinition"
          }
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

