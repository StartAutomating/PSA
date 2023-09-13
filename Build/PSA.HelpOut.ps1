#require -Module HelpOut
Push-Location ($PSScriptRoot | Split-Path)

$PipeScriptLoaded = Get-Module PSA
if (-not $PipeScriptLoaded) {
    $PipeScriptLoaded = Get-ChildItem -Recurse -Filter "*.psd1" | Where-Object Name -like 'PSA*' | Import-Module -Name { $_.FullName } -Force -PassThru
}
if ($PipeScriptLoaded) {
    "::notice title=ModuleLoaded::PSA Loaded" | Out-Host
} else {
    "::error:: PSA not loaded" |Out-Host
}

Save-MarkdownHelp -Module PSA -PassThru

Pop-Location