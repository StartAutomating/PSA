$commandsPath = Join-Path $psScriptRoot Commands

[include('*-*')]$commandsPath

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