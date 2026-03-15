function Get-DattoBCDRDTCStoragePool {
<#
    .SYNOPSIS
        Gets storage pool usage

    .DESCRIPTION
        The Get-DattoBCDRDTCStoragePool cmdlet gets storage pool usage
        for direct-to-cloud assets

    .EXAMPLE
        Get-DattoBCDRDTCStoragePool

        Gets storage pool usage for all direct-to-cloud assets

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCStoragePool.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    Param ()

    begin {

        $FunctionName       = $MyInvocation.InvocationName

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/dtc/storage-pool"

        Invoke-DattoBCDRRequest -Method GET -ResourceUri $ResourceUri

    }

    end {}

}
