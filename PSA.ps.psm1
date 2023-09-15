$commandsPath = Join-Path $psScriptRoot Commands

[include('*-*')]$commandsPath

$exportedVariables  = @("$($MyInvocation.MyCommand.ScriptBlock.Module.Name)")

$psa = $MyInvocation.MyCommand.ScriptBlock.Module

if ($profile) {
    @($profile.psobject.properties | 
        Where-Object MemberType -EQ NoteProperty |
        Select-Object -ExpandProperty Value) -as [io.fileinfo[]] | 
        Split-Path | 
        Select-Object -Unique |
        Where-Object { $_ } | 
        Join-Path -ChildPath "$($MyInvocation.MyCommand.ScriptBlock.Module.Name).profile.ps1" |
        Where-Object { $_ | Test-Path } |
        . { process {
            . "$_"
        } }
}

Export-ModuleMember -Function * -Alias * -Variable $exportedVariables