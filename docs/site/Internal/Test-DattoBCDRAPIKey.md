---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Test-DattoBCDRAPIKey.html
parent: GET
schema: 2.0.0
title: Test-DattoBCDRAPIKey
---

# Test-DattoBCDRAPIKey

## SYNOPSIS
Test the Datto API public & secret keys

## SYNTAX

```powershell
Test-DattoBCDRAPIKey [[-BaseUri] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Test-DattoBCDRAPIKey cmdlet tests the base URI & API public & secret keys that were defined in the
Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

## EXAMPLES

### EXAMPLE 1
```powershell
Test-DattoBCDRBaseURI
```

Tests the base URI & API access token that was defined in the
Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

The default full base uri test path is:
    https://api.datto.com/v1/bcdr/device

### EXAMPLE 2
```powershell
Test-DattoBCDRBaseURI -BaseUri http://myapi.gateway.celerium.org
```

Tests the base URI & API access token that was defined in the
Add-DattoBCDRBaseURI & Add-DattoBCDRAPIKey cmdlets

The full base uri test path in this example is:
    http://myapi.gateway.celerium.org/device

## PARAMETERS

### -BaseUri
Define the base URI for the Datto API connection using Datto's URI or a custom URI

The default base URI is https://api.datto.com/v1/bcdr

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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Test-DattoBCDRAPIKey.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Test-DattoBCDRAPIKey.html)

