Write-FormatView -TypeName "app.bsky.feed.getAuthorFeed",
    "app.bsky.feed.getActorLikes",
    "app.bsky.feed.getTimeline",
    'app.bsky.unspecced.getPopular' -Action {
    
    Write-FormatViewExpression -ScriptBlock {
        $_ | Get-BlueSkyActorProfile -Cache
    } -ControlName app.bsky.actor.link -If {$_.Actor }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline
    
    Write-FormatViewExpression -ScriptBlock {
        $_.Feed.Post
    } -ControlName app.bsky.feed.postView -Enumerate
    
}