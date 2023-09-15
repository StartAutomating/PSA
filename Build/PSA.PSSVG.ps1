#requires -Module PSSVG

Push-Location ($PSScriptRoot  | Split-Path)

$assetsPath = Join-Path $pwd Assets

if (-not (Test-Path $assetsPath)) {
    $null = New-Item -ItemType Directory -path $assetsPath -Force
}
svg -content $(
    $commonParameters = [Ordered]@{
        Fill        = '#4488FF'
        Stroke      = 'black'
        StrokeWidth = '0.05'
    }

    svg.symbol -Id psChevron -Content @(
        svg.polygon -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100
    
    svg.use -Href '#psChevron' -X -25% -Y 22.5% @commonParameters -Height 49% -Opacity .9
    svg.text -Text '@' -X 63% -Y 45%  -FontSize 5 -FontFamily monospace @commonParameters -DominantBaseline 'middle' -TextAnchor 'middle'
    svg.text -Text 'PSA' -X 50% -Y 50%  -FontSize 48 -FontFamily monospace @commonParameters -DominantBaseline 'middle' -TextAnchor 'middle'
) -ViewBox 0, 0, 200, 100 -OutputPath $(    
    Join-Path $assetsPath PSA.svg
)

Pop-Location