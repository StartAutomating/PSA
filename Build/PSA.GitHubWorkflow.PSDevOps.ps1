#requires -Module PSDevOps

Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)

$workflowPath = 
    Join-Path $pwd ".github" | 
    Join-Path -ChildPath workflows |
    Join-Path -ChildPath "BuildPSA.yml"

if (-not (Test-Path $workflowPath)) {
    $null = New-Item -ItemType File -path $workflowPath -Force
}

New-GitHubWorkflow -Name "Build PSA" -On Push,
    PullRequest, 
    Demand -Job PowerShellStaticAnalysis, 
    TestPowerShellOnLinux, 
    TagReleaseAndPublish, 
    BuildPSA -OutputPath $workflowPath -Env @{
        "Exclude" = "*.png;*.mp4;*.jpg;*.jpeg;*.gif;*docs[/\]*;"
        "AT_PROTOCOL_HANDLE" = "mrpowershell.bsky.social"
        "AT_PROTOCOL_APP_PASSWORD" = '${{ secrets.AT_PROTOCOL_APP_PASSWORD }}'
    }

Pop-Location