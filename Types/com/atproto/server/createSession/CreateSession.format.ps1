
Write-FormatView -TypeName com.atproto.server.createSession -Property handle, email, did -VirtualProperty @{
    email = {
        $_.MaskedEmail
    }
}