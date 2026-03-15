---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: Internal
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Invoke-DattoBCDRRequest.html
parent: GET
schema: 2.0.0
title: Invoke-DattoBCDRRequest
---

# Invoke-DattoBCDRRequest

## SYNOPSIS
Makes an API request

## SYNTAX

```powershell
Invoke-DattoBCDRRequest [[-method] <String>] [-ResourceUri] <String> [[-UriFilter] <Hashtable>]
 [[-Data] <Object>] [-AllResults] [<CommonParameters>]
```

## DESCRIPTION
The Invoke-DattoBCDRRequest cmdlet invokes an API request to Datto API

This is an internal function that is used by all public functions

As of 2023-09 the Datto v1 API only supports GET and PUT requests

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-DattoBCDRRequest -Method GET -ResourceUri '/account' -UriFilter $UriFilter
```

Invoke a rest method against the defined resource using any of the provided parameters

Example:
    Name                           Value
    ----                           -----
    Method                         GET
    Uri                            https://api.datto.com/v1/account?accountId=12345&details=True
    Headers                        {Authorization = Bearer 123456789}
    Body

## PARAMETERS

### -method
Defines the type of API method to use

Allowed values:
'GET', 'PUT'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: GET
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceUri
Defines the resource uri (url) to use when creating the API call

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UriFilter
Used with the internal function \[ ConvertTo-DattoBCDRQueryString \] to combine
a functions parameters with the ResourceUri parameter

This allows for the full uri query to occur

The full resource path is made with the following data
$DattoBCDRModuleBaseUri + $ResourceUri + ConvertTo-DattoBCDRQueryString

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Data
Place holder parameter to use when other methods are supported
by the Datto v1 API

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
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

[https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Invoke-DattoBCDRRequest.html](https://celerium.github.io/Celerium.DattoBCDR/site/Internal/Invoke-DattoBCDRRequest.html)

