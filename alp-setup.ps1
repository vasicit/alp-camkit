# Disable firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Write-Host "Firewall Disabled"

# Disable antivirus real-time scanning
Set-MpPreference -DisableRealtimeMonitoring $true
Write-Host "Real-time Scanning Windows Defender Disabled"

# Disable Windows updates
sc.exe stop wuauserv
sc.exe config wuauserv start=disabled
Write-Host "Windows Updates Disabled"

# Disable Cortana
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"     
    IF(!(Test-Path -Path $path)) {  
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Windows Search" 
    }  
    Set-ItemProperty -Path $path -Name "AllowCortana" -Value 1  
    #Restart Explorer to change it immediately     
    Stop-Process -name explorer
Write-Host "Cortana Disabled"
