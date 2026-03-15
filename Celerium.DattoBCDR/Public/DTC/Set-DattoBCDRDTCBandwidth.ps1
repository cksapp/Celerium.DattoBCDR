function Set-DattoBCDRDTCBandwidth {
<#
    .SYNOPSIS
        Updates the bandwidth settings for a single direct-to-cloud agent

    .DESCRIPTION
        The Set-DattoBCDRDTCBandwidth cmdlet updates the bandwidth
        settings for a single direct-to-cloud agent

    .PARAMETER AgentUUID
        UUID

    .PARAMETER PauseWhileMetered
        Pause the agent while on a metered connection

    .PARAMETER MaximumBandwidthInBits
        Maximum bandwidth in bits for the agent

    .PARAMETER MaximumThrottledBandwidthInBits
        Maximum throttled bandwidth in bits for the agent

    .EXAMPLE
        Set-DattoBCDRDTCBandwidth -AgentUUID "123e4567-e89b-12d3-a456-426614174000" -maximumBandwidthInBits 1000000 -MaximumThrottledBandwidthInBits 500000

        Updates the bandwidth settings for the defined single direct-to-cloud agent

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Set-DattoBCDRDTCBandwidth.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Set', SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Set')]
        [ValidateNotNullOrEmpty()]
        [string]$AgentUUID,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Set')]
        [switch]$PauseWhileMetered,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Set')]
        [ValidateRange(1, [int64]::MaxValue)]
        [int64]$MaximumBandwidthInBits,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Set')]
        [ValidateRange(1, [int64]::MaxValue)]
        [int64]$MaximumThrottledBandwidthInBits
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/dtc/agent/$AgentUUID/bandwidth"

        $Data = @{
            pauseWhileMetered               = $PauseWhileMetered
            maximumBandwidthInBits          = $MaximumBandwidthInBits
            maximumThrottledBandwidthInBits = $MaximumThrottledBandwidthInBits
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $UriParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess("AgentUUID: [ $AgentUUID ]", "Update Bandwidth Settings")) {
            Invoke-DattoBCDRRequest -Method PUT -ResourceUri $ResourceUri -Data $Data
        }

    }

    end {}
}