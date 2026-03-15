---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: BCDR
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAsset.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRAsset
---

# Get-DattoBCDRAsset

## SYNOPSIS
Get Datto BCDR assets (agents and shares) for a given device

## SYNTAX

```powershell
Get-DattoBCDRAsset -SerialNumber <String> [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRAsset cmdlet gets Datto BCDR assets
(agents and shares) for a given device

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRAsset -SerialNumber "12345678"
```

Gets the Datto BCDR with the defined SerialNumber and
returns any agents or shares

### EXAMPLE 2
```powershell
Get-DattoBCDRAsset -SerialNumber "12345678" -Page 2 -PageSize 10
```

Gets the Datto BCDR with the defined SerialNumber and returns
the first 10 agents or shares from the 2nd Page of results

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

### -Page
Page number to return

```yaml
Type: Int32
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
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

[https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAsset.html](https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAsset.html)

