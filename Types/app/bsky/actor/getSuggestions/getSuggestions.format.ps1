Write-FormatView -TypeName app.bsky.actor.searchActors -Action {       
    Write-FormatViewExpression -ScriptBlock {
        $_.Actors
    } -ControlName 'app.bsky.actor.defs#profileView' -Enumerate
}