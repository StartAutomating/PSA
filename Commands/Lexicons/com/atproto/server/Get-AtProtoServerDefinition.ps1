function Get-AtProtoServerDefinition {
[Alias('atproto.server.defs','com.atproto.server.defs','com.atproto.server.defs#inviteCode','com.atproto.server.defs#inviteCodeUse')]
param(
)
$lexiconText = @'
{
  "lexicon": 1,
  "id": "com.atproto.server.defs",
  "defs": {
    "inviteCode": {
      "type": "object",
      "required": [
        "code",
        "available",
        "disabled",
        "forAccount",
        "createdBy",
        "createdAt",
        "uses"
      ],
      "properties": {
        "code": { "type": "string" },
        "available": { "type": "integer" },
        "disabled": { "type": "boolean" },
        "forAccount": { "type": "string" },
        "createdBy": { "type": "string" },
        "createdAt": { "type": "string", "format": "datetime" },
        "uses": {
          "type": "array",
          "items": { "type": "ref", "ref": "#inviteCodeUse" }
        }
      }
    },
    "inviteCodeUse": {
      "type": "object",
      "required": ["usedBy", "usedAt"],
      "properties": {
        "usedBy": { "type": "string", "format": "did" },
        "usedAt": { "type": "string", "format": "datetime" }
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

