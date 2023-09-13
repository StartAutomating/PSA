$atRoot = Join-Path $PSScriptRoot atproto
$atLexicon = Join-Path $atRoot lexicons
$lexiconJson = Get-ChildItem -Path $atLexicon -Recurse -file -Filter *.json

$atFunctionNames = @()
$Lexicons = @()

$AtScriptRoot = Join-Path (Join-Path $PSScriptRoot Commands) "Lexicons"

if (-not (Test-Path $AtScriptRoot)) {
    $null = New-Item -ItemType Directory -Path $AtScriptRoot
}

$unbound = @()
foreach ($lexiconFile in $lexiconJson) {
    $lexiconText = Get-content -LiteralPath $lexiconFile -raw 
    $lexicon = $lexiconText | ConvertFrom-Json
    $Lexicons+=$lexicon
    if ($lexiconFile.Name -eq 'defs.json') {
        # General definitions
    } 
    else {
        $httpMethod = 
            if ($lexicon.defs.main.type -eq 'procedure') {
                "POST"        
            } elseif ($lexicon.defs.main.type -eq 'query') {
                "GET"
            } 
            elseif ($lexicon.defs.main.type -in 'record','object') {
                continue
            }
            elseif (-not $lexicon.defs.main) {
                continue
            }

        

        $AtParams = [Ordered]@{}
        
        $atSourceProperties = @(
            $lexicon.defs.main.parameters.properties.psobject.Properties
            $lexicon.defs.main.input.schema.properties.psobject.Properties
        ) -ne $null

        $atRequired = @(
            $lexicon.defs.main.parameters.required
            $lexicon.defs.main.input.schema.properties.required
        ) -ne $null
        
        foreach ($AtProperty in $atSourceProperties) {
            $AtParam = $AtParams["$($AtProperty.Name.Substring(0,1).ToUpper() + $AtProperty.Name.Substring(1))"] = [Ordered]@{}
            $AtParam.Attribute = @()
            if ($AtProperty.Value.Description) {
                $AtParam.Description = $AtProperty.Value.Description   
            }
            if ($atRequired -contains $AtProperty.Name) {
                $AtParam.Attribute += "Mandatory"
            }
            $AtParam.Attribute += "ValueFromPipelineByPropertyName"
            $AtParam.Binding = $AtProperty.Name
            $AtParam.Type = 
                switch ($AtProperty.value.type) {
                    string { [string] }
                    boolean { [switch] }
                    default { [PSObject]}
                }            
        }

        $lexiconIdParts = @($lexicon.id -split '\.')
        $secondWord = $lexiconIdParts[1]
        $lastWord = $lexiconIdParts[-1]
        $secondToLastWord = $lexiconIdParts[-2]
        $secondToLastWord = $secondToLastWord.Substring(0,1).ToUpper() + $secondToLastWord.Substring(1)
        $secondWord = $secondWord.Substring(0,1).ToUpper() + $secondWord.Substring(1)
        $prefix = "$($secondWord)$($secondToLastWord)"
        $atFunctionName = switch -regex ($lastWord) {
            "^(?>Get|Resolve|Revoke|Reset|Request|Search|Send|Enable|Disable|Update|Block|Register|Unregister)" {
                $newName = $lastWord -replace "^$($matches.0)", "`${0}-$prefix"
                $newName.Substring(0,1).ToUpper() + $newName.Substring(1)
            }
            "^Create" {
                $lastWord -replace "^Create", "Add-$prefix"
            }
            "^Delete" {
                $lastWord -replace "^Delete", "Remove-$prefix"
            }
            "^Describe" {
                $lastWord -replace "^Describe", "Get-$prefix"
            }
            "^List" {
                $lastWord -replace "^List", "Get-$prefix"
            }
            "^Upgrade" {
                $lastWord -replace "^Upgrade", "Update-$prefix"
            }
            "^Query" {
                $lastWord -replace "^Query", "Search-$prefix"
            }
            "^Mute" {
                $lastWord -replace "^Mute", "Block-$prefix"
            }
            "^Unmute" {
                $lastWord -replace "^Unmute", "Unblock-$prefix"
            }            
            "^Subscribe" {
                $lastWord -replace "^Subscribe", "Watch-$prefix"
            }
            "^Reverse" {
                $lastWord -replace "^Reverse", "Undo-$prefix"
            }
            "^Put" {
                $lastWord -replace "^Put", "Set-$prefix"
            }
            "^Follow" {
                $lastWord -replace "^Follow", "Watch-$prefix"
            }
            '^Refresh' {
                $lastWord -replace '^Refresh', "Sync-$prefix"
            }
            '^NotifyOf' {
                $lastWord -replace '^NotifyOf', "Watch-$prefix"
            }
            '^Upload' {
                $lastWord -replace '^Upload', "Set-$prefix"
            }
            '^Take' {
                $lastWord -replace '^Take', "Invoke-$prefix"
            }
            '^Apply' {
                $lastWord -replace '^Apply', "Set-$prefix"
            }
        }

        if (-not $atFunctionName -or $atFunctionName -notlike '*-*') {
            $unbound += $lexicon

            # "No Verb Found $($lexicon.id)" | Out-Host
            continue
        } else {
            $atFunctionName = $atFunctionName -replace "(?:$secondToLastWord){2}",$secondToLastWord
            $atFunctionNames += $atFunctionName
        }

        if ((-not $AtParams.Count) -and $lexicon.defs.main.input.encoding) {
            $AtParams["Data"] = [Ordered]@{
                Binding = "."
                Attribute = 'ValueFromPipelineByPropertyName'
                Type = [byte[]]
            }

            $AtParams["ContentType"] = [Ordered]@{
                Attribute = 'ValueFromPipelineByPropertyName'
                Type = [string]
            }
        }


        $atBeginBlock = [ScriptBlock]::Create(@(
            "`$NamespaceID = '$($lexicon.id)'"
            "`$httpMethod  = '$httpMethod'"
            "`$InvokeAtSplat = [Ordered]@{Method=`$httpMethod}"        
            {$InvokeAtSplat["PSTypeName"] = $NamespaceID}
            {$parameterAliases = [Ordered]@{}}
            if ($lexicon.defs.main.output.encoding -and ($lexicon.defs.main.output.encoding -ne 'application/json')) {
                {$AsByte = $true}
            } else {
                {$AsByte = $false}
            }
            ""
if ($AtParams.Count) {
{
    
:nextParameter foreach ($paramMetadata in 
    ([Management.Automation.CommandMetadata]$MyInvocation.MyCommand).Parameters.Values) {
    
    foreach ($attr in $paramMetadata.Attributes) {
        if ($attr -is [ComponentModel.DefaultBindingPropertyAttribute]) {
            $parameterAliases[$paramMetadata.Name] = $attr.Name
            continue nextParameter
        }
    }
}

}
}
{
    $parameterQueue = [Collections.Queue]::new()
}
        ) -join [Environment]::NewLine)
        

        $atProcessBlock = {
$parameterQueue.Enqueue([Ordered]@{} + $PSBoundParameters)            
        }

        $atEndBlock  = {
            $parameterQueue.ToArray() |
                Invoke-AtProtocol -Method $httpMethod -NamespaceID $NamespaceID -Parameter {
                    $_
                } -ParameterAlias $parameterAliases @InvokeAtSplat -ContentType $(
                    if ($ContentType) {
                        $ContentType
                    } else {
                        "application/json"   
                    }
                ) -AsByte:$AsByte
        }


        $lexiconLink = @(
            "https://github.com/bluesky-social/atproto/tree/main/lexicons"
            $lexiconIDParts[0..$($lexiconIDParts.Count - 2)]
            $lexiconIdParts[-1] + ".json"
        ) -join '/'

        $atFunctionDescription = if ($lexcion.description) {
            $lexcion.description
        } else {
            "$($lexicon.id)"
        }
        
        # Make AtProto camel case, for the preference of most PowerShell users.
        $atFunctionName = $atFunctionName -replace "-Atproto", "-AtProto"
        $atFunctionAliases = @(
            # If the function was named -AtProto
            if ($atFunctionName -like '*-AtProto*') {
                # give it an alias with -AtProtocol
                $atFunctionName -replace "-AtProto", "-AtProtocol"
            }
            # If the function was named -Bsky
            if ($atFunctionName -like '*-Bsky*') {
                # give it an alias with -BlueSky
                $atFunctionName -replace "-Bsky", "-BlueSky"
            }

            # And give each an alias with the last 3 words in the lexicon
            "$($lexiconIDParts[1..$($lexiconIDParts.Count - 1)] -join '.')"
            # as well as the whole identifier
            "$($lexiconIDParts[0..$($lexiconIDParts.Count - 1)] -join '.')"
        )

        $newPipeScriptSplat = [Ordered]@{
            FunctionName=$atFunctionName
            Alias= $atFunctionAliases
            Parameter=$AtParams
            Description=$atFunctionDescription
            Synopsis=$lexicon.id
            Begin = $atBeginBlock
            Process = $atProcessBlock
            End = $atEndBlock
            Link = $lexiconLink
            Attribute = "[CmdletBinding(SupportsShouldProcess)]"
        }

        
        $atFunctionDefinition =
            New-PipeScript @newPipeScriptSplat -NoTranspile

        
        $atFunctionPath = Join-Path $AtScriptRoot "$($lexiconIDParts[0..2] -join [IO.Path]::DirectorySeparatorChar)$([IO.Path]::DirectorySeparatorChar)$($atFunctionName).ps1"
        if (-not (Test-Path $atFunctionPath)) {
            $null = New-Item -ItemType File -Path $atFunctionPath -Force
        }

        $atFunctionDefinition | Set-Content -Path $atFunctionPath
        Get-Item -path $atFunctionPath
    }
    
    
}

