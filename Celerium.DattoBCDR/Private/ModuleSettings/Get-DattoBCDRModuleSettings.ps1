function Get-DattoBCDRModuleSettings {
<#
    .SYNOPSIS
        Gets the saved Datto configuration settings

    .DESCRIPTION
        The Get-DattoBCDRModuleSettings cmdlet gets the saved Datto configuration settings
        from the local system

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfPath
        Define the location to store the Datto configuration file

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfFile
        Define the name of the Datto configuration file

        By default the configuration file is named:
            config.psd1

    .PARAMETER OpenConfFile
        Opens the Datto configuration file

    .EXAMPLE
        Get-DattoBCDRModuleSettings

        Gets the contents of the configuration file that was created with the
        Export-DattoBCDRModuleSettings

        The default location of the Datto configuration file is:
            $env:USERPROFILE\Celerium.DattoBCDR\config.psd1

    .EXAMPLE
        Get-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -DattoBCDRConfFile MyConfig.psd1 -OpenConfFile

        Opens the configuration file from the defined location in the default editor

        The location of the Datto configuration file in this example is:
            C:\Celerium.DattoBCDR\MyConfig.psd1

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRModuleSettings.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [string]$DattoBCDRConfPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) ),

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [string]$DattoBCDRConfFile = 'config.psd1',

        [Parameter(Mandatory = $false, ParameterSetName = 'show')]
        [switch]$OpenConfFile
    )

    begin {
        $DattoBCDRConfig = Join-Path -Path $DattoBCDRConfPath -ChildPath $DattoBCDRConfFile
    }

    process {

        if ( Test-Path -Path $DattoBCDRConfig ){

            if($OpenConfFile){
                Invoke-Item -Path $DattoBCDRConfig
            }
            else{
                Import-LocalizedData -BaseDirectory $DattoBCDRConfPath -FileName $DattoBCDRConfFile
            }

        }
        else{
            Write-Verbose "No configuration file found at [ $DattoBCDRConfig ]"
        }

    }

    end {}

}