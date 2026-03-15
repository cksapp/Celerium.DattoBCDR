function Remove-DattoBCDRAPIKey {
<#
    .SYNOPSIS
        Removes the Datto API public & secret key global variables

    .DESCRIPTION
        The Remove-DattoBCDRAPIKey cmdlet removes the Datto API public & secret key global variables

    .EXAMPLE
        Remove-DattoBCDRAPIKey

        Removes the Datto API public & secret key global variables

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRAPIKey.html
#>

    [cmdletbinding(DefaultParameterSetName = 'Destroy', SupportsShouldProcess, ConfirmImpact = 'None')]
    Param ()

    begin {}

    process {

        switch ([bool]$DattoBCDRModuleApiKey) {
            $true   { Remove-Variable -Name "DattoBCDRModuleApiKey" -Scope Global -Force }
            $false  { Write-Warning "The Datto API [ public ] key is not set. Nothing to remove" }
        }

        switch ([bool]$DattoBCDRModuleApiSecretKey) {
            $true   { Remove-Variable -Name "DattoBCDRModuleApiSecretKey" -Scope Global -Force }
            $false  { Write-Warning "The Datto API [ secret ] key is not set. Nothing to remove" }
        }

    }

    end {}

}