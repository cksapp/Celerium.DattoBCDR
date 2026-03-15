function Get-DattoBCDRDTCRMMTemplate {
<#
    .SYNOPSIS
        Get RMM templates

    .DESCRIPTION
        The Get-DattoBCDRDTCRMMTemplate cmdlet gets RMM templates
        for direct-to-cloud assets

    .PARAMETER ClientID
        ClientID for the direct-to-cloud assets

        Can be found in the organizationId

    .EXAMPLE
        Get-DattoBCDRDTCRMMTemplate

        Gets RMM templates for all direct-to-cloud assets

    .EXAMPLE
        Get-DattoBCDRDTCRMMTemplate -ClientID 123456

        Gets RMM templates for the defined direct-to-cloud assets

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCRMMTemplate.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [int]$ClientID
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/dtc/rmm-templates"

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($ClientID)  { $UriParameters['clientId']    = $ClientID }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri -UriFilter $UriParameters

    }

    end {}

}
