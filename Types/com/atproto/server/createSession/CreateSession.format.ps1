
Write-FormatView -TypeName com.atproto.server.createSession -Property handle, email, did -VirtualProperty @{
    email = {
        $_.email -replace '(?<u>.{3}).+?@(?<d>.{3}).+?(?<s>\..+)$','${u}***@${d}***${s}'
    }
}