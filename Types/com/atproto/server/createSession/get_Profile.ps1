<#
.SYNOPSIS
    Gets the profile attached to a session
.DESCRIPTION
    Gets the profile of the logged-in user.
#>

if (-not $this.'.Profile') {
    $this |
        Add-Member NoteProperty '.Profile' (Get-AtActorProfile -Actor $this.handle) -Force
} 

$this.'.Profile'
