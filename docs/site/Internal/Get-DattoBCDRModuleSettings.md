---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRModuleSettings.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRModuleSettings
---

# Get-DattoBCDRModuleSettings

## SYNOPSIS
Gets the saved Datto configuration settings

## SYNTAX

### Index (Default)
```powershell
Get-DattoBCDRModuleSettings [-DattoBCDRConfPath <String>] [-DattoBCDRConfFile <String>] [<CommonParameters>]
```

### show
```powershell
Get-DattoBCDRModuleSettings [-OpenConfFile] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRModuleSettings cmdlet gets the saved Datto configuration settings
from the local system

By default the configuration file is stored in the following location:
    $env:USERPROFILE\Celerium.DattoBCDR

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRModuleSettings
```

Gets the contents of the configuration file that was created with the
Export-DattoBCDRModuleSettings

The default location of the Datto configuration file is:
    $env:USERPROFILE\Celerium.DattoBCDR\config.psd1

### EXAMPLE 2
```powershell
Get-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -DattoBCDRConfFile MyConfig.psd1 -OpenConfFile
```

Opens the configuration file from the defined location in the default editor

The location of the Datto configuration file in this example is:
    C:\Celerium.DattoBCDR\MyConfig.psd1

## PARAMETERS

### -DattoBCDRConfPath
Define the location to store the Datto configuration file

By default the configuration file is stored in the following location:
    $env:USERPROFILE\Celerium.DattoBCDR

```yaml
Type: String
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) )
Accept pipeline input: False
Accept wildcard characters: False
```

### -DattoBCDRConfFile
Define the name of the Datto configuration file

By default the configuration file is named:
    config.psd1

```yaml
Type: String
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: Config.psd1
Accept pipeline input: False
Accept wildcard characters: False
```

### -OpenConfFile
Opens the Datto configuration file

```yaml
Type: SwitchParameter
Parameter Sets: show
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
N\A

## RELATED LINKS

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRModuleSettings.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRModuleSettings.html)

