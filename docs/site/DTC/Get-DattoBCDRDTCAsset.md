---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: DTC
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCAsset.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRDTCAsset
---

# Get-DattoBCDRDTCAsset

## SYNOPSIS
Get details for direct-to-cloud assets

## SYNTAX

### Index (Default)
```powershell
Get-DattoBCDRDTCAsset [-ClientID <Int32>] [-AssetsOnly] [-Page <Int32>] [-PerPage <Int32>] [-AllResults]
 [<CommonParameters>]
```

### IndexByUUID
```powershell
Get-DattoBCDRDTCAsset -ClientID <Int32> -AssetUUID <String> [<CommonParameters>]
```

### IndexByAsset
```powershell
Get-DattoBCDRDTCAsset -ClientID <Int32> [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRDTCAsset cmdlet get details for
direct-to-cloud assets

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRDTCAsset
```

Gets details for direct-to-cloud assets

### EXAMPLE 2
```powershell
Get-DattoBCDRDTCAsset -ClientID 123456 -AssetsOnly
```

Filters results for direct-to-cloud assets for a specific client

### EXAMPLE 3
```powershell
Get-DattoBCDRDTCAsset -ClientID 123456
```

Gets details for direct-to-cloud assets for a specific client

### EXAMPLE 4
```powershell
Get-DattoBCDRDTCAsset -ClientID 12345 -AssetUUID "123e4567-e89b-12d3-a456-426614174000"
```

Gets details for a specific direct-to-cloud asset

## PARAMETERS

### -ClientID
ClientID for the direct-to-cloud assets

Can be found in the organizationId

```yaml
Type: Int32
Parameter Sets: Index
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: Int32
Parameter Sets: IndexByUUID, IndexByAsset
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AssetUUID
AssetUUID for the direct-to-cloud assets

```yaml
Type: String
Parameter Sets: IndexByUUID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AssetsOnly
When defined with ClientID this filters the results returned
from the /dtc/assets endpoint

When not defined with ClientID assets are returned from the
/dtc/{clientId}/assets endpoint

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

### -Page
Page number to return

```yaml
Type: Int32
Parameter Sets: Index, IndexByAsset
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
Parameter Sets: Index, IndexByAsset
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
Parameter Sets: Index, IndexByAsset
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

[https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCAsset.html](https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCAsset.html)

