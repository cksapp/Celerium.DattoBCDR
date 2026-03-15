function Remove-DattoBCDRBaseURI {
<#
    .SYNOPSIS
        Removes the Datto base URI global variable

    .DESCRIPTION
        The Remove-DattoBCDRBaseURI cmdlet removes the Datto
        base URI global variable

    .EXAMPLE
        Remove-DattoBCDRBaseURI

        Removes the Datto base URI global variable

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRBaseURI.html
#>

    [cmdletbinding(DefaultParameterSetName = 'Destroy', SupportsShouldProcess, ConfirmImpact = 'None')]
    Param ()

    begin {}

    process {

        switch ([bool]$DattoBCDRModuleBaseUri) {

            $true   {
                if ($PSCmdlet.ShouldProcess('DattoBCDRModuleBaseUri')) {
                    Remove-Variable -Name "DattoBCDRModuleBaseUri" -Scope Global -Force
                }
            }
            $false  { Write-Warning "The DattoBCDR base URI variable is not set. Nothing to remove" }

        }

    }

    end {}

}