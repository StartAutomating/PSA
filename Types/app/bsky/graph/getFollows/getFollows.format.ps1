Write-FormatView -TypeName app.bsky.graph.getFollows -Action {
    Write-FormatViewExpression -ScriptBlock {
        $_ | Get-BlueSkyActorProfile -Cache
    } -ControlName app.bsky.actor.link -If {$_.Actor }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline
    
    Write-FormatViewExpression -ScriptBlock {
        $_.Follows
    } -ControlName 'app.bsky.actor.defs#profileView' -Enumerate
}