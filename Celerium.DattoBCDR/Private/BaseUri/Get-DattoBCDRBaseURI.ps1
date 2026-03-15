function Get-DattoBCDRBaseURI {
<#
    .SYNOPSIS
        Shows the Datto base URI global variable

    .DESCRIPTION
        The Get-DattoBCDRBaseURI cmdlet shows the Datto
        base URI global variable value

    .EXAMPLE
        Get-DattoBCDRBaseURI

        Shows the Datto base URI global variable value

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRBaseURI.html
#>

    [cmdletbinding(DefaultParameterSetName = 'Index')]
    Param ()

    begin {}

    process {

        switch ([bool]$DattoBCDRModuleBaseUri) {
            $true   { $DattoBCDRModuleBaseUri }
            $false  { Write-Warning "The Datto base URI is not set. Run Add-DattoBCDRBaseURI to set the base URI." }
        }

    }

    end {}

}