---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: BCDR
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAgent.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRAgent
---

# Get-DattoBCDRAgent

## SYNOPSIS
Get Datto BCDR agents from a given device

## SYNTAX

### Index (Default)
```powershell
Get-DattoBCDRAgent [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

### IndexByDevice
```powershell
Get-DattoBCDRAgent -SerialNumber <String> [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRAgent cmdlet get agents from a defined
BCDR device or for Endpoint Backup for PC agents (EB4PC)

To get agents from the Datto BCDR the SerialNumber of the BCDR
needs to be defined

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRAgent
```

Gets a list of Endpoint Backup for PC (EB4PC) clients and the agents
under those clients

### EXAMPLE 2
```powershell
Get-DattoBCDRAgent -SerialNumber "12345678"
```

Returns the agents from the defined Datto BCDR

### EXAMPLE 3
```powershell
Get-DattoBCDRAgent -SerialNumber "12345678" -Page 2 -PerPage 10
```

Returns the first 10 agents from Page 2 from the defined Datto BCDR

## PARAMETERS

### -SerialNumber
BCDR serial number to get agents from

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
N/A

## RELATED LINKS

[https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAgent.html](https://celerium.github.io/Celerium.DattoBCDR/site/BCDR/Get-DattoBCDRAgent.html)

