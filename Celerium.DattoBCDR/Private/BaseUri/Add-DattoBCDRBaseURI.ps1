function Add-DattoBCDRBaseURI {
<#
    .SYNOPSIS
        Sets the base URI for the Datto API connection

    .DESCRIPTION
        The Add-DattoBCDRBaseURI cmdlet sets the base URI which is
        later used to construct the full URI for all API calls

    .PARAMETER BaseUri
        Define the base URI for the Datto API connection using Datto's URI or a custom URI

    .PARAMETER DataCenter
        Datto's URI connection point that can be one of the predefined data centers

        The accepted values for this parameter are:
        [ US ]
            US = https://api.datto.com/v1

    .EXAMPLE
        Add-DattoBCDRBaseURI

        The default base URI will use https://api.datto.com/v1

    .EXAMPLE
        Add-DattoBCDRBaseURI -DataCenter US

        The default base URI will use https://api.datto.com/v1

    .EXAMPLE
        Add-DattoBCDRBaseURI -BaseUri http://myapi.gateway.celerium.org

        A custom API gateway of http://myapi.gateway.celerium.org will be used
        for all API calls to Datto's API

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRBaseURI.html
#>

    [cmdletbinding(DefaultParameterSetName = 'PreDefinedUri')]
    [Alias('Set-DattoBCDRBaseURI')]
    Param (
        [Parameter(Mandatory = $false , ValueFromPipeline = $true)]
        [string]$BaseUri = 'https://api.datto.com/v1',

        [Parameter(Mandatory = $false)]
        [ValidateSet( 'US' )]
        [string]$DataCenter
    )

    begin {}

    process {

        if ($BaseUri[$BaseUri.Length-1] -eq "/") {
            $BaseUri = $BaseUri.Substring(0,$BaseUri.Length-1)
        }

        switch ($DataCenter) {
            'US' { $BaseUri = 'https://api.datto.com/v1' }
        }

        Set-Variable -Name "DattoBCDRModuleBaseUri" -Value $BaseUri -Option ReadOnly -Scope Global -Force

    }

    end {}

}