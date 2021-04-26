Write-Host "Instalando Impresoras"
Set-ExecutionPolicy Bypass -Scope Process -Force
Add-PrinterDriver -Name "Generic / Text Only"
Write-Host "Impresora Cocina"
Add-PrinterPort -Name "cocina" -PrinterHostAddress "192.168.10.117"
Add-Printer -Name "cocina" -DriverName "Generic / Text Only" -PortName "cocina"
Write-Host "Impresora Barra"
Add-PrinterPort -Name "barra" -PrinterHostAddress "192.168.10.116"
Add-Printer -Name "barra" -DriverName "Generic / Text Only" -PortName "barra"
Write-Host "Impresora Control"
Add-PrinterPort -Name "control" -PrinterHostAddress "192.168.10.115"
Add-Printer -Name "control" -DriverName "Generic / Text Only" -PortName "control"

