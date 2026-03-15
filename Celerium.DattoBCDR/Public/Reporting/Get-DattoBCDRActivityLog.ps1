function Get-DattoBCDRActivityLog {
<#
    .SYNOPSIS
        Gets a filtered list of activity logs ordered by date

    .DESCRIPTION
        The Get-DattoBCDRActivityLog cmdlet gets a filtered
        list of activity logs ordered by date

    .PARAMETER ClientName
        Defines a client name with which to do a partial/prefix match

    .PARAMETER Since
        Defines the number of days (unless overridden with sinceUnits),
        up until now, for which to produce logs

    .PARAMETER SinceUnits
        Defines the units to use for the since filter

        Available values : days, hours, minutes

    .PARAMETER Target
        Defines a comma-separated array of targetType:targetId tuples

        Example: bcdr-device:DC1234DC1234

    .PARAMETER TargetType
        Defines the type of target for which to find activity logs

        Example: bcdr-device

    .PARAMETER User
        Defines a username with which to do a partial/prefix match

    .PARAMETER Page
        Page number to return

    .PARAMETER PerPage
        Amount of items to return with each Page

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PerPage to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-DattoBCDRActivityLog

        Gets the Datto BCDR platform activity logs from the past day

    .EXAMPLE
        Get-DattoBCDRActivityLog -Since 7 -SinceUnits days

        Gets the Datto BCDR platform activity logs from the past 7 day

    .EXAMPLE
        Get-DattoBCDRActivityLog -User bob -Since 7 -SinceUnits days

        Gets the Datto BCDR platform activity logs for the user
        named bob from the past 7 day

    .EXAMPLE
        Get-DattoBCDRActivityLog -Since 30 -SinceUnits days -Target 'bcdr-device:D0123456789','bcdr-device:D9876543210'

        Gets the Datto BCDR platform activity logs from the defined
        targets for the past 30 day

    .EXAMPLE
        Get-DattoBCDRActivityLog -Since 30 -SinceUnits days -Page 2 -PageSize 10

        Gets the Datto BCDR platform activity logs from the past 30 day

        Returns the second Page of 10 items

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Reporting/Get-DattoBCDRActivityLog.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$ClientName,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Since,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [validateSet('days', 'hours', 'minutes')]
        [string]$SinceUnits,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [string[]]$Target,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$TargetType,

        [Parameter(Mandatory = $false, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$User,

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

        $ResourceUri = "/report/activity-log"

        $UriParameters = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($ClientName)    { $UriParameters['clientName']  = $ClientName }
            if ($Page)          { $UriParameters['_page']       = $Page }
            if ($PerPage)       { $UriParameters['_perPage']    = $PerPage }
            if ($Since)         { $UriParameters['since']       = $Since }
            if ($SinceUnits)    { $UriParameters['sinceUnits']  = $SinceUnits }
            if ($Target)        { $UriParameters['target']      = $Target }
            if ($TargetType)    { $UriParameters['targetType']  = $TargetType }
            if ($User)          { $UriParameters['user']        = $User }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri -UriFilter $UriParameters -AllResults:$AllResults

    }

    end {}

}
