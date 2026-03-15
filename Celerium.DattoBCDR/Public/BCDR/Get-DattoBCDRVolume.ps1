function Get-DattoBCDRVolume {
<#
    .SYNOPSIS
        Gets an asset(s)(agent or share) for a specific
        volume on a device

    .DESCRIPTION
        The Get-DattoBCDRVolume cmdlet gets an asset(s)(agent or share)
        for a specific volume on a device

    .PARAMETER SerialNumber
        BCDR serial number to return data for

    .PARAMETER VolumeName
        Volume name (id) of the protected volume

        The content of the 'volume' field when calling
        /v1/bcdr/device/{SerialNumber}/asset

    .EXAMPLE
        Get-DattoBCDRVolume -SerialNumber "12345678" -VolumeName "0987654321"

        Gets the Datto BCDR with the defined SerialNumber and returns any
        agents or shares for the defined volume

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRVolume.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$SerialNumber,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Index')]
        [ValidateNotNullOrEmpty()]
        [string]$VolumeName
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/bcdr/device/$SerialNumber/asset/$VolumeName"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri

    }

    end {}

}
