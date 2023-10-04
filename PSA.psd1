@{
    ModuleVersion = '0.1.5'
    RootModule = 'PSA.psm1'
    Guid = '09a0f1e1-23e2-4ccb-9d8d-bde5e1d6a2b2'
    FormatsToProcess = 'PSA.format.ps1xml'    
    TypesToProcess = 'PSA.types.ps1xml'
    Copyright = '2023 Start-Automating'
    CompanyName = 'Start-Automating'
    Author = 'James Brundage'
    Description = 'PowerShell Announcements (with AtProtocol).  Shoutout to the Blue Sky!'
    PrivateData = @{
        PSData = @{
            ProjectURI = 'https://github.com/StartAutomating/PSA/'
            LicenseURI = 'https://github.com/StartAutomating/PSA/blob/main/LICENSE'
            IconURI    = 'https://raw.githubusercontent.com/StartAutomating/PSA/main/Assets/PSA@1080p.png'
            ReleaseNotes = @'
## PSA 0.1.5:

* Fixing Send-AtProto for Webcards/Images (#77)
* Invoke-AtProto
  * Now supports -Raw (#75)
  * Not passing down binary data (#72)
* All AtProtocol Commands:
  * Now supports -Raw (#74)
  * Supports -Authorization (#71)
* Simplfiying PSA Module Profiles (#78)

---

Previous release notes in [CHANGELOG](https://github.com/StartAutomating/PSA/blob/main/CHANGELOG.md)

Like It?  Star It!  Love It?  Support It!
'@
        }

        Screenshots = @{
            "PSA BlueSky Posts View" = "https://raw.githubusercontent.com/StartAutomating/PSA/main/Assets/PSA-Posts-View.png"
            "PSA BlueSky Profile View" = "https://raw.githubusercontent.com/StartAutomating/PSA/main/Assets/PSA-Profile-View.png"
        }

        ScriptTypes = @{
            "PSAScript" = @{
                Description = "A script that generates an announcement"
                Pattern = "\.PSA\.ps1"
            }
            "PSAProfile" = @{
                Description = "A module profile for PSA."
                Pattern = "\.PSA\.profile\.ps1"
            }
        }

        ApplicationTypes = @{
            "Announcement"  = @{
                Description = "An announcement"
                Pattern = '\.
                    (?>
                        PSA |
                        Public\.Service\.Announcement |
                        Announc(?>ement|er|es|ing|e)
                    )\.
                    (?>
                        md | 
                        markdown |
                        txt | 
                        json |
                        csv |
                        clixml |
                        tsv |
                        ps[dm]{0,1}1 |
                    )$
                '
            }
        }
    }
}
