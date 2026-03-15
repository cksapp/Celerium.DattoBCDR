---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRMetaData.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRMetaData
---

# Get-DattoBCDRMetaData

## SYNOPSIS
Gets various Api metadata values

## SYNTAX

```powershell
Get-DattoBCDRMetaData [[-BaseUri] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRMetaData cmdlet gets various Api metadata values from an
Invoke-WebRequest to assist in various troubleshooting scenarios such
as rate-limiting

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRMetaData
```

Gets various Api metadata values from an Invoke-WebRequest to assist
in various troubleshooting scenarios such as rate-limiting

The default full base uri test path is:
    https://api.datto.com/v1

### EXAMPLE 2
```powershell
Get-DattoBCDRMetaData -BaseUri http://myapi.gateway.celerium.org
```

Gets various Api metadata values from an Invoke-WebRequest to assist
in various troubleshooting scenarios such as rate-limiting

The full base uri test path in this example is:
    http://myapi.gateway.celerium.org/device

## PARAMETERS

### -BaseUri
Define the base URI for the Datto API connection using Datto's URI or a custom URI

The default base URI is https://api.datto.com/v1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $DattoBCDRModuleBaseUri
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRMetaData.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRMetaData.html)

