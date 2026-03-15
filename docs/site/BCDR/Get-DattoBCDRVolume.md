---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: BCDR
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRVolume.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRVolume
---

# Get-DattoBCDRVolume

## SYNOPSIS
Gets an asset(s)(agent or share) for a specific
volume on a device

## SYNTAX

```powershell
Get-DattoBCDRVolume -SerialNumber <String> -VolumeName <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRVolume cmdlet gets an asset(s)(agent or share)
for a specific volume on a device

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRVolume -SerialNumber "12345678" -VolumeName "0987654321"
```

Gets the Datto BCDR with the defined SerialNumber and returns any
agents or shares for the defined volume

## PARAMETERS

### -SerialNumber
BCDR serial number to return data for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -VolumeName
Volume name (id) of the protected volume

The content of the 'volume' field when calling
/v1/bcdr/device/{SerialNumber}/asset

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
N\A

## RELATED LINKS

[https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRVolume.html](https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRVolume.html)

