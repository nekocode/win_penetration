powershell .\tools\_encode_bypass_uac.ps1
powershell .\tools\_encode_payload.ps1

python .\tools\packer.py

del _payload.txt
del _bypass_uac.txt