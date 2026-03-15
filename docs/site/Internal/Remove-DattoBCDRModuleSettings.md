---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRModuleSettings.html
parent: DELETE
schema: 2.0.0
title: Remove-DattoBCDRModuleSettings
---

# Remove-DattoBCDRModuleSettings

## SYNOPSIS
Removes the stored Datto configuration folder

## SYNTAX

### Destroy (Default)
```powershell
Remove-DattoBCDRModuleSettings [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Set
```powershell
Remove-DattoBCDRModuleSettings [-DattoBCDRConfPath <String>] [-AndVariables] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-DattoBCDRModuleSettings cmdlet removes the Datto folder and its files
This cmdlet also has the option to remove sensitive Datto variables as well

By default configuration files are stored in the following location and will be removed:
    $env:USERPROFILE\Celerium.DattoBCDR

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-DattoBCDRModuleSettings
```

Checks to see if the default configuration folder exists and removes it if it does

The default location of the Datto configuration folder is:
    $env:USERPROFILE\Celerium.DattoBCDR

### EXAMPLE 2
```powershell
Remove-DattoBCDRModuleSettings -DattoBCDRConfPath C:\Celerium.DattoBCDR -AndVariables
```

Checks to see if the defined configuration folder exists and removes it if it does
If sensitive Datto variables exist then they are removed as well

The location of the Datto configuration folder in this example is:
    C:\Celerium.DattoBCDR

## PARAMETERS

### -DattoBCDRConfPath
Define the location of the Datto configuration folder

By default the configuration folder is located at:
    $env:USERPROFILE\Celerium.DattoBCDR

```yaml
Type: String
Parameter Sets: Set
Aliases:

Required: False
Position: Named
Default value: $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop'){"Celerium.DattoBCDR"}else{".Celerium.DattoBCDR"}) )
Accept pipeline input: False
Accept wildcard characters: False
```

### -AndVariables
Define if sensitive Datto variables should be removed as well

By default the variables are not removed

```yaml
Type: SwitchParameter
Parameter Sets: Set
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRModuleSettings.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Remove-DattoBCDRModuleSettings.html)

