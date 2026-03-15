---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: BCDR
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAlert.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRAlert
---

# Get-DattoBCDRAlert

## SYNOPSIS
Gets Datto BCDR alerts for a given device

## SYNTAX

```powershell
Get-DattoBCDRAlert -SerialNumber <String> [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRAlert cmdlet gets Datto BCDR alerts for a given device

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRAlert -SerialNumber "12345678"
```

Gets the Datto BCDR with the defined SerialNumber and returns any alerts

### EXAMPLE 2
```powershell
Get-DattoBCDRAlert -SerialNumber "12345678" -Page 2 -PageSize 10
```

Gets the Datto BCDR with the defined SerialNumber
with the first 10 alerts from the 2nd Page of results

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

[https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAlert.html](https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAlert.html)

