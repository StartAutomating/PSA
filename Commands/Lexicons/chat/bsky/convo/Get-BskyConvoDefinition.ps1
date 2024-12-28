function Get-BskyConvoDefinition {

[Alias('bsky.convo.defs','chat.bsky.convo.defs','chat.bsky.convo.defs#messageRef','chat.bsky.convo.defs#messageInput','chat.bsky.convo.defs#messageView','chat.bsky.convo.defs#deletedMessageView','chat.bsky.convo.defs#messageViewSender','chat.bsky.convo.defs#convoView','chat.bsky.convo.defs#logBeginConvo','chat.bsky.convo.defs#logLeaveConvo','chat.bsky.convo.defs#logCreateMessage','chat.bsky.convo.defs#logDeleteMessage')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "chat.bsky.convo.defs",
  "defs": {
    "messageRef": {
      "type": "object",
      "required": ["did", "messageId", "convoId"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "convoId": { "type": "string" },
        "messageId": { "type": "string" }
      }
    },
    "messageInput": {
      "type": "object",
      "required": ["text"],
      "properties": {
        "text": {
          "type": "string",
          "maxLength": 10000,
          "maxGraphemes": 1000
        },
        "facets": {
          "type": "array",
          "description": "Annotations of text (mentions, URLs, hashtags, etc)",
          "items": { "type": "ref", "ref": "app.bsky.richtext.facet" }
        },
        "embed": {
          "type": "union",
          "refs": ["app.bsky.embed.record"]
        }
      }
    },
    "messageView": {
      "type": "object",
      "required": ["id", "rev", "text", "sender", "sentAt"],
      "properties": {
        "id": { "type": "string" },
        "rev": { "type": "string" },
        "text": {
          "type": "string",
          "maxLength": 10000,
          "maxGraphemes": 1000
        },
        "facets": {
          "type": "array",
          "description": "Annotations of text (mentions, URLs, hashtags, etc)",
          "items": { "type": "ref", "ref": "app.bsky.richtext.facet" }
        },
        "embed": {
          "type": "union",
          "refs": ["app.bsky.embed.record#view"]
        },
        "sender": { "type": "ref", "ref": "#messageViewSender" },
        "sentAt": { "type": "string", "format": "datetime" }
      }
    },
    "deletedMessageView": {
      "type": "object",
      "required": ["id", "rev", "sender", "sentAt"],
      "properties": {
        "id": { "type": "string" },
        "rev": { "type": "string" },
        "sender": { "type": "ref", "ref": "#messageViewSender" },
        "sentAt": { "type": "string", "format": "datetime" }
      }
    },
    "messageViewSender": {
      "type": "object",
      "required": ["did"],
      "properties": {
        "did": { "type": "string", "format": "did" }
      }
    },
    "convoView": {
      "type": "object",
      "required": ["id", "rev", "members", "muted", "unreadCount"],
      "properties": {
        "id": { "type": "string" },
        "rev": { "type": "string" },
        "members": {
          "type": "array",
          "items": {
            "type": "ref",
            "ref": "chat.bsky.actor.defs#profileViewBasic"
          }
        },
        "lastMessage": {
          "type": "union",
          "refs": ["#messageView", "#deletedMessageView"]
        },
        "muted": { "type": "boolean" },
        "opened": { "type": "boolean" },
        "unreadCount": { "type": "integer" }
      }
    },
    "logBeginConvo": {
      "type": "object",
      "required": ["rev", "convoId"],
      "properties": {
        "rev": { "type": "string" },
        "convoId": { "type": "string" }
      }
    },
    "logLeaveConvo": {
      "type": "object",
      "required": ["rev", "convoId"],
      "properties": {
        "rev": { "type": "string" },
        "convoId": { "type": "string" }
      }
    },
    "logCreateMessage": {
      "type": "object",
      "required": ["rev", "convoId", "message"],
      "properties": {
        "rev": { "type": "string" },
        "convoId": { "type": "string" },
        "message": {
          "type": "union",
          "refs": ["#messageView", "#deletedMessageView"]
        }
      }
    },
    "logDeleteMessage": {
      "type": "object",
      "required": ["rev", "convoId", "message"],
      "properties": {
        "rev": { "type": "string" },
        "convoId": { "type": "string" },
        "message": {
          "type": "union",
          "refs": ["#messageView", "#deletedMessageView"]
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

