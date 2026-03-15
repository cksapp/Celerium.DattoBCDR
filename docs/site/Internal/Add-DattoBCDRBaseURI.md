---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRBaseURI.html
parent: POST
schema: 2.0.0
title: Add-DattoBCDRBaseURI
---

# Add-DattoBCDRBaseURI

## SYNOPSIS
Sets the base URI for the Datto API connection

## SYNTAX

```powershell
Add-DattoBCDRBaseURI [[-BaseUri] <String>] [[-DataCenter] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Add-DattoBCDRBaseURI cmdlet sets the base URI which is
later used to construct the full URI for all API calls

## EXAMPLES

### EXAMPLE 1
```powershell
Add-DattoBCDRBaseURI
```

The default base URI will use https://api.datto.com/v1

### EXAMPLE 2
```powershell
Add-DattoBCDRBaseURI -DataCenter US
```

The default base URI will use https://api.datto.com/v1

### EXAMPLE 3
```powershell
Add-DattoBCDRBaseURI -BaseUri http://myapi.gateway.celerium.org
```

A custom API gateway of http://myapi.gateway.celerium.org will be used
for all API calls to Datto's API

## PARAMETERS

### -BaseUri
Define the base URI for the Datto API connection using Datto's URI or a custom URI

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Https://api.datto.com/v1
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DataCenter
Datto's URI connection point that can be one of the predefined data centers

The accepted values for this parameter are:
\[ US \]
    US = https://api.datto.com/v1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRBaseURI.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRBaseURI.html)

