Write-FormatView -TypeName app.bsky.actor.getFollowers -Action {   
    Write-FormatViewExpression -ScriptBlock {
        $_ | Get-BlueSkyActorProfile -Cache
    } -ControlName app.bsky.actor.link -If {$_.Actor }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline
    
    Write-FormatViewExpression -ScriptBlock {
        $_.Actors
    } -ControlName 'app.bsky.actor.defs#profileView' -Enumerate
}