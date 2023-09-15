#requires -Module PSDevOps
#requires -Module PSA
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubAction

Push-Location ($PSScriptRoot | Split-Path)
New-GitHubAction -Name "SendPSA" -Description @'
Send an announcement with PowerShell Announcements
'@ -Action PSA -Icon 'volume-2' -OutputPath .\action.yml
Pop-Location