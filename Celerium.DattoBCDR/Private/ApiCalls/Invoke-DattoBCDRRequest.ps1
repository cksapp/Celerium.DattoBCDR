function Invoke-DattoBCDRRequest {
<#
    .SYNOPSIS
        Makes an API request

    .DESCRIPTION
        The Invoke-DattoBCDRRequest cmdlet invokes an API request to Datto API

        This is an internal function that is used by all public functions

        As of 2023-09 the Datto v1 API only supports GET and PUT requests

    .PARAMETER method
        Defines the type of API method to use

        Allowed values:
        'GET', 'PUT'

    .PARAMETER ResourceUri
        Defines the resource uri (url) to use when creating the API call

    .PARAMETER UriFilter
        Used with the internal function [ ConvertTo-DattoBCDRQueryString ] to combine
        a functions parameters with the ResourceUri parameter

        This allows for the full uri query to occur

        The full resource path is made with the following data
        $DattoBCDRModuleBaseUri + $ResourceUri + ConvertTo-DattoBCDRQueryString

    .PARAMETER Data
        Place holder parameter to use when other methods are supported
        by the Datto v1 API

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API
    .EXAMPLE
        Invoke-DattoBCDRRequest -Method GET -ResourceUri '/account' -UriFilter $UriFilter

        Invoke a rest method against the defined resource using any of the provided parameters

        Example:
            Name                           Value
            ----                           -----
            Method                         GET
            Uri                            https://api.datto.com/v1/account?accountId=12345&details=True
            Headers                        {Authorization = Bearer 123456789}
            Body


    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Invoke-DattoBCDRRequest.html

#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('GET','PUT')]
        [string]$method = 'GET',

        [Parameter(Mandatory = $true)]
        [string]$ResourceUri,

        [Parameter(Mandatory = $false)]
        [hashtable]$UriFilter,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        $Data = $null,

        [Parameter(Mandatory = $false)]
        [switch]$AllResults

    )

    begin {

        # Load Web assembly when needed as PowerShell Core has the assembly preloaded
        if ( !("System.Web.HttpUtility" -as [Type]) ) {
            Add-Type -Assembly System.Web
        }

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        if ($UriFilter) {
            $QueryString = ConvertTo-DattoBCDRQueryString -UriFilter $UriFilter
            Set-Variable -Name $QueryParameterName -Value $QueryString -Scope Global -Force -Confirm:$false
        }

        if ($null -eq $Data) {
            $body = $null
        } else {
            $body = $Data | ConvertTo-Json -Depth $DattoBCDRModuleJSONConversionDepth
        }

        try {
            $ApiToken = Get-DattoBCDRAPIKey -AsPlainText
            $ApiTokenBase64 = [Convert]::ToBase64String( [Text.Encoding]::ASCII.GetBytes( ("{0}:{1}" -f ($ApiToken).PublicKey,($ApiToken).SecretKey) ) )

            $parameters = [ordered] @{
                "Method"    = $method
                "Uri"       = $DattoBCDRModuleBaseUri + $ResourceUri + $QueryString
                "Headers"   = @{ 'Authorization' = 'Basic {0}'-f $ApiTokenBase64 }
                "Body"      = $body
            }

                if ( $method -ne 'GET' ) {
                    $parameters['ContentType'] = 'application/json; charset=utf-8'
                }

            Set-Variable -Name $ParameterName -Value $parameters -Scope Global -Force -Confirm:$false

            if ($AllResults) {

                Write-Verbose "Gathering all items from [  $( $DattoBCDRModuleBaseUri + $ResourceUri ) ] "

                $PageNumber = 1
                $AllResponseData = [System.Collections.Generic.List[object]]::new()

                do {

                    $parameters['Uri'] = $QueryString.Uri -replace '_page=\d+',"_page=$PageNumber"

                    $CurrentPage = Invoke-RestMethod @parameters -ErrorAction Stop

                    Write-Verbose "[ $PageNumber ] of [ $($CurrentPage.pagination.totalPages) ] Pages"

                        foreach ($item in $CurrentPage.items) {
                            $AllResponseData.add($item)
                        }

                    $PageNumber++

                } while ($CurrentPage.pagination.totalPages -ne $PageNumber - 1 -and $CurrentPage.pagination.totalPages -ne 0)

            }
            else{
                $ApiResponse = Invoke-RestMethod @parameters -ErrorAction Stop
            }

        }
        catch {

            $exceptionError = $_.Exception.Message
            Write-Warning 'The [ Invoke_DattoBCDRRequest_Parameters, Invoke_DattoBCDRRequest_ParametersQuery, & CmdletName_Parameters ] variables can provide extra details'

            switch -Wildcard ($exceptionError) {
                '*404*' { Write-Error "Invoke-DattoBCDRRequest : URI not found - [ $ResourceUri ]" }
                '*429*' { Write-Error 'Invoke-DattoBCDRRequest : API rate limited' }
                '*504*' { Write-Error "Invoke-DattoBCDRRequest : Gateway Timeout" }
                default { Write-Error $_ }
            }

        }
        finally {

            $Auth = $Invoke_DattoBCDRRequest_Parameters['headers']['Authorization']
            $Invoke_DattoBCDRRequest_Parameters['headers']['Authorization'] = $Auth.Substring( 0, [Math]::Min($Auth.Length, 9) ) + '*******'

        }

        if($AllResults) {

            #Making output consistent
            if( [string]::IsNullOrEmpty($AllResponseData.data) ) {
                $ApiResponse = $null
            }
            else{
                $ApiResponse = [PSCustomObject]@{
                    pagination  = $null
                    items       = $AllResponseData
                }
            }

            return $ApiResponse

        }
        else{

            #Making output consistent
            if ($ApiResponse.PSObject.Properties.Name -contains 'pagination') {
                return $ApiResponse
            }
            else{
                return [PSCustomObject]@{
                    pagination  = $null
                    items       = $ApiResponse
                }
            }

        }

    }

    end {}

}