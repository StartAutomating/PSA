Write-FormatView  -AsControl -Name "app.bsky.actor.link" -TypeName "n/a" -Action {
    Write-FormatViewExpression -Style 'Foreground.Magenta','Bold' -ScriptBlock {
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
            $psStyle.FormatHyperlink("$($_.DisplayName)","https://bsky.app/profile/$($_.handle)")
        } else {
            "$($_.DisplayName)"
        }
    }
    Write-FormatViewExpression -Style 'Foreground.Cyan', 'Bold' -ScriptBlock {
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
            $psStyle.FormatHyperlink(" @$($_.Handle) ","https://bsky.app/profile/$($_.handle)")
        } else {
            " @$($_.Handle) "
        }        
    }
}


Write-FormatView -TypeName "app.bsky.actor.defs#profileView" -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName 'app.bsky.actor.defs#profileView'
}

Write-FormatView -TypeName n/a -AsControl -Name "app.bsky.actor.defs#profileView"  -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName app.bsky.actor.link
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Property Description
    Write-FormatViewExpression -Newline
}