Write-FormatView -TypeName app.bsky.actor.getProfile -Action {
    Write-FormatViewExpression -Style 'Foreground.Blue' -ScriptBlock {
        "$($_.DisplayName)"
    }
    Write-FormatViewExpression -Style 'Foreground.Cyan', 'Bold' -ScriptBlock {
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
            $psStyle.FormatHyperlink(" @$($_.Handle) ","https://bsky.app/profile/$($_.handle)")
        } else {
            " @$($_.Handle) "
        }        
    }
    
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -ScriptBlock {
        @(
            if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
                $psStyle.FormatHyperlink("$($_.FollowersCount) followers","https://bsky.app/profile/$($_.handle)/followers")
            } else {
                "$($_.FollowersCount) followers"
            }
            if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
                $psStyle.FormatHyperlink("$($_.FollowsCount) follows","https://bsky.app/profile/$($_.handle)/follows")
            } else {
                "$($_.FollowersCount) follows"
            }
            if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
                $psStyle.FormatHyperlink("$($_.PostsCount) posts","https://bsky.app/profile/$($_.handle)")
            } else {
                "$($_.PostsCount) posts"
            }
            
        ) -join ' ⋇ '
    }
        

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -ScriptBlock {
        if ($ExecutionContext.SessionState.InvokeCommand.GetCommand('Show-Markdown', 'Cmdlet')) {
            # This lets links from your profile work in the terminal!
            Show-Markdown -InputObject $_.MarkdownDescription 
        } else {
            $_.Description
        }        
    }
}


Write-FormatView -TypeName app.bsky.actor.getProfile -Property Handle, DisplayName, Description -Wrap

Write-FormatView -TypeName app.bsky.actor.getProfile -Property Handle, Did, DisplayName, Description, Avatar, FollowsCount, FollowersCount, PostsCount -AsList


