function Test-DattoBCDRAPIKey {
<#
    .SYNOPSIS
        Test the Datto API public & secret keys

    .DESCRIPTION
        The Test-DattoBCDRAPIKey cmdlet tests the base URI & API public & secret keys that were defined in the
        Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

    .PARAMETER BaseUri
        Define the base URI for the Datto API connection using Datto's URI or a custom URI

        The default base URI is https://api.datto.com/v1/bcdr

    .EXAMPLE
        Test-DattoBCDRBaseURI

        Tests the base URI & API access token that was defined in the
        Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

        The default full base uri test path is:
            https://api.datto.com/v1/bcdr/device

    .EXAMPLE
        Test-DattoBCDRBaseURI -BaseUri http://myapi.gateway.celerium.org

        Tests the base URI & API access token that was defined in the
        Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

        The full base uri test path in this example is:
            http://myapi.gateway.celerium.org/device

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Test-DattoBCDRAPIKey.html
#>

    [CmdletBinding()]
    Param (
        [parameter(ValueFromPipeline = $true)]
        [string]$BaseUri = $DattoBCDRModuleBaseUri
    )

    begin { $ResourceUri = "/bcdr/agent" }

    process {

        try {

            $ApiToken = Get-DattoBCDRAPIKey -AsPlainText
            $ApiTokenBase64 = [Convert]::ToBase64String( [Text.Encoding]::ASCII.GetBytes( ("{0}:{1}" -f ($ApiToken).PublicKey,($ApiToken).SecretKey) ) )

            $Headers = @{}
            $Headers.Add('Authorization', 'Basic {0}'-f $ApiTokenBase64)

            $Parameters = @{
                'Method'        = 'GET'
                'Uri'           = $BaseUri + $ResourceUri
                'Headers'       = $Headers
                'UserAgent'     = $DattoBCDRModuleUserAgent
                UseBasicParsing = $true
            }

            $RestOutput = Invoke-WebRequest @Parameters -ErrorAction Stop
        }
        catch {

            [PSCustomObject]@{
                Method              = $_.Exception.Response.Method
                StatusCode          = $_.Exception.Response.StatusCode.value__
                StatusDescription   = $_.Exception.Response.StatusDescription
                Message             = $_.Exception.Message
                URI                 = $($DattoBCDRModuleBaseUri + $ResourceUri)
            }

        }
        finally {
            [void] ($Headers.Remove('Authorization'))
        }

        if ($RestOutput) {
            $Data = @{}
            $Data = $RestOutput

            [PSCustomObject]@{
                StatusCode          = $Data.StatusCode
                StatusDescription   = $Data.StatusDescription
                URI                 = $($DattoBCDRModuleBaseUri + $ResourceUri)
            }
        }

    }

    end {}

}
