Set-ExecutionPolicy Bypass -Force

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y git

mkdir C:\Goodline

cd c:\Goodline


C:\"Program Files"\Git\bin\git.exe clone https://github.com/jgiraudi/factor_bi.git .


xcopy.exe C:\Goodline\customdata.json C:\bipost_havanna /Y

xcopy.exe C:\goodline\customschema.json C:\bipost_havanna /Y

$Action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-NonInteractive -NoLogo -NoProfile -File "C:\Goodline\sync.ps1"'

$Trigger = New-ScheduledTaskTrigger -Daily -At 10am

$Settings = New-ScheduledTaskSettingsSet

$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

Register-ScheduledTask -TaskName 'cust_data' -InputObject $Task 
