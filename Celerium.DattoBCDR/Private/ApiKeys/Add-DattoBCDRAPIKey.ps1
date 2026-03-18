function Add-DattoBCDRAPIKey {
<#
    .SYNOPSIS
        Sets the API public & secret keys used to authenticate API calls

    .DESCRIPTION
        The Add-DattoBCDRAPIKey cmdlet sets the API public & secret keys
        which are used to authenticate all API calls made to Datto

        The Datto API keys are generated via the Datto portal
        Admin > Integrations

    .PARAMETER ApiKeyPublic
        Defines your API public key

    .PARAMETER ApiKeySecret
        Defines your API secret key

    .EXAMPLE
        Add-DattoBCDRAPIKey

        Prompts to enter in the API public key and secret key

    .EXAMPLE
        Add-DattoBCDRAPIKey -ApiKeyPublic '12345'

        The Datto API will use the string entered into the [ -ApiKeyPublic ] parameter as the
        public key & will then prompt to enter in the secret key

    .EXAMPLE
        ConvertTo-SecureString '12345' -AsPlainText | Add-DattoBCDRAPIKey

        The Datto API will use the secure string entered as the secret key & will prompt to enter in the public key

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRAPIKey.html
#>

    [CmdletBinding()]
    [Alias('Set-DattoBCDRAPIKey')]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = 'Please enter your API public key')]
        [ValidateNotNullOrEmpty()]
        [string]$ApiKeyPublic,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [securestring]$ApiKeySecret
    )

    begin {}

    process {

        Set-Variable -Name "DattoBCDRModuleApiKey" -Value $ApiKeyPublic -Option ReadOnly -Scope Global -Force
        Set-Variable -Name 'DattoBCDRModuleApiSecretKey' -Value $ApiKeySecret -Option ReadOnly -Scope Global -Force

    }

    end {}
}
