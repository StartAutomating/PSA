<#
.SYNOPSIS
    Masks an email
.DESCRIPTION
    Masks an email, displaying only the first 3 letters of the address and domain.
#>
$this.email -replace '(?<u>.{3}).+?@(?<d>.{3}).+?(?<s>\..+)$','${u}***@${d}***${s}'