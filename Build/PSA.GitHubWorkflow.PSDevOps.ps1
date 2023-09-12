#requires -Module PSDevOps

Import-BuildStep -ModuleName PSA
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
    BuildPSA -OutputPath .\.github\workflows\TestAndPublish.yml

Pop-Location