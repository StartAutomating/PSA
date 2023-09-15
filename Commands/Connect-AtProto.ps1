function Connect-AtProto
{
    <#
    .SYNOPSIS
        Connects to the AtProtocol
    .DESCRIPTION
        Connects using the AtProtocol.
    #>
    [Alias('Connect-BlueSky','Connect-Bsky','Connect-AtProtocol')]
    param(
    # The authorization.  This can be a credential.    
    # The username is a handle or email.
    # The password is the app password.
    # If no credential is provided, some environment variables can be used:
    # `$env:AT_PROTOCOL_HANDLE` or `$env:AT_PROTOCOL_EMAIL can define the identity.
    # `$env:AT_PROTOCOL_APP_PASSWORD` can define the app password.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $Authentication
    )


    begin {
        if (-not $script:AtServerSessions) {
            $script:AtServerSessions = [Ordered]@{}
        }
    }

    process {
        if (-not $Authentication) {
            $atIdentity = 
                if ($env:AT_PROTOCOL_HANDLE) {
                    $env:AT_PROTOCOL_HANDLE
                }
                elseif ($env:AT_PROTOCOL_EMAIL) {
                    $env:AT_PROTOCOL_EMAIL
                }
            
            $atAppPassword = $env:AT_PROTOCOL_APP_PASSWORD
            if ($atIdentity -and $atAppPassword) {
                $Authentication = [PSCredential]::new($atIdentity, (ConvertTo-SecureString -AsPlainText -Force $atAppPassword))
            }
        }
        
        if ($Authentication -isnot [Management.Automation.PSCredential]) {
            Write-Error "No credential provided or found"
            return
        }

        $sessionConnected = Add-AtProtoServerSession -Identifier $Authentication.UserName -Password $Authentication.GetNetworkCredential().password


        $script:AtServerSessions[$sessionConnected.handle] = $sessionConnected

        $script:AtProtocolAccessJWT  = $sessionConnected.accessJWT
        $script:AtProtocolRefreshJWT = $sessionConnected.refreshJWT

        $sessionConnected
    }
}
