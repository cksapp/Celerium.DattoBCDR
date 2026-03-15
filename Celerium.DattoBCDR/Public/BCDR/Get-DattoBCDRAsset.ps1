function Get-DattoBCDRAsset {
<#
    .SYNOPSIS
        Get Datto BCDR assets (agents and shares) for a given device

    .DESCRIPTION
        The Get-DattoBCDRAsset cmdlet gets Datto BCDR assets
        (agents and shares) for a given device

    .PARAMETER SerialNumber
        BCDR serial number to return data for

    .PARAMETER Page
        Page number to return

    .PARAMETER PerPage
        Amount of items to return with each Page

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-DattoBCDRAsset -SerialNumber "12345678"

        Gets the Datto BCDR with the defined SerialNumber and
        returns any agents or shares

    .EXAMPLE
        Get-DattoBCDRAsset -SerialNumber "12345678" -Page 2 -PageSize 10

        Gets the Datto BCDR with the defined SerialNumber and returns
        the first 10 agents or shares from the 2nd Page of results

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAsset.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$SerialNumber,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Page,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$PerPage,

        [Parameter( Mandatory = $false, ParameterSetName = 'Index')]
        [switch]$AllResults
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/bcdr/device/$SerialNumber/asset"

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -like 'Index*') {
            if ($Page)      { $UriParameters['_page']       = $Page }
            if ($PerPage)   { $UriParameters['_perPage']    = $PerPage }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri -UriFilter $UriParameters -AllResults:$AllResults

    }

    end {}

}
