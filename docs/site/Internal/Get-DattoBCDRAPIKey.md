---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRAPIKey.html
parent: GET
schema: 2.0.0
title: Get-DattoBCDRAPIKey
---

# Get-DattoBCDRAPIKey

## SYNOPSIS
Gets the Datto API public & secret key global variables

## SYNTAX

```powershell
Get-DattoBCDRAPIKey [-AsPlainText] [<CommonParameters>]
```

## DESCRIPTION
The Get-DattoBCDRAPIKey cmdlet gets the Datto API public & secret key
global variables and returns them as an object

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DattoBCDRAPIKey
```

Gets the Datto API public & secret key global variables and returns them
as an object with the secret key as a SecureString

### EXAMPLE 2
```powershell
Get-DattoBCDRAPIKey -AsPlainText
```

Gets the Datto API public & secret key global variables and returns them
as an object with the secret key as plain text

## PARAMETERS

### -AsPlainText
Decrypt and return the API key in plain text

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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRAPIKey.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Get-DattoBCDRAPIKey.html)

