function Get-AtProtoAdminDefinition {

[Alias('atproto.admin.defs','com.atproto.admin.defs','com.atproto.admin.defs#statusAttr','com.atproto.admin.defs#accountView','com.atproto.admin.defs#repoRef','com.atproto.admin.defs#repoBlobRef','com.atproto.admin.defs#threatSignature')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "com.atproto.admin.defs",
  "defs": {
    "statusAttr": {
      "type": "object",
      "required": ["applied"],
      "properties": {
        "applied": { "type": "boolean" },
        "ref": { "type": "string" }
      }
    },
    "accountView": {
      "type": "object",
      "required": ["did", "handle", "indexedAt"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "handle": { "type": "string", "format": "handle" },
        "email": { "type": "string" },
        "relatedRecords": { "type": "array", "items": { "type": "unknown" } },
        "indexedAt": { "type": "string", "format": "datetime" },
        "invitedBy": {
          "type": "ref",
          "ref": "com.atproto.server.defs#inviteCode"
        },
        "invites": {
          "type": "array",
          "items": {
            "type": "ref",
            "ref": "com.atproto.server.defs#inviteCode"
          }
        },
        "invitesDisabled": { "type": "boolean" },
        "emailConfirmedAt": { "type": "string", "format": "datetime" },
        "inviteNote": { "type": "string" },
        "deactivatedAt": { "type": "string", "format": "datetime" },
        "threatSignatures": {
          "type": "array",
          "items": {
            "type": "ref",
            "ref": "#threatSignature"
          }
        }
      }
    },
    "repoRef": {
      "type": "object",
      "required": ["did"],
      "properties": {
        "did": { "type": "string", "format": "did" }
      }
    },
    "repoBlobRef": {
      "type": "object",
      "required": ["did", "cid"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "cid": { "type": "string", "format": "cid" },
        "recordUri": { "type": "string", "format": "at-uri" }
      }
    },
    "threatSignature": {
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

