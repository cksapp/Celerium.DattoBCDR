---
external help file: Celerium.DattoBCDR-help.xml
grand_parent: DTC
Module Name: Celerium.DattoBCDR
online version: https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Set-DattoBCDRDTCBandwidth.html
parent: PUT
schema: 2.0.0
title: Set-DattoBCDRDTCBandwidth
---

# Set-DattoBCDRDTCBandwidth

## SYNOPSIS
Updates the bandwidth settings for a single direct-to-cloud agent

## SYNTAX

```powershell
Set-DattoBCDRDTCBandwidth -AgentUUID <String> [-PauseWhileMetered] -MaximumBandwidthInBits <Int64>
 -MaximumThrottledBandwidthInBits <Int64> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Set-DattoBCDRDTCBandwidth cmdlet updates the bandwidth
settings for a single direct-to-cloud agent

## EXAMPLES

### EXAMPLE 1
```powershell
Set-DattoBCDRDTCBandwidth -AgentUUID "123e4567-e89b-12d3-a456-426614174000" -maximumBandwidthInBits 1000000 -MaximumThrottledBandwidthInBits 500000
```

Updates the bandwidth settings for the defined single direct-to-cloud agent

## PARAMETERS

### -AgentUUID
UUID

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -PauseWhileMetered
Pause the agent while on a metered connection

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -MaximumBandwidthInBits
Maximum bandwidth in bits for the agent

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -MaximumThrottledBandwidthInBits
Maximum throttled bandwidth in bits for the agent

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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

[https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Set-DattoBCDRDTCBandwidth.html](https://celerium.github.io/Celerium.DattoBCDR/site/DTC/Set-DattoBCDRDTCBandwidth.html)

