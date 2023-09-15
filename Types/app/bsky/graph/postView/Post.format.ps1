Write-FormatView -TypeName n/a -AsControl -Name 'app.bsky.feed.postView' -Action {
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -If { $_.Viewer.Repost } -ScriptBlock {
        $did, $collection, $key = $_.Viewer.Repost -replace "^at://" -split '/'
        Get-BlueSkyActorProfile -Actor $did -Cache
    } -ControlName app.bsky.actor.link
    
    Write-FormatViewExpression -If { $_.Viewer.Repost } -ScriptBlock {        
        "🗘"
    }

    Write-FormatViewExpression -If { $_.Record.Reply.Parent.Uri } -ScriptBlock {
        $did, $collection, $key = $_.Record.Reply.Parent.Uri -replace "^at://" -split '/'
                
        Get-BskyActorProfile -Actor $did -Cache
            
    } -ControlName app.bsky.actor.link

    Write-FormatViewExpression -If {$_.Record.Reply.Parent.Uri } -ScriptBlock {
        " 🗪 "
    }
    
    
    Write-FormatViewExpression -ControlName app.bsky.actor.link -ScriptBlock { $_.Author }
    
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -if { $_.embed.images } -ScriptBlock {
        @(foreach ($image in $_.embed.images) {
            if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
                $psStyle.FormatHyperlink("▭ $($image.alt)", $image.fullsize)
            } else {
                "$($image.alt)"
            }
        }) -join [Environment]::NewLine
    }
    

    Write-FormatViewExpression -ScriptBlock {
        $did, $feed, $rkey  =$_.uri -replace 'at://' -split '/'        
        if ($PSStyle.FormatHyperlink -and -not $env:GITHUB_WORKFLOW) {
            if ($_.Facets) {
                $_.Record.Text
            } else {                                
                $postedBy = Get-BskyActorProfile -Actor $did -Cache
                $PSStyle.FormatHyperlink($_.Record.Text,"https://bsky.app/profile/$($postedBy.handle)/$(@($feed -split '\.')[-1])/$rkey")
            }
        } else {
            $_.Record.Text
        }        
    }    

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -If { $_.embed.external.title -and $_.embed.external.uri } -ScriptBlock {
        @(
            ''
            if ((-not $env:GITHUB_WORKFLOW) -and $PSStyle.FormatHyperlink) {
                $PSStyle.FormatHyperlink($_.embed.external.title, $_.embed.external.uri)
            } else {
                $_.embed.external.title
            }
            ''
        ) -join [Environment]::NewLine
    }


}

Write-FormatView -TypeName 'app.bsky.graph.defs#postView','app.bsky.feed.defs#postView' -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName app.bsky.feed.postView    
}
