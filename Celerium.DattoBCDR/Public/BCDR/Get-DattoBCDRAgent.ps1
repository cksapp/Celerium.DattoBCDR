function Get-DattoBCDRAgent {
<#
    .SYNOPSIS
        Get Datto BCDR agents from a given device

    .DESCRIPTION
        The Get-DattoBCDRAgent cmdlet get agents from a defined
        BCDR device or for Endpoint Backup for PC agents (EB4PC)

        To get agents from the Datto BCDR the SerialNumber of the BCDR
        needs to be defined

    .PARAMETER SerialNumber
        BCDR serial number to get agents from

    .PARAMETER Page
        Page number to return

    .PARAMETER PerPage
        Amount of items to return with each Page

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-DattoBCDRAgent

        Gets a list of Endpoint Backup for PC (EB4PC) clients and the agents
        under those clients

    .EXAMPLE
        Get-DattoBCDRAgent -SerialNumber "12345678"

        Returns the agents from the defined Datto BCDR

    .EXAMPLE
        Get-DattoBCDRAgent -SerialNumber "12345678" -Page 2 -PerPage 10

        Returns the first 10 agents from Page 2 from the defined Datto BCDR

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAgent.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'IndexByDevice')]
        [ValidateNotNullOrEmpty()]
        [string]$SerialNumber,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $false, ParameterSetName = 'IndexByDevice')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Page,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [Parameter(Mandatory = $false, ParameterSetName = 'IndexByDevice')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$PerPage,

        [Parameter( Mandatory = $false)]
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
            $true   { $ResourceUri = "/bcdr/device/$SerialNumber/asset/agent" }
            $false  { $ResourceUri = "/bcdr/agent" }
        }

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
