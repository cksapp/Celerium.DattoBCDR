function ConvertTo-DattoBCDRQueryString {
<#
    .SYNOPSIS
        Converts uri filter parameters

    .DESCRIPTION
        The ConvertTo-DattoBCDRQueryString cmdlet converts & formats uri filter parameters
        from a function which are later used to make the full resource uri for
        an API call

        This is an internal helper function that ties in directly with the
        Invoke-DattoBCDRRequest & any public functions that define parameters

    .PARAMETER UriFilter
        Hashtable of values to combine a functions parameters with
        the ResourceUri parameter

        This allows for the full uri query to occur

    .EXAMPLE
        ConvertTo-DattoBCDRQueryString -UriFilter $UriFilter -ResourceUri '/account'

        Example: (From public function)
            $UriFilter = @{}

            ForEach ( $Key in $PSBoundParameters.GetEnumerator() ){
                if( $excludedParameters -contains $Key.Key ){$null}
                else{ $UriFilter += @{ $Key.Key = $Key.Value } }
            }

            1x key = https://api.datto.com/v1/account?accountId=12345
            2x key = https://api.datto.com/v1/account?accountId=12345&details=True

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/ConvertTo-DattoBCDRQueryString.html

#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
    [hashtable]$UriFilter
)

    begin {}

    process {

        if (-not $UriFilter) {
            return ""
        }

        $params = @()
        foreach ($key in $UriFilter.Keys) {

            $rawValue = $UriFilter[$key]

            if ($rawValue -is [System.Collections.IEnumerable] -and $rawValue -isnot [string]) {
                foreach ($item in $rawValue) {
                    $encodedValue = [System.Net.WebUtility]::UrlEncode($item)
                    $params += "$key=$encodedValue"
                }
            }
            else {
                $encodedValue = [System.Net.WebUtility]::UrlEncode($rawValue)
                $params += "$key=$encodedValue"
            }

        }

        $QueryString = '?' + ($params -join '&')
        return $QueryString

    }

    end {}

}