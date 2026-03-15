---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: BCDR
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRDevice.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRDevice
---

# Get-DattoBCDRDevice

## SYNOPSIS
Gets Datto BCDR devices from the the Datto API

## SYNTAX

### Index (Default)
```powershell
Get-DattoBCDRDevice [-ShowHiddenDevices <String>] [-ShowChildResellerDevices <String>] [-Page <Int32>]
 [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

### IndexByDevice
```powershell
Get-DattoBCDRDevice -SerialNumber <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRDevice cmdlet gets can get a one or more
Datto BCDR devices

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRDevice
```

Gets BCDR devices with any hidden or child reseller devices

### EXAMPLE 2
```powershell
Get-DattoBCDRDevice -ShowHiddenDevices 0 -ShowChildResellerDevices 0
```

Gets BCDR devices without any hidden or child reseller devices

### EXAMPLE 3
```powershell
Get-DattoBCDRDevice -Page 2 -PageSize 10
```

Gets the first 10 Datto BCDR devices from the second Page
Hidden and child reseller devices will be included

## PARAMETERS

### -SerialNumber
BCDR serial number to return data for

The parameter is mandatory if you want to get a specific device

```yaml
Type: String
Parameter Sets: IndexByDevice
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ShowHiddenDevices
Whether hidden devices should be included in your results

Acceptable values are:
    '0', '1'

By default '1' is returned by the API which shows hidden devices

```yaml
Type: String
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowChildResellerDevices
Whether child reseller devices should be included in your results

Acceptable values are:
    '0', '1'

By default '1' is returned by the API which shows child reseller devices

```yaml
Type: String
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
Page number to return

```yaml
Type: Int32
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PerPage
Amount of items to return with each Page

```yaml
Type: Int32
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllResults
Returns all items from an endpoint

This can be used in unison with -PerPage to limit the number of
sequential requests to the API

```yaml
Type: SwitchParameter
Parameter Sets: Index
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
N/A

## RELATED LINKS

[https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRDevice.html](https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRDevice.html)

