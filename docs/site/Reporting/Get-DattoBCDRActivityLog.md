---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Reporting
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Reporting/Get-DattoBCDRActivityLog.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRActivityLog
---

# Get-DattoBCDRActivityLog

## SYNOPSIS
Gets a filtered list of activity logs ordered by date

## SYNTAX

```powershell
Get-DattoBCDRActivityLog [-ClientName <String>] [-Since <Int32>] [-SinceUnits <String>] [-Target <String[]>]
 [-TargetType <String>] [-User <String>] [-Page <Int32>] [-PerPage <Int32>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRActivityLog cmdlet gets a filtered
list of activity logs ordered by date

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRActivityLog
```

Gets the Datto BCDR platform activity logs from the past day

### EXAMPLE 2
```powershell
Get-DattoBCDRActivityLog -Since 7 -SinceUnits days
```

Gets the Datto BCDR platform activity logs from the past 7 day

### EXAMPLE 3
```powershell
Get-DattoBCDRActivityLog -User bob -Since 7 -SinceUnits days
```

Gets the Datto BCDR platform activity logs for the user
named bob from the past 7 day

### EXAMPLE 4
```powershell
Get-DattoBCDRActivityLog -Since 30 -SinceUnits days -Target 'bcdr-device:D0123456789','bcdr-device:D9876543210'
```

Gets the Datto BCDR platform activity logs from the defined
targets for the past 30 day

### EXAMPLE 5
```powershell
Get-DattoBCDRActivityLog -Since 30 -SinceUnits days -Page 2 -PageSize 10
```

Gets the Datto BCDR platform activity logs from the past 30 day

Returns the second Page of 10 items

## PARAMETERS

### -ClientName
Defines a client name with which to do a partial/prefix match

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Since
Defines the number of days (unless overridden with sinceUnits),
up until now, for which to produce logs

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

### -SinceUnits
Defines the units to use for the since filter

Available values : days, hours, minutes

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Target
Defines a comma-separated array of targetType:targetId tuples

Example: bcdr-device:DC1234DC1234

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetType
Defines the type of target for which to find activity logs

Example: bcdr-device

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
Defines a username with which to do a partial/prefix match

```yaml
Type: String
Parameter Sets: (All)
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Reporting/Get-DattoBCDRActivityLog.html](https://celerium.github.io/Celerium.DattoBCDR/site/Reporting/Get-DattoBCDRActivityLog.html)

