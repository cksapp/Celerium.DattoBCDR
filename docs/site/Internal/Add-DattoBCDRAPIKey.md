---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRAPIKey.html
parent: POST
schema: 2.0.0
title: Add-DattoBCDRAPIKey
---

# Add-DattoBCDRAPIKey

## SYNOPSIS
Sets the API public & secret keys used to authenticate API calls

## SYNTAX

```powershell
Add-DattoBCDRAPIKey [-ApiKeyPublic] <String> [[-ApiKeySecret] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Add-DattoBCDRAPIKey cmdlet sets the API public & secret keys
which are used to authenticate all API calls made to Datto

The Datto API keys are generated via the Datto portal
Admin \> Integrations

## EXAMPLES

### EXAMPLE 1
```powershell
Add-DattoBCDRAPIKey
```

Prompts to enter in the API public key and secret key

### EXAMPLE 2
```powershell
Add-DattoBCDRAPIKey -ApiKeyPublic '12345'
```

The Datto API will use the string entered into the \[ -ApiKeyPublic \] parameter as the
public key & will then prompt to enter in the secret key

### EXAMPLE 3
```
'12345' | Add-DattoBCDRAPIKey
```

The Datto API will use the string entered as the secret key & will prompt to enter in the public key

## PARAMETERS

### -ApiKeyPublic
Defines your API public key

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiKeySecret
Defines your API secret key

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRAPIKey.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Add-DattoBCDRAPIKey.html)

