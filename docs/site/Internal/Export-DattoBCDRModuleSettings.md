---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Export-DattoBCDRModuleSettings.html
parent: GET
schema: 2.0.0
title: Export-DattoBCDRModuleSettings
---

# Export-DattoBCDRModuleSettings

## SYNOPSIS
Exports the Datto BaseURI, API, & JSON configuration information to file

## SYNTAX

```powershell
Export-DattoBCDRModuleSettings [-DattoBCDRConfPath <String>] [-DattoBCDRConfFile <String>] [<CommonParameters>]
```

## DESCRIPTION
The Export-DattoBCDRModuleSettings cmdlet exports the Datto BaseURI, API, & JSON configuration information to file

Making use of PowerShell's System.Security.SecureString type, exporting module settings encrypts your API key in a format
that can only be unencrypted with the your Windows account as this encryption is tied to your user principal
This means that you cannot copy your configuration file to another computer or user account and expect it to work

## EXAMPLES

### EXAMPLE 1
```powershell
Export-DattoBCDRModuleSettings
```

Validates that the BaseURI, API, and JSON depth are set then exports their values
to the current user's Datto configuration file located at:
    $env:USERPROFILE\Celerium.DattoBCDR\config.psd1

### EXAMPLE 2
```powershell
Export-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -DattoBCDRConfFile MyConfig.psd1
```

Validates that the BaseURI, API, and JSON depth are set then exports their values
to the current user's Datto configuration file located at:
    C:\Celerium.DattoBCDR\MyConfig.psd1

## PARAMETERS

### -DattoBCDRConfPath
Define the location to store the Datto configuration file

By default the configuration file is stored in the following location:
    $env:USERPROFILE\Celerium.DattoBCDR

```yaml
Type: String
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Config.psd1
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Export-DattoBCDRModuleSettings.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Export-DattoBCDRModuleSettings.html)

