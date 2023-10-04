$commandsPath = Join-Path $psScriptRoot Commands

:ToIncludeFiles foreach ($file in (Get-ChildItem -Path "$commandsPath" -Filter "*-*" -Recurse)) {
    if ($file.Extension -ne '.ps1')      { continue }  # Skip if the extension is not .ps1
    foreach ($exclusion in '\.[^\.]+\.ps1$') {
        if (-not $exclusion) { continue }
        if ($file.Name -match $exclusion) {
            continue ToIncludeFiles  # Skip excluded files
        }
    }     
    . $file.FullName
}

$exportedVariables  = @("$($MyInvocation.MyCommand.ScriptBlock.Module.Name)")

$psa = $MyInvocation.MyCommand.ScriptBlock.Module

if ($profile) {
    $ModuleProfilePath =
        $profile |
        Split-Path |
        Join-Path -ChildPath "$($MyInvocation.MyCommand.ScriptBlock.Module.Name).profile.ps1"
    if (Test-Path $ModuleProfilePath) {
        . $ModuleProfilePath
    }    
}

Export-ModuleMember -Function * -Alias * -Variable $exportedVariables
