function Get-OzoneTeamDefinition {

[Alias('ozone.team.defs','tools.ozone.team.defs','tools.ozone.team.defs#member','tools.ozone.team.defs#roleAdmin','tools.ozone.team.defs#roleModerator','tools.ozone.team.defs#roleTriage')]
param(

)




$lexiconText = @'
{
  "lexicon": 1,
  "id": "tools.ozone.team.defs",
  "defs": {
    "member": {
      "type": "object",
      "required": ["did", "role"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "disabled": { "type": "boolean" },
        "profile": {
          "type": "ref",
          "ref": "app.bsky.actor.defs#profileViewDetailed"
        },
        "createdAt": { "type": "string", "format": "datetime" },
        "updatedAt": { "type": "string", "format": "datetime" },
        "lastUpdatedBy": { "type": "string" },
        "role": {
          "type": "string",
          "knownValues": ["#roleAdmin", "#roleModerator", "#roleTriage"]
        }
      }
    },
    "roleAdmin": {
      "type": "token",
      "description": "Admin role. Highest level of access, can perform all actions."
    },
    "roleModerator": {
      "type": "token",
      "description": "Moderator role. Can perform most actions."
    },
    "roleTriage": {
      "type": "token",
      "description": "Triage role. Mostly intended for monitoring and escalating issues."
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

