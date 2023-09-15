@{
    "runs-on" = "ubuntu-latest"
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v4'
            with = @{
                submodules = $true
            }
        },
        @{
            name = 'GitLogger'
            uses = 'GitLogging/GitLoggerAction@main'
            id = 'GitLogger'
        },
        @{
            name = 'Use PSSVG Action'
            uses = 'StartAutomating/PSSVG@main'
            id = 'PSSVG'
        },        
        @{
            name = 'Run PipeScript'            
            uses = 'StartAutomating/PipeScript@main'
            id = 'PipeScript'
        },        
        'RunEZOut',
        'RunHelpOut',
        @{
            name = 'Run PSA'            
            uses = './'
            id = 'PSA'
        }
    )
}