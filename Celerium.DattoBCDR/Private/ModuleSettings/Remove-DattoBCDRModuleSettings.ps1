function Remove-DattoBCDRModuleSettings {
<#
    .SYNOPSIS
        Removes the stored Datto configuration folder

    .DESCRIPTION
        The Remove-DattoBCDRModuleSettings cmdlet removes the Datto folder and its files
        This cmdlet also has the option to remove sensitive Datto variables as well

        By default configuration files are stored in the following location and will be removed:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfPath
        Define the location of the Datto configuration folder

        By default the configuration folder is located at:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER AndVariables
        Define if sensitive Datto variables should be removed as well

        By default the variables are not removed

    .EXAMPLE
        Remove-DattoBCDRModuleSettings

        Checks to see if the default configuration folder exists and removes it if it does

        The default location of the Datto configuration folder is:
            $env:USERPROFILE\Celerium.DattoBCDR

    .EXAMPLE
        Remove-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -AndVariables

        Checks to see if the defined configuration folder exists and removes it if it does
        If sensitive Datto variables exist then they are removed as well

        The location of the Datto configuration folder in this example is:
            C:\Celerium.DattoBCDR

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRModuleSettings.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Destroy',SupportsShouldProcess, ConfirmImpact = 'None')]
    Param (
        [Parameter(ParameterSetName = 'Set')]
        [string]$DattoBCDRConfPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) ),

        [Parameter(ParameterSetName = 'Set')]
        [switch]$AndVariables
    )

    begin {}

    process {

        if (Test-Path $DattoBCDRConfPath) {

            Remove-Item -Path $DattoBCDRConfPath -Recurse -Force -WhatIf:$WhatIfPreference

            If ($AndVariables) {
                Remove-DattoBCDRAPIKey
                Remove-DattoBCDRBaseURI
            }

            if (!(Test-Path $DattoBCDRConfPath)) {
                Write-Output "The Celerium.DattoBCDR configuration folder has been removed successfully from [ $DattoBCDRConfPath ]"
            }
            else {
                Write-Error "The Celerium.DattoBCDR configuration folder could not be removed from [ $DattoBCDRConfPath ]"
            }

        }
        else {
            Write-Warning "No configuration folder found at [ $DattoBCDRConfPath ]"
        }

    }

    end {}

}