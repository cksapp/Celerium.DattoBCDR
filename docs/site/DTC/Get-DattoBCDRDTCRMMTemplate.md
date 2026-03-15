---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: DTC
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCRMMTemplate.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRDTCRMMTemplate
---

# Get-DattoBCDRDTCRMMTemplate

## SYNOPSIS
Get RMM templates

## SYNTAX

```powershell
Get-DattoBCDRDTCRMMTemplate [-ClientID <Int32>] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRDTCRMMTemplate cmdlet gets RMM templates
for direct-to-cloud assets

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRDTCRMMTemplate
```

Gets RMM templates for all direct-to-cloud assets

### EXAMPLE 2
```powershell
Get-DattoBCDRDTCRMMTemplate -ClientID 123456
```

Gets RMM templates for the defined direct-to-cloud assets

## PARAMETERS

### -ClientID
ClientID for the direct-to-cloud assets

Can be found in the organizationId

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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

[https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCRMMTemplate.html](https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Get-DattoBCDRDTCRMMTemplate.html)

