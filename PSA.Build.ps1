$atRoot = Join-Path $PSScriptRoot atproto
$atLexicon = Join-Path $atRoot lexicons
$lexiconJson = Get-ChildItem -Path $atLexicon -Recurse -file -Filter *.json

$atFunctionNames = @()
$Lexicons = @()

$AtScriptRoot = Join-Path (Join-Path $PSScriptRoot Commands) "Lexicons"

if (-not (Test-Path $AtScriptRoot)) {
    $null = New-Item -ItemType Directory -Path $AtScriptRoot
}

# The At Protocol could stand a bit better documentation of inputs and their purpose
# However, we can predefine help for several parameters that will exist in a variety of commands.
$atParameterHelp = 
    [Ordered]@{
        Actor  = "
The Actor.

This can be either a handle (e.g. @AtProto.com) or a Decentralized Identifier (.did)"

        Cursor = "
A cursor that can be used to get more results.

Any command that accepts a -Cursor parameter returns a .Cursor property.

You can provide this -Cursor to the same command with the same input to get more results.
"
        Limit = "A limit to the number of results returned."
        Did   = "The Decentralized Identifier.  This is a uniqueID used throughout the At Protocol."
    }

$script:LastDefinitionFile = $null
$Script:LastDefinitionLexiconId = $null
function ResolveAtRefs {
    param($PropertyName, $refToFind)
    
    
    $decorateProperty = [Ordered]@{}
    if (-not $refToFind) { return $decorateProperty }
    $decorateProperty[$PropertyName] = $refToFind

    $propertyCollection = $null 
    if ($executionContext.SessionState.InvokeCommand.GetCommand($refToFind,'Alias')) {
        $reference = & $refToFind
        if (-not $reference) { return $decorateProperty }
        if ($reference.defs) {
            $script:LastDefinitionFile = $reference
            $refWithinDef = @($refToFind -split '#',2)[-1]
            if ($reference.defs.($refWithinDef)) {
                $reference = $reference.defs.($refWithinDef)
            }
        }
        $propertyCollection = $reference.properties.psobject.properties        
    }
    elseif ($lexicon.defs.($refToFind -replace '^#')){
        $Script:LastDefinitionLexiconId = $lexicon.id
        $propertyCollection = $lexcion.defs.($refToFind -replace '^#').properties.psobject.properties
    }
    elseif ($script:LastDefinitionFile.defs.($refToFind -replace '^#')) {
        $Script:LastDefinitionLexiconId = $script:LastDefinitionFile.id
        $propertyCollection = $script:LastDefinitionFile.defs.($refToFind -replace '^#').properties.psobject.properties
    }

    foreach ($referrencedProperty in $propertyCollection) {
        if (-not $referrencedProperty.value.ref) { continue }
        $recursiveRefs = ResolveAtRefs $referrencedProperty.Name $referrencedProperty.value.ref
        if ($recursiveRefs.Count) {
            foreach ($kv in $recursiveRefs.GetEnumerator()) {
                $decorateProperty["$($PropertyName).$($kv.Key)"] = 
                    if ($kv.Value -match '^#' -and $Script:LastDefinitionLexiconId) {
                        $Script:LastDefinitionLexiconId + $kv.Value
                    } else {
                        $kv.Value
                    }
            }
        }            
    }

    return $decorateProperty
}

