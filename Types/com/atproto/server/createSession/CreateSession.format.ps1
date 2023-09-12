
Write-FormatView -TypeName com.atproto.server.createSession -Property handle, email, did -VirtualProperty @{
    email = {
        $_.MaskedEmail
    }
}

Write-FormatView -TypeName com.atproto.server.createSession -Property handle, email, did -VirtualProperty @{
    email = {
        $_.MaskedEmail
    }
} -AsList

Write-FormatView -TypeName com.atproto.server.createSession -Property accessJWT, refreshJWT -Name JWT

Write-FormatView -TypeName com.atproto.server.createSession -Property accessJWT, refreshJWT -Name JWT -AsList