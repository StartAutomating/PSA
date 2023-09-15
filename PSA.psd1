@{
    ModuleVersion = '0.1'
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
# PowerShell Announcements (with AtProtocol) [0.1]

PSA is:

* A PowerShell Module For Making Announcements
* A Beautiful BlueSky Client for the CLI
* An (Almost) Perfect PowerShell Wrapper for the At Protocol
* A GitHub Action to Automate Announcements

---
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
