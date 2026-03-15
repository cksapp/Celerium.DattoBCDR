function Import-DattoBCDRModuleSettings {
<#
    .SYNOPSIS
        Imports the Datto BaseURI, API, & JSON configuration information to the current session

    .DESCRIPTION
        The Import-DattoBCDRModuleSettings cmdlet imports the Datto BaseURI, API, & JSON configuration
        information stored in the Datto configuration file to the users current session

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfPath
        Define the location to store the Datto configuration file

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\Celerium.DattoBCDR

    .PARAMETER DattoBCDRConfFile
        Define the name of the Datto configuration file

        By default the configuration file is named:
            config.psd1

    .EXAMPLE
        Import-DattoBCDRModuleSettings

        Validates that the configuration file created with the Export-DattoBCDRModuleSettings cmdlet exists
        then imports the stored data into the current users session

        The default location of the Datto configuration file is:
            $env:USERPROFILE\Celerium.DattoBCDR\config.psd1

    .EXAMPLE
        Import-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -DattoBCDRConfFile MyConfig.psd1

        Validates that the configuration file created with the Export-DattoBCDRModuleSettings cmdlet exists
        then imports the stored data into the current users session

        The location of the Datto configuration file in this example is:
            C:\Celerium.DattoBCDR\MyConfig.psd1

    .NOTES
        N\A

    .LINK
        https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Import-DattoBCDRModuleSettings.html
#>

    [CmdletBinding(DefaultParameterSetName = 'Set')]
    Param (
        [Parameter(ParameterSetName = 'Set')]
        [string]$DattoBCDRConfPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) ),

        [Parameter(ParameterSetName = 'Set')]
        [string]$DattoBCDRConfFile = 'config.psd1'
    )

    begin {
        $DattoBCDRConfig = Join-Path -Path $DattoBCDRConfPath -ChildPath $DattoBCDRConfFile

        $ModuleVersion = $MyInvocation.MyCommand.Version.ToString()

        switch ($PSVersionTable.PSEdition){
            'Core'      { $UserAgent = "Celerium.DattoBCDR/$ModuleVersion - PowerShell/$($PSVersionTable.PSVersion) ($($PSVersionTable.Platform) $($PSVersionTable.OS))" }
            'Desktop'   { $UserAgent = "Celerium.DattoBCDR/$ModuleVersion - WindowsPowerShell/$($PSVersionTable.PSVersion) ($($PSVersionTable.BuildVersion))" }
            default     { $UserAgent = "Celerium.DattoBCDR/$ModuleVersion - $([Microsoft.PowerShell.Commands.PSUserAgent].GetMembers('Static, NonPublic').Where{$_.Name -eq 'UserAgent'}.GetValue($null,$null))" }
        }

    }

    process {

        if ( Test-Path $DattoBCDRConfig ) {
            $TempConfig = Import-LocalizedData -BaseDirectory $DattoBCDRConfPath -FileName $DattoBCDRConfFile

            # Send to function to strip potentially superfluous slash (/)
            Add-DattoBCDRBaseURI $TempConfig.DattoBCDRModuleBaseUri

            $TempConfig.DattoBCDRModuleApiSecretKey = ConvertTo-SecureString $TempConfig.DattoBCDRModuleApiSecretKey

            Set-Variable -Name "DattoBCDRModuleApiKey"              -Value $TempConfig.DattoBCDRModuleApiKey        -Option ReadOnly -Scope Global -Force
            Set-Variable -Name "DattoBCDRModuleApiSecretKey"        -Value $TempConfig.DattoBCDRModuleApiSecretKey  -Option ReadOnly -Scope Global -Force
            Set-Variable -Name "DattoBCDRModuleUserAgent"           -Value $TempConfig.DattoBCDRModuleUserAgent      -Option ReadOnly -Scope Global -Force
            Set-Variable -Name "DattoBCDRModuleJSONConversionDepth" -Value $TempConfig.DattoBCDRModuleJSONConversionDepth -Option ReadOnly -Scope Global -Force

            Write-Verbose "Celerium.DattoBCDR Module configuration loaded successfully from [ $DattoBCDRConfig ]"

            # Clean things up
            Remove-Variable "TempConfig"
        }
        else {
            Write-Verbose "No configuration file found at [ $DattoBCDRConfig ] run Add-DattoBCDRAPIKey to get started."

            Add-DattoBCDRBaseURI

            Set-Variable -Name "DattoBCDRModuleUserAgent" -Value $UserAgent -Scope Global -Force
            Set-Variable -Name "DattoBCDRModuleBaseUri" -Value $(Get-DattoBCDRBaseURI)  -Option ReadOnly -Scope Global -Force
            Set-Variable -Name "DattoBCDRModuleJSONConversionDepth" -Value 100 -Scope Global -Force
        }

    }

    end {}

}