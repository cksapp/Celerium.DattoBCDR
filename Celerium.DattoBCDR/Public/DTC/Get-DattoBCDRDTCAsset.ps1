function Get-DattoBCDRDTCAsset {
<#
    .SYNOPSIS
        Get details for direct-to-cloud assets

    .DESCRIPTION
        The Get-DattoBCDRDTCAsset cmdlet get details for
        direct-to-cloud assets

    .PARAMETER ClientID
        ClientID for the direct-to-cloud assets

        Can be found in the organizationId

    .PARAMETER AssetsOnly
        When defined with ClientID this filters the results returned
        from the /dtc/assets endpoint

        When not defined with ClientID assets are returned from the
        /dtc/{clientId}/assets endpoint

    .PARAMETER AssetUUID
        AssetUUID for the direct-to-cloud assets

    .PARAMETER Page
        Page number to return

    .PARAMETER PerPage
        Amount of items to return with each Page

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-DattoBCDRDTCAsset

        Gets details for direct-to-cloud assets

    .EXAMPLE
        Get-DattoBCDRDTCAsset -ClientID 123456 -AssetsOnly

        Filters results for direct-to-cloud assets for a specific client

    .EXAMPLE
        Get-DattoBCDRDTCAsset -ClientID 123456

        Gets details for direct-to-cloud assets for a specific client

    .EXAMPLE
        Get-DattoBCDRDTCAsset -ClientID 12345 -AssetUUID "123e4567-e89b-12d3-a456-426614174000"

        Gets details for a specific direct-to-cloud asset

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCAsset.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'IndexByAsset')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'IndexByUUID')]
        [ValidateNotNullOrEmpty()]
        [int]$ClientID,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'IndexByUUID')]
        [ValidateNotNullOrEmpty()]
        [string]$AssetUUID,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [switch]$AssetsOnly,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $false, ParameterSetName = 'IndexByAsset')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Page,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $false, ParameterSetName = 'IndexByAsset')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$PerPage,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $false, ParameterSetName = 'IndexByAsset')]
        [switch]$AllResults
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ($PSCmdlet.ParameterSetName) {
            'Index'         { $ResourceUri = "/dtc/assets" }
            'IndexByAsset'  { $ResourceUri = "/dtc/$ClientID/assets" }
            'IndexByUUID'   { $ResourceUri = "/dtc/$ClientID/assets/$AssetUUID" }
        }

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($ClientID)  { $UriParameters['clientId']    = $ClientID }
        }

        if ($PSCmdlet.ParameterSetName -ne 'IndexByUUID') {
            if ($Page)      { $UriParameters['_page']       = $Page }
            if ($PerPage)   { $UriParameters['_perPage']    = $PerPage }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri -UriFilter $UriParameters

    }

    end {}

}
