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
$Form.ClientSize                 = New-Object System.Drawing.Point(1000,500)
$Form.text                       = "Goodline - Instalador de Utilidades"
$Form.TopMost                    = $false

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.height                   = 120
$Panel2.width                    = 415
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
$Label1.location                 = New-Object System.Drawing.Point(19,80)
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
$p_cocina.height                 = 40
$p_cocina.location               = New-Object System.Drawing.Point(12,20)
$p_cocina.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Ins_printers                    = New-Object system.Windows.Forms.Button
$Ins_printers.text               = "Impresoras instaladas"
$Ins_printers.width              = 126
$Ins_printers.height             = 40
$Ins_printers.location           = New-Object System.Drawing.Point(170,20)
$Ins_printers.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 600
$Panel1.width                    = 600
$Panel1.location                 = New-Object System.Drawing.Point(229,120)

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
$GoogleChrome.width              = 125
$GoogleChrome.height             = 30
$GoogleChrome.location           = New-Object System.Drawing.Point(281,70)
$GoogleChrome.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(12,70) 
$outputBox.Size = New-Object System.Drawing.Size(500,350) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical"

$Form.Controls.Add($outputBox)
$Form.controls.AddRange(@($Panel2,$PictureBox1,$Label1,$Panel1,$TextBox1,$Label2,$TextBox2,$Label3))
$Panel2.controls.AddRange(@($Chocolatey,$Teamviewer,$classicshell,$GoogleChrome))
$Panel1.controls.AddRange(@($p_cocina,$Ins_printers,$outputBox))

$Chocolatey.Add_Click({ Add-OutputBoxLine -Message "Installing Chocolatey" 	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 	choco install chocolatey-core.extension -y 	$wshell.Popup("Operation Completed",0,"Done",0x0) })
$GoogleChrome.Add_Click({
    Add-OutputBoxLine -Message "Installing Google Chrome"
    choco install googlechrome -y
   Add-OutputBoxLine -Message "Done."
})
$Teamviewer.Add_Click({ 
    Add-OutputBoxLine -Message "Installing Teamviewer"
    choco install teamviewer -y
    Add-OutputBoxLine -Message "Done."
})
$classicshell.Add_Click({
    Add-OutputBoxLine -Message "Installing Classic Shell (Classic Windows Shell)"
    choco install classic-shell -y
    Add-OutputBoxLine -Message "Done."
})
$p_cocina.Add_Click({
Add-OutputBoxLine -Message "Instalando Impresoras"
Set-ExecutionPolicy Bypass -Scope Process -Force
Add-PrinterDriver -Name "Generic / Text Only"
Add-OutputBoxLine -Message "Impresora Cocina - 117"
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
Add-OutputBoxLine -Message "Impresora Barra - 116"
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
Add-OutputBoxLine -Message "Impresora Control - 115"
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
$Ins_printers.Add_Click({   
      $OutputBox.Text = Get-Printer | Format-table
})

Function Add-OutputBoxLine {
    Param ($Message)
    $OutputBox.AppendText("`r`n$Message")
    $OutputBox.Refresh()
    $OutputBox.ScrollToCaret()
}


#Write your logic code here

[void]$Form.ShowDialog()
