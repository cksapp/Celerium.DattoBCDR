function Get-DattoBCDRDevice {
<#
    .SYNOPSIS
        Gets Datto BCDR devices from the the Datto API

    .DESCRIPTION
        The Get-DattoBCDRDevice cmdlet gets can get a one or more
        Datto BCDR devices

    .PARAMETER SerialNumber
        BCDR serial number to return data for

        The parameter is mandatory if you want to get a specific device

    .PARAMETER ShowHiddenDevices
        Whether hidden devices should be included in your results

        Acceptable values are:
            '0', '1'

        By default '1' is returned by the API which shows hidden devices

    .PARAMETER ShowChildResellerDevices
        Whether child reseller devices should be included in your results

        Acceptable values are:
            '0', '1'

        By default '1' is returned by the API which shows child reseller devices

    .PARAMETER Page
        Page number to return

    .PARAMETER PerPage
        Amount of items to return with each Page

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-DattoBCDRDevice

        Gets BCDR devices with any hidden or child reseller devices

    .EXAMPLE
        Get-DattoBCDRDevice -ShowHiddenDevices 0 -ShowChildResellerDevices 0

        Gets BCDR devices without any hidden or child reseller devices

    .EXAMPLE
        Get-DattoBCDRDevice -Page 2 -PageSize 10

        Gets the first 10 Datto BCDR devices from the second Page
        Hidden and child reseller devices will be included

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRDevice.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'IndexByDevice')]
        [ValidateNotNullOrEmpty()]
        [string]$SerialNumber,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateSet('0','1')]
        [string]$ShowHiddenDevices,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateSet('0','1')]
        [string]$ShowChildResellerDevices,

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

        switch ( [bool]$SerialNumber ) {
            $true   { $ResourceUri = "/bcdr/device/$SerialNumber" }
            $false  { $ResourceUri = "/bcdr/device" }
        }

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($Page)                      { $UriParameters['_page']                       = $Page }
            if ($PerPage)                   { $UriParameters['_perPage']                    = $PerPage }
            if ($ShowHiddenDevices)         { $UriParameters['showHiddenDevices']           = $ShowHiddenDevices }
            if ($ShowChildResellerDevices)  { $UriParameters['showChildResellerDevices']    = $ShowChildResellerDevices }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri -UriFilter $UriParameters -AllResults:$AllResults

    }

    end {}

}
