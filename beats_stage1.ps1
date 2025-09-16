Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Invoke-WebRequest -Uri 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.16.2-windows-x86_64.zip' -Outfile "C:\Windows\Temp\winlogbeat.zip"

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/jrabinovitz-ideal/Graylog/refs/heads/main/winlogbeat.yml' -Outfile "C:\Windows\Temp\"

Expand-Archive -LiteralPath 'c:\windows\temp\winlogbeat.zip' -DestinationPath C:\

#Invoke-Command -ScriptBlock {c:\windows\temp\CrowdStrike_Installer\FalconSensor_Windows.exe /install /quiet /norestart CID=$CS_CID}
