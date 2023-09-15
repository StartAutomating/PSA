<#
.SYNOPSIS
    Follow
.DESCRIPTION
    Follows this profile.
#>
param()


$myBlueSkySession = Get-AtprotoServerSession

if (-not $myBlueSkySession) { return }
if (-not $this.did) { return }

Add-AtprotoRepoRecord -Repo $myBlueSkySession.did -Collection 'app.bsky.graph.follow' -Record ([PSCustomObject][Ordered]@{
    '$type' = 'app.bsky.graph.follow'
    createdAt = [DateTime]::Now.ToString('o')
    subject=$this.did
})