$unbound = @()
foreach ($lexiconFile in $lexiconJson) {
    $lexiconText = Get-content -LiteralPath $lexiconFile -raw 
    $lexicon = $lexiconText | ConvertFrom-Json
    $Lexicons+=$lexicon
    $lexiconIdParts = @($lexicon.id -split '\.')
    $secondWord = $lexiconIdParts[1]
    $lastWord = $lexiconIdParts[-1]
    $secondToLastWord = $lexiconIdParts[-2]
    $secondToLastWord = $secondToLastWord.Substring(0,1).ToUpper() + $secondToLastWord.Substring(1)
    $secondWord = $secondWord.Substring(0,1).ToUpper() + $secondWord.Substring(1)
    $prefix = "$($secondWord)$($secondToLastWord)"


    

    if ($lexiconFile.Name -eq 'defs.json') {
        # General definitions

        # This is a whole other beast.

        # The easiest and most flexible path here is to make this it's own category of command, one that returns itself.


        $atFunctionName = "Get-${Prefix}Definition"
        $atFunctionDefinition = New-PipeScript -End ([scriptblock]::Create("
`$lexiconText = @'
$($lexiconText)
'@
`$lexicon = `$lexiconText | ConvertFrom-JSON
if (`$myInvocation.InvocationName -eq `$myInvocation.MyCommand.Name) {
    `$lexicon
} elseif (`$myInvocation.InvocationName -like '*#*') {
    `$lexicon.defs.`$(@(`$myInvocation.InvocationName -split '\#',2)[1])
} else {
    `$lexicon
}
")) -FunctionName $atFunctionName -Alias @(
    # And give each an alias with the last 3 words in the lexicon
    "$($lexiconIDParts[1..$($lexiconIDParts.Count - 1)] -join '.')"
    # as well as the whole identifier
    "$($lexiconIDParts -join '.')"
    foreach ($prop in $lexicon.defs.psobject.Properties) {
        "$($lexiconIDParts -join '.')#$($prop.Name)"
    }
)

        $atFunctionPath = Join-Path $AtScriptRoot "$($lexiconIDParts[0..2] -join [IO.Path]::DirectorySeparatorChar)$([IO.Path]::DirectorySeparatorChar)$($atFunctionName).ps1"
        if (-not (Test-Path $atFunctionPath)) {
            $null = New-Item -ItemType File -Path $atFunctionPath -Force
        }

        

        $atFunctionDefinition | Set-Content -Path $atFunctionPath
        Get-Item -path $atFunctionPath


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
            } elseif ($atParameterHelp[$AtProperty.Name]) {
                $AtParam.Description = $atParameterHelp[$AtProperty.Name]
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


        $decorateProperty = [Ordered]@{}
        foreach ($outputProperty in $lexicon.defs.main.output.schema.properties.PSObject.Properties) {
        
            # If the output property had decoration, we want to carry it down
            $refToFind = 
                if ($outputProperty.Value.ref) {
                    $outputProperty.Value.ref
                } elseif ($outputProperty.Value.items.ref) {
                    $outputProperty.Value.items.ref
                }
            if (-not $refToFind) { continue }
            $resolvedRefProps = ResolveAtRefs $outputProperty.Name $refToFind
            if ($resolvedRefProps -is [Collections.IDictionary]) {
                $decorateProperty += $resolvedRefProps
            } else {
                $null = $null
            }                        
        }        

        $atBeginBlock = [ScriptBlock]::Create(@(
            "`$NamespaceID = '$($lexicon.id)'"
            "`$httpMethod  = '$httpMethod'"
            "`$InvokeAtSplat = [Ordered]@{Method=`$httpMethod}"
            if ($decorateProperty.Count) {
                "`$InvokeAtSplat.DecorateProperty = [Ordered]@{
$(@(foreach ($kv in $decorateProperty.GetEnumerator()) {
    "    '$($kv.Key)'='$($kv.Value)'"
}) -join [Environment]::NewLine)
}"
            }
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
                ) -AsByte:$AsByte -Property {
                    $_
                } -Cache:$(
                    if ($cache) {$cache} else { $false }
                )
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

        if (-not $AtParams["Cache"] -and $httpMethod -eq 'GET') {
            $AtParams["Cache"] = [Ordered]@{
                Name = "Cache"
                Help = "If set, will cache results for performance."
                ParameterType = [switch]
            }
        }

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

        # If the parameter had a cursor, go ahead an make a .More method for that type
        if ($AtParams.Cursor) {
            $typesDirectory = Join-Path $pwd Types
            $targetDirectory =  $typesDirectory
            foreach ($part in $lexiconIdParts) {
                $targetDirectory = Join-Path $targetDirectory $part
            }
            
            $psTypeNamePath = (Join-Path $targetDirectory "PSTypeName.txt")
            if (-not (Test-Path $psTypeNamePath)) {
                $null = New-Item -ItemType File -Path $psTypeNamePath -Force
            }

            [IO.File]::WriteAllText($psTypeNamePath,"$($lexicon.id)") 

            Get-Item -Path $psTypeNamePath
            
            $MorePath = Join-path $targetDirectory "get_More.ps1"
            if (-not (Test-Path $MorePath)) {
                $null = New-Item -ItemType File -Path $psTypeNamePath -Force
            }
            Set-Content "$({
<#
.SYNOPSIS
    Gets additional results.
.DESCRIPTION
    Gets the next page of results of MORE.
#>
$this | MORE
} -replace "MORE", $(
    if ($AtParams.Cache) {
        "$($lexicon.id) -Cache"
    } else {
        $lexicon.id
    }    
))" -Path $MorePath
            Get-Item -Path $MorePath -Force
        }
    }
    
    
}

