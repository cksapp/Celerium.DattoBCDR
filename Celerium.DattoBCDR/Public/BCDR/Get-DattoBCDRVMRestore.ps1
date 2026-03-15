function Get-DattoBCDRVMRestore {
<#
    .SYNOPSIS
        Gets Datto BCDR VM restores by serial number

    .DESCRIPTION
        The Get-DattoBCDRVMRestore cmdlet gets device VM restores
        by serial number

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
        Get-DattoBCDRVMRestore -SerialNumber 12345

        Gest Datto VM restores from the defined device

    .EXAMPLE
        Get-DattoBCDRVMRestore -SerialNumber "12345678" -Page 2 -PerPage 10

        Gets the Datto BCDR VM restores with the defined SerialNumber
        with the first 10 restores from the 2nd Page of results

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRVMRestore.html
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

        $ResourceUri = "/bcdr/device/$SerialNumber/vm-restores"

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
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
