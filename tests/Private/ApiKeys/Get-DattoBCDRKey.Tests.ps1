<#
    .SYNOPSIS
        Pester tests for the Celerium.DattoBCDR ApiKeys functions

    .DESCRIPTION
        Pester tests for the Celerium.DattoBCDR ApiKeys functions

    .PARAMETER moduleName
        The name of the local module to import

    .PARAMETER Version
        The version of the local module to import

    .PARAMETER buildTarget
        Which version of the module to run tests against

        Allowed values:
            'built', 'notBuilt'

    .EXAMPLE
        Invoke-Pester -Path .\Tests\Private\ApiKeys\Get-DattoBCDRAPIKey.Tests.ps1

        Runs a pester test and outputs simple results

    .EXAMPLE
        Invoke-Pester -Path .\Tests\Private\ApiKeys\Get-DattoBCDRAPIKey.Tests.ps1 -Output Detailed

        Runs a pester test and outputs detailed results

    .INPUTS
        N\A

    .OUTPUTS
        N\A

    .NOTES
        N\A

    .LINK
        https://celerium.org

#>

<############################################################################################
                                        Code
############################################################################################>
#Requires -Version 5.1
#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.5.0' }

#Region     [ Parameters ]

#Available in Discovery & Run
[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$moduleName = 'Celerium.DattoBCDR',

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$version,

    [Parameter(Mandatory=$true)]
    [ValidateSet('built','notBuilt')]
    [string]$buildTarget
)

#EndRegion  [ Parameters ]

#Region     [ Prerequisites ]

#Available inside It but NOT Describe or Context
    BeforeAll {

        if ($IsWindows -or $PSEdition -eq 'Desktop') {
            $rootPath = "$( $PSCommandPath.Substring(0, $PSCommandPath.IndexOf('\tests', [System.StringComparison]::OrdinalIgnoreCase)) )"
        }
        else{
            $rootPath = "$( $PSCommandPath.Substring(0, $PSCommandPath.IndexOf('/tests', [System.StringComparison]::OrdinalIgnoreCase)) )"
        }

        switch ($buildTarget){
            'built'     { $modulePath = Join-Path -Path $rootPath -ChildPath "\build\$moduleName\$version" }
            'notBuilt'  { $modulePath = Join-Path -Path $rootPath -ChildPath "$moduleName" }
        }

        if (Get-Module -Name $moduleName){
            Remove-Module -Name $moduleName -Force
        }

        $modulePsd1 = Join-Path -Path $modulePath -ChildPath "$moduleName.psd1"

        Import-Module -Name $modulePsd1 -ErrorAction Stop -ErrorVariable moduleError *> $null

        if ($moduleError){
            $moduleError
            exit 1
        }

    }

    AfterAll{

        Remove-DattoBCDRAPIKey -WarningAction SilentlyContinue

        if (Get-Module -Name $moduleName){
            Remove-Module -Name $moduleName -Force
        }

    }

#Available in Describe and Context but NOT It
#Can be used in [ It ] with [ -TestCases @{ VariableName = $VariableName } ]
    BeforeDiscovery{

        $pester_TestName = (Get-Item -Path $PSCommandPath).Name
        $commandName = $pester_TestName -replace '.Tests.ps1',''

    }

#EndRegion  [ Prerequisites ]

Describe "Testing [ $commandName ] function with [ $pester_TestName ]" -Tag @('ApiKeys') {

    Context "[ $commandName ] testing function" {

        It "When both parameters [ -ApiKeyPublic ] & [ -ApiKeySecret ] are called they should not return empty" {
            Add-DattoBCDRAPIKey -ApiKeyPublic '12345' -ApiKeySecret "Celerium.DattoBCDRAPIKey"
            Get-DattoBCDRAPIKey | Should -Not -BeNullOrEmpty
        }

        It "Pipeline  - [ -ApiKeyPublic ] should return a string" {
            "Celerium.DattoBCDRAPIKey" | Add-DattoBCDRAPIKey -ApiKeyPublic '12345'
            (Get-DattoBCDRAPIKey).PublicKey | Should -BeOfType String
        }

        It "Pipeline  - [ -ApiKeySecret ] should return a secure string" {
            "Celerium.DattoBCDRAPIKey" | Add-DattoBCDRAPIKey -ApiKeyPublic '12345'
            (Get-DattoBCDRAPIKey).SecretKey | Should -BeOfType SecureString
        }

        It "Parameter - [ -ApiKeyPublic ] should return a string" {
            Add-DattoBCDRAPIKey -ApiKeyPublic '12345' -ApiKeySecret "Celerium.DattoBCDRAPIKey"
            (Get-DattoBCDRAPIKey).PublicKey | Should -BeOfType String
        }

        It "Parameter - [ -ApiKeySecret ] should return a secure string" {
            Add-DattoBCDRAPIKey -ApiKeyPublic '12345' -ApiKeySecret "Celerium.DattoBCDRAPIKey"
            (Get-DattoBCDRAPIKey).SecretKey | Should -BeOfType SecureString
        }

        It "Using [ -AsPlainText ] should return [ -ApiKeySecret ] as a string" {
            Add-DattoBCDRAPIKey -ApiKeyPublic '12345' -ApiKeySecret "Celerium.DattoBCDRAPIKey"
            (Get-DattoBCDRAPIKey -AsPlainText).SecretKey | Should -BeOfType String
        }

        It "Using [ -AsPlainText ] should return the API keys entered" {
            Add-DattoBCDRAPIKey -ApiKeyPublic '12345' -ApiKeySecret "Celerium.DattoBCDRAPIKey"
            $Keys = Get-DattoBCDRAPIKey -AsPlainText
            $Keys.PublicKey | Should -Be '12345'
            $Keys.PublicKey | Should -Be "Celerium.DattoBCDRAPIKey"
        }

        It "If [ -ApiKeySecret ] is empty it should throw a warning" {
            Remove-DattoBCDRAPIKey
            Get-DattoBCDRAPIKey -WarningAction SilentlyContinue -WarningVariable apiKeyWarning
            [bool]$apiKeyWarning | Should -BeTrue
        }

    }

}