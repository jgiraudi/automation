Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?
        Select "Yes" to Run as an Administrator
        Select "No" to not run this as an Administrator
        
        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco) 
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}


$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(629,355)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 169
$Panel2.width                    = 391
$Panel2.location                 = New-Object System.Drawing.Point(229,17)

$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 195
$PictureBox1.height              = 96
$PictureBox1.location            = New-Object System.Drawing.Point(-13,-9)
$PictureBox1.imageLocation       = "https://goodline.com.ar/wp-content/uploads/2021/02/image002.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Instalador de Utilidades"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(18,70)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',9)

$Chocolatey                      = New-Object system.Windows.Forms.Button
$Chocolatey.text                 = "Instalar Chocolatey"
$Chocolatey.width                = 125
$Chocolatey.height               = 33
$Chocolatey.location             = New-Object System.Drawing.Point(26,20)
$Chocolatey.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$p_cocina                        = New-Object system.Windows.Forms.Button
$p_cocina.text                   = "Instalar Impresoras"
$p_cocina.width                  = 126
$p_cocina.height                 = 30
$p_cocina.location               = New-Object System.Drawing.Point(12,20)
$p_cocina.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 150
$Panel1.width                    = 391
$Panel1.location                 = New-Object System.Drawing.Point(229,195)

$Teamviewer                      = New-Object system.Windows.Forms.Button
$Teamviewer.text                 = "Teamviewer"
$Teamviewer.width                = 92
$Teamviewer.height               = 30
$Teamviewer.location             = New-Object System.Drawing.Point(27,70)
$Teamviewer.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$classicshell                    = New-Object system.Windows.Forms.Button
$classicshell.text               = "Classic Shell"
$classicshell.width              = 124
$classicshell.height             = 30
$classicshell.location           = New-Object System.Drawing.Point(139,70)
$classicshell.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.text                   = "$(hostname)"
$TextBox1.width                  = 129
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(14,116)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Nombre del equipo"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(19,101)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.text                   = "$(Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $(Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex) | Select-Object -ExpandProperty IPAddress)"
$TextBox2.width                  = 136
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(12,161)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "IP LAN"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(13,148)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$GoogleChrome                    = New-Object system.Windows.Forms.Button
$GoogleChrome.text               = "Google Chrome"
$GoogleChrome.width              = 120
$GoogleChrome.height             = 30
$GoogleChrome.location           = New-Object System.Drawing.Point(281,70)
$GoogleChrome.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Form.controls.AddRange(@($Panel2,$PictureBox1,$Label1,$Panel1,$TextBox1,$Label2,$TextBox2,$Label3))
$Panel2.controls.AddRange(@($Chocolatey,$Teamviewer,$classicshell,$GoogleChrome))
$Panel1.controls.AddRange(@($p_cocina))

$Chocolatey.Add_Click({ Write-Host "Installing Chocolatey" 	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 	choco install chocolatey-core.extension -y 	$wshell.Popup("Operation Completed",0,"Done",0x0) })
$GoogleChrome.Add_Click({
    Write-Host "Installing Google Chrome"
    choco install googlechrome -y
	$wshell.Popup("Operacion Completada",0,"Done",0x0)
})
$Teamviewer.Add_Click({ 
    Write-Host "Installing Teamviewer"
    choco install teamviewer -y
	$wshell.Popup("Operation Completed",0,"Done",0x0)
})
$classicshell.Add_Click({
    Write-Host "Installing Classic Shell (Classic Windows Shell)"
    choco install classic-shell -y
	$wshell.Popup("Operation Completed",0,"Done",0x0)
})
$p_cocina.Add_Click({
Write-Host "Instalando Impresoras"
Set-ExecutionPolicy Bypass -Scope Process -Force
Add-PrinterDriver -Name "Generic / Text Only"
Write-Host "Impresora Cocina - 117"
$portName = "p_cocina"
$printDriverName = "Generic / Text Only"
$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $portExists) {
  Add-PrinterPort -name $portName -PrinterHostAddress "192.168.10.117"
}
$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue
if ($printDriverExists) {
    Add-Printer -Name "cocina" -PortName $portName -DriverName $printDriverName
}else{
    Write-Warning "Driver de la impresora no instalado"
}
Write-Host "Impresora Barra - 116"
$portName = "p_barra"
$printDriverName = "Generic / Text Only"
$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $portExists) {
  Add-PrinterPort -name $portName -PrinterHostAddress "192.168.10.116"
}
$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue
if ($printDriverExists) {
    Add-Printer -Name "barra" -PortName $portName -DriverName $printDriverName
}else{
    Write-Warning "Driver de la impresora no instalado"
}
Write-Host "Impresora Control - 115"
$portName = "p_control"
$printDriverName = "Generic / Text Only"
$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $portExists) {
  Add-PrinterPort -name $portName -PrinterHostAddress "192.168.10.115"
}
$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue
if ($printDriverExists) {
    Add-Printer -Name "control" -PortName $portName -DriverName $printDriverName
}else{
    Write-Warning "Driver de la impresora no instalado"
}
$wshell.Popup("Operacion Completada",0,"Done",0x0)
})



#Write your logic code here

[void]$Form.ShowDialog()
