function Get-BskyFeedDefinition {
[Alias('bsky.feed.defs','app.bsky.feed.defs','app.bsky.feed.defs#postView','app.bsky.feed.defs#viewerState','app.bsky.feed.defs#feedViewPost','app.bsky.feed.defs#replyRef','app.bsky.feed.defs#reasonRepost','app.bsky.feed.defs#threadViewPost','app.bsky.feed.defs#notFoundPost','app.bsky.feed.defs#blockedPost','app.bsky.feed.defs#blockedAuthor','app.bsky.feed.defs#generatorView','app.bsky.feed.defs#generatorViewerState','app.bsky.feed.defs#skeletonFeedPost','app.bsky.feed.defs#skeletonReasonRepost')]
param(
)
$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.feed.defs",
  "defs": {
    "postView": {
      "type": "object",
      "required": ["uri", "cid", "author", "record", "indexedAt"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "author": {
          "type": "ref",
          "ref": "app.bsky.actor.defs#profileViewBasic"
        },
        "record": { "type": "unknown" },
        "embed": {
          "type": "union",
          "refs": [
            "app.bsky.embed.images#view",
            "app.bsky.embed.external#view",
            "app.bsky.embed.record#view",
            "app.bsky.embed.recordWithMedia#view"
          ]
        },
        "replyCount": { "type": "integer" },
        "repostCount": { "type": "integer" },
        "likeCount": { "type": "integer" },
        "indexedAt": { "type": "string", "format": "datetime" },
        "viewer": { "type": "ref", "ref": "#viewerState" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "viewerState": {
      "type": "object",
      "properties": {
        "repost": { "type": "string", "format": "at-uri" },
        "like": { "type": "string", "format": "at-uri" }
      }
    },
    "feedViewPost": {
      "type": "object",
      "required": ["post"],
      "properties": {
        "post": { "type": "ref", "ref": "#postView" },
        "reply": { "type": "ref", "ref": "#replyRef" },
        "reason": { "type": "union", "refs": ["#reasonRepost"] }
      }
    },
    "replyRef": {
      "type": "object",
      "required": ["root", "parent"],
      "properties": {
        "root": {
          "type": "union",
          "refs": ["#postView", "#notFoundPost", "#blockedPost"]
        },
        "parent": {
          "type": "union",
          "refs": ["#postView", "#notFoundPost", "#blockedPost"]
        }
      }
    },
    "reasonRepost": {
      "type": "object",
      "required": ["by", "indexedAt"],
      "properties": {
        "by": { "type": "ref", "ref": "app.bsky.actor.defs#profileViewBasic" },
        "indexedAt": { "type": "string", "format": "datetime" }
      }
    },
    "threadViewPost": {
      "type": "object",
      "required": ["post"],
      "properties": {
        "post": { "type": "ref", "ref": "#postView" },
        "parent": {
          "type": "union",
          "refs": ["#threadViewPost", "#notFoundPost", "#blockedPost"]
        },
        "replies": {
          "type": "array",
          "items": {
            "type": "union",
            "refs": ["#threadViewPost", "#notFoundPost", "#blockedPost"]
          }
        }
      }
    },
    "notFoundPost": {
      "type": "object",
      "required": ["uri", "notFound"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "notFound": { "type": "boolean", "const": true }
      }
    },
    "blockedPost": {
      "type": "object",
      "required": ["uri", "blocked", "author"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "blocked": { "type": "boolean", "const": true },
        "author": { "type": "ref", "ref": "#blockedAuthor" }
      }
    },
    "blockedAuthor": {
      "type": "object",
      "required": ["did"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "viewer": { "type": "ref", "ref": "app.bsky.actor.defs#viewerState" }
      }
    },
    "generatorView": {
      "type": "object",
      "required": ["uri", "cid", "did", "creator", "displayName", "indexedAt"],
      "properties": {
        "uri": { "type": "string", "format": "at-uri" },
        "cid": { "type": "string", "format": "cid" },
        "did": { "type": "string", "format": "did" },
        "creator": { "type": "ref", "ref": "app.bsky.actor.defs#profileView" },
        "displayName": { "type": "string" },
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
        "likeCount": { "type": "integer", "minimum": 0 },
        "viewer": { "type": "ref", "ref": "#generatorViewerState" },
        "indexedAt": { "type": "string", "format": "datetime" }
      }
    },
    "generatorViewerState": {
      "type": "object",
      "properties": {
        "like": { "type": "string", "format": "at-uri" }
      }
    },
    "skeletonFeedPost": {
      "type": "object",
      "required": ["post"],
      "properties": {
        "post": { "type": "string", "format": "at-uri" },
        "reason": { "type": "union", "refs": ["#skeletonReasonRepost"] }
      }
    },
    "skeletonReasonRepost": {
      "type": "object",
      "required": ["repost"],
      "properties": {
        "repost": { "type": "string", "format": "at-uri" }
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

