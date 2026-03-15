function Get-DattoBCDRMetaData {
<#
    .SYNOPSIS
        Gets various Api metadata values

    .DESCRIPTION
        The Get-DattoBCDRMetaData cmdlet gets various Api metadata values from an
        Invoke-WebRequest to assist in various troubleshooting scenarios such
        as rate-limiting

    .PARAMETER BaseUri
        Define the base URI for the Datto API connection using Datto's URI or a custom URI

        The default base URI is https://api.datto.com/v1

    .EXAMPLE
        Get-DattoBCDRMetaData

        Gets various Api metadata values from an Invoke-WebRequest to assist
        in various troubleshooting scenarios such as rate-limiting

        The default full base uri test path is:
            https://api.datto.com/v1

    .EXAMPLE
        Get-DattoBCDRMetaData -BaseUri http://myapi.gateway.celerium.org

        Gets various Api metadata values from an Invoke-WebRequest to assist
        in various troubleshooting scenarios such as rate-limiting

        The full base uri test path in this example is:
            http://myapi.gateway.celerium.org/device

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRMetaData.html
#>

    [CmdletBinding()]
    Param (
        [parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string]$BaseUri = $DattoBCDRModuleBaseUri
    )

    begin { $ResourceUri = "/bcdr/agent" }

    process {

        try {

            $ApiToken = Get-DattoBCDRAPIKey -AsPlainText
            $ApiTokenBase64 = [Convert]::ToBase64String( [Text.Encoding]::ASCII.GetBytes( ("{0}:{1}" -f ($ApiToken).PublicKey,($ApiToken).SecretKey) ) )

            $DattoHeaders = New-Object "System.Collections.Generic.Dictionary[[string],[string]]"
            $DattoHeaders.Add("Content-Type", 'application/json')
            $DattoHeaders.Add('Authorization', 'Basic {0}'-f $ApiTokenBase64)

            $RestOutput = Invoke-WebRequest -Method Get -uri ($BaseUri + $ResourceUri) -headers $DattoHeaders -ErrorAction Stop
        }
        catch {

            [PSCustomObject]@{
                Method = $_.Exception.Response.Method
                StatusCode = $_.Exception.Response.StatusCode.value__
                StatusDescription = $_.Exception.Response.StatusDescription
                Message = $_.Exception.Message
                URI = $($DattoBCDRModuleBaseUri + $ResourceUri)
            }

        }
        finally {
            Remove-Variable -Name DattoHeaders -Force
        }

        if ($RestOutput){
            $Data = @{}
            $Data = $RestOutput

            [PSCustomObject]@{
                ResponseUri             = $Data.BaseResponse.ResponseUri.AbsoluteUri
                ResponsePort            = $Data.BaseResponse.ResponseUri.Port
                StatusCode              = $Data.StatusCode
                StatusDescription       = $Data.StatusDescription
                'Content-Type'          = $Data.headers.'Content-Type'
                'X-Request-Id'          = $Data.headers.'X-Request-Id'
                'X-API-Limit-Remaining' = $Data.headers.'X-API-Limit-Remaining'
                'X-API-Limit-Resets'    = $Data.headers.'X-API-Limit-Resets'
                'X-API-Limit-Cost'      = $Data.headers.'X-API-Limit-Cost'
                raw                     = $Data
            }
        }

    }

    end {}
}