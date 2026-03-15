function Export-DattoBCDRModuleSettings {
<#
    .SYNOPSIS
        Exports the Datto BaseURI, API, & JSON configuration information to file

    .DESCRIPTION
        The Export-DattoBCDRModuleSettings cmdlet exports the Datto BaseURI, API, & JSON configuration information to file

        Making use of PowerShell's System.Security.SecureString type, exporting module settings encrypts your API key in a format
        that can only be unencrypted with the your Windows account as this encryption is tied to your user principal
        This means that you cannot copy your configuration file to another computer or user account and expect it to work

    .PARAMETER DattoBCDRConfPath
        Define the location to store the Datto configuration file

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfFile
        Define the name of the Datto configuration file

        By default the configuration file is named:
            config.psd1

    .EXAMPLE
        Export-DattoBCDRModuleSettings

        Validates that the BaseURI, API, and JSON depth are set then exports their values
        to the current user's Datto configuration file located at:
            $env:USERPROFILE\Celerium.DattoBCDR\config.psd1

    .EXAMPLE
        Export-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -DattoBCDRConfFile MyConfig.psd1

        Validates that the BaseURI, API, and JSON depth are set then exports their values
        to the current user's Datto configuration file located at:
            C:\Celerium.DattoBCDR\MyConfig.psd1

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Export-DattoBCDRModuleSettings.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Set')]
    Param (
        [Parameter(ParameterSetName = 'Set')]
        [string]$DattoBCDRConfPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) ),

        [Parameter(ParameterSetName = 'Set')]
        [string]$DattoBCDRConfFile = 'config.psd1'
    )

    begin {}

    process {

        Write-Warning "Secrets are stored using Windows Data Protection API (DPAPI)"
        Write-Warning "DPAPI provides user context encryption in Windows but NOT in other operating systems like Linux or UNIX. It is recommended to use a more secure & cross-platform storage method"

        $DattoBCDRConfig = Join-Path -Path $DattoBCDRConfPath -ChildPath $DattoBCDRConfFile

        # Confirm variables exist and are not null before exporting
        if ($DattoBCDRModuleBaseUri -and $DattoBCDRModuleApiKey -and $DattoBCDRModuleApiSecretKey -and $DattoBCDRModuleJSONConversionDepth) {
            $SecureString = $DattoBCDRModuleApiSecretKey | ConvertFrom-SecureString

            if ($IsWindows -or $PSEdition -eq 'Desktop') {
                New-Item -Path $DattoBCDRConfPath -ItemType Directory -Force | ForEach-Object { $_.Attributes = $_.Attributes -bor "Hidden" }
            }
            else{
                New-Item -Path $DattoBCDRConfPath -ItemType Directory -Force
            }
@"
    @{
        DattoBCDRModuleBaseUri              = '$DattoBCDRModuleBaseUri'
        DattoBCDRModuleApiKey               = '$DattoBCDRModuleApiKey'
        DattoBCDRModuleApiSecretKey         = '$SecureString'
        DattoBCDRModuleJSONConversionDepth  = '$DattoBCDRModuleJSONConversionDepth'
        DattoBCDRModuleUserAgent            = '$DattoBCDRModuleUserAgent'
    }
"@ | Out-File -FilePath $DattoBCDRConfig -Force
        }
        else {
            Write-Error "Failed to export Datto Module settings to [ $DattoBCDRConfig ]"
            Write-Error $_
            exit 1
        }

    }

    end {}

}