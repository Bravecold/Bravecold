"Those who forget to automate are doomed to repeat their work."

Practiquemos contenido en https://learn.microsoft.com/en-us/training/paths/get-started-windows-powershell/
El repositorio de PowerShell en technet es https://social.technet.microsoft.com/Forums/en-us/home?forum=ITCG
El repositorio de PowerShell Documentation en https://learn.microsoft.com/en-us/powershell/
La comunidad de PowerShell es https://powershell.org/
Repositorio Azure PowerShell en https://github.com/Azure/azure-powershell-common
Los mismos scripts que estan en el laboratorio los consigues en https://github.com/kramit/10961
Jeff Hicks Repo https://github.com/jdhitsolutions
PowerSHell Gallery https://www.powershellgallery.com/packages
Como firmar scripts con certificados https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_signing?view=powershell-7.3
Como instalar un controlador de dominio WS2022 con PowerShell https://learn.microsoft.com/en-us/answers/questions/59818/how-to-install-secondary-domain-controller-as-serv
Como actualizar una template de VMWare usando powershell https://woshub.com/automate-update-windows-vmware-template/
Algunos otros websites de interes:
https://youtu.be/qKHBkSMGYKo

https://github.com/PowerShell/PowerShell

https://code.visualstudio.com/learn

https://ss64.com/ps/

https://youtu.be/TUNNmVeyjW0

https://learn.microsoft.com/en-us/sysinternals/

https://github.com/termux/termux-app

https://github.com/fleschutz/PowerShell

https://learn.microsoft.com/en-us/powershell/scripting/samples/sample-scripts-for-administration?view=powershell-7.3

https://adamtheautomator.com/powershell-script-examples/

https://devblogs.microsoft.com/scripting/tag/scripting-techniques/

https://devblogs.microsoft.com/scripting/how-to-use-trycatchfinally-for-non-terminating-errors/

https://devblogs.microsoft.com/scripting/weekend-scripter-powershell-module-manifeststhe-video/

https://devblogs.microsoft.com/scripting/launch-elevated-powershell-shell/

https://devblogs.microsoft.com/scripting/use-function-to-determine-elevation-of-powershell-console/

https://devblogs.microsoft.com/scripting/describe-your-powershell-variables/

https://devblogs.microsoft.com/scripting/powershell-workflows-the-basics/

https://learn.microsoft.com/en-us/powershell/scripting/learn/remoting/winrmsecurity?view=powershell-7.3

https://learn.microsoft.com/es-es/windows/win32/winrm/authentication-for-remote-connections?source=recommendations

https://www.mandiant.com/resources/reports/investigating-powershell-attacks

https://learn.microsoft.com/en-us/windows/wsl/install

https://community.spiceworks.com/topic/2107141-send-a-message-to-a-remote-pc-via-cmd-powershell

https://community.spiceworks.com/scripts/show/2538-send-a-message-to-all-computers-across-network

https://github.com/lazywinadmin/PowerShell/blob/a54cf0ecae25d5591ea62e4431a1cf924eed209e/README.md#L4

https://github.com/jdhitsolutions/PSReleaseTools

https://github.com/timothywarner/az104

https://github.com/timothywarner/bicep

https://github.com/timothywarner/PSRemoteOperations

https://github.com/timothywarner/PSTeachingTools

https://github.com/timothywarner/Random-PowerShell-Work

https://github.com/timothywarner/PS-AutoLab-Env

https://github.com/timothywarner/big-book-of-powershell-gotchas/blob/master/SUMMARY.md

https://github.com/timothywarner/PowerShell/tree/dev/MrToolkit

https://github.com/timothywarner/Pester

https://github.com/timothywarner/2014-06-Jeff-Hicks-DSC

https://github.com/vmware/PowerCLI-Example-Scripts/blob/master/Modules/VMware.Hv.Helper/docs/Get-HVEntitlement.md

https://github.com/vmware/PowerCLI-Example-Scripts/blob/master/Scripts/ReadVMSnapshotConfig.ps1

https://github.com/chrisdee/Scripts/tree/master

Desired State Configuration https://learn.microsoft.com/en-us/powershell/dsc/overview?view=dsc-2.0

Para ADMT?> https://www.microsoft.com/es-es/download/details.aspx?id=19188

#Este repositorio cuenta con las rutinas, scripts y demostraciones para DevOps, PowerShell y Python para automatizar #Esta recopilacion FCampo at hotmail.com -2019 su contenido es de acceso publico, y su contenido proviene de diversos foros, posts y blogs. #------------------------------------------------------- #En el principio de los 80's en D.O.S. o CMD podiamos usar unos pocos comandos para administrar servidores y garantizar la seguridad, aqui algunos ejemplos:

- Para ver cuantos usuarios estaban conectados
NET SESSION | FIND /C "\"

- Para ver Quien estaba conectado
NBTSTAT -a remotecomputer | FIND "<03>" | FIND /I /V "remotecomputer"

- Consultar el directorio activo
DSQUERY USER -name lastname | DSGET USER -samid -display

- resetear una contrasena
NET USER loginname newpassword /DOMAIN

- Validar un usuario activo o locked
NET USER loginname /DOMAIN | FIND /I "Account active"

- Ver una lista de dominios en la red
NET VIEW /DOMAIN

- Conocer todos los controladores de dominio de una red
NETDOM QUERY /D:"MyDomain" DC

- Listar todos los servidores del dominio
NETDOM QUERY /D:"MyDomain" SERVER

- Listar todos los Workstations del dominio
NETDOM QUERY /D:"MyDomain" WORKSTATION

- Listar el espacio disponible en disco de todos mis servidores
FOR /F %%A IN (servers.txt) DO ( WMIC /Node:%%A LogicalDisk Where DriveType="3" Get DeviceID,FileSystem,FreeSpace,Size /Format:csv | MORE /E +2 >> SRVSPACE.CSV )

- Extraer todos los drivers de una PC
DRIVERQUERY /V /FO CSV > %ComputerName%.csv

- Encontrar los usuarios administradores
NET LOCALGROUP Administrators

- Deshabilitar el Firewall de windows para dominio
NETSH Firewall Set OpMode Mode = DISABLE Profile = DOMAIN

- Deshabilitar el firewall de windows por completo
SC [ \Remote_computer ] Config SharedAccess start= disabled

- Consultar las actualizaciones instaladas
WMIC QFE List

#PowerShell es la plataforma ideal para orquestar, montar scripts, y realizar tareas, rutinas

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest

https://www.powershellgallery.com/packages

https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az

Connect-AzAccount

Get-AzLocation | select Location $location = "eastus"

$resourceGroup = "myResourceGroup" New-AzResourceGroup -Name $resourceGroup -Location $location

$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup -Name "mystorageaccount" -SkuName Standard_LRS -Location $location

$ctx = $storageAccount.Context

$containerName = "quickstartblobs" new-AzStoragecontainer -Name $containerName -Context $ctx -Permission blob

upload a file
set-AzStorageblobcontent -File "D:_TestImages\Image001.jpg" -Container $containerName -Blob "Image001.jpg" ` -Context $ctx

upload another file
set-AzStorageblobcontent -File "D:_TestImages\Image002.png" -Container $containerName -Blob "Image002.png" ` -Context $ctx

Get-AzStorageBlob -Container $ContainerName -Context $ctx | select Name

download first blob
Get-AzStorageblobcontent -Blob "Image001.jpg" -Container $containerName -Destination "D:_TestImages\Downloads" ` -Context $ctx

download another blob
Get-AzStorageblobcontent -Blob "Image002.png" -Container $containerName -Destination "D:_TestImages\Downloads" ` -Context $ctx

Test-netconnection cnn.com -port 80

#Entonces podemos hacer una funcion que capture el nombre del equipo, y los puertos que queremos escanear

function Test-Port {$computer=Read-Host "Computername | IP Address?" $port=Read-Host "Port Numbers? Separate them by comma" $port.split(',') | Foreach-Object -Process {If (($a=Test-NetConnection $computer -Port $_ -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true) {Write-Host $a.Computername $a.RemotePort -ForegroundColor Green -Separator " ==> "} else {Write-Host $a.Computername $a.RemotePort -Separator " ==> " -ForegroundColor Red}} }

#De esta manera podemos revisar todos los puertos necesarios para un directorio activo, que segun este articulo https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772723(v=ws.10) son 389, 636, 3268, 3269, 88, 53, 445, 135, 5722, 123, 464, 138, 9389, 67, 2535, 137, 139, y unos puertos dinamicos tambien

#Que tal si queremos escanear todo un rango de ip

—————————————————————————–
Script: PoshPortScanner.ps1
Author: ed wilson, msft
Date: 02/19/2014 15:17:33
Keywords: Security, Networking, Tcp/IP, Monitoring
comments: This script scans a range of IP addresses for web servers listening
to port 80. It is a useful audit tool, because there are lots of software and
devices that setup web servers for management, but that do not necessarily
inform about them.
—————————————————————————–
$port = 80

$net = “192.168.0”

$range = 1..254

foreach ($r in $range)

{

$ip = “{0}.{1}” -F $net,$r

if(Test-Connection -BufferSize 32 -Count 1 -Quiet -ComputerName $ip)

{

 $socket = new-object System.Net.Sockets.TcpClient($ip, $port)

 If($socket.Connected)

   {

    “$ip listening to port $port”

    $socket.Close() }

     }
}

#Ahora bien, si queremos hacer rutinas de replicacion

$PSVersionTable Get-WmiObject -Class Win32_OperatingSystem | Format-Table Caption, ServicePackMajorVersion -AutoSize (Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version -like '4.5*' $env:computername

New-PSDrive -Name F -PSProvider FileSystem -Root \Client01\Data -Persist

Get-Module

Get-Module -ListAvailable

Find-Module -Name MSOnline Find-Module -Name MSOnline | Install-Module -Force $O365Cred = Get-Credential Connect-MsolService -Credential $O365Cred Get-MsolAccountSku $LicenseSKU = Get-MsolAccountSku | Out-GridView -Title 'Select a license plan to assign to users' -OutputMode Single | Select-Object -ExpandProperty AccountSkuId

#-------------- $Users = Get-MsolUser -All -UnlicensedUsersOnly | Out-GridView -Title 'Select users to assign license plan to' -OutputMode Multiple #-------------- $Users | Set-MsolUser -UsageLocation US $Users | Set-MsolUserLicense -AddLicenses $LicenseSKU #-------------- $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell-liveid?DelegatedOrg=yourdomain.onmicrosoft.com -Credential $O365Cred -Authentication Basic -AllowRedirection Import-PSSession -Session $Session #-------------- (Get-Module ActiveDirectory).ExportedCommands

Get-Command -Module ActiveDirectory #Crear usuarios Estudiante de uno al diez 1..10 | Foreach-Object {New-ADUser -Name Student$_ -AccountPassword (ConvertTo-SecureString "Pa$$w000rd" -AsPlainText -Force) -UserPrincipalName Student$_@$env:userdnsdomain -ChangePasswordAtLogon 1 -Enabled 1 -Verbose}

#Replicacion AD function Replicate-AllDomainController { (Get-ADDomainController -Filter *).Name | Foreach-Object {repadmin /syncall $_(Get-ADDomain).DistinguishedName /APed | Out-Null}; Start-Sleep 10; Get-ADReplicationPartnerMetadata -Target "$env:userdnsdomain" -Scope Domain | Select-Object Server, LastReplicationSuccess }

Replicate-AllDomainController

cd $PSHome\Modules

cd $Env:ProgramFiles\WindowsPowerShell\Modules

cd $Home\Documents\WindowsPowerShell\Modules

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Demo Do-Speak
##Copy this module to C:\Program Files\Windows PowerShell\Modules\do-speak

Function Do-Speak {

[CmdletBinding()]
 
param
(
 
[Parameter(Position=0)]
 
$Computer
 
)
 
If (!$computer)
 
{
 
$Text=Read-Host 'Enter Text'
 
[Reflection.Assembly]::LoadWithPartialName('System.Speech') | Out-Null
$object = New-Object System.Speech.Synthesis.SpeechSynthesizer
$object.Speak($Text)
 
}
 
else {
 
$cred=Get-Credential
 
$PS=New-PSSession -ComputerName $Computer -Credential $cred
 
Invoke-Command -Session $PS {
$Text=Read-Host 'Enter Text'
 
[Reflection.Assembly]::LoadWithPartialName('System.Speech') | Out-Null
$object = New-Object System.Speech.Synthesis.SpeechSynthesizer
$object.Speak($Text)
}
 
}
 
}
#----------------------

Demo Test-Gateway
##Copy Module to c:\Program Files\WindowsPowerShell\Modules\Test-Gateway

function Test-Gateway { param($Computer = $null, $Count = "1") If ($Computer -eq $null) {Test-Connection -Destination (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -ExpandProperty Nexthop) -Count $Count} else {$Route=Invoke-Command -ComputerName $Computer {Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -ExpandProperty Nexthop}; Test-Connection -Source $Computer -Destination $Route -Count $Count} } #----------------- Get-Command Test-Gateway -ShowCommandInfo

##Retrieve a list of all software installed remotely

Get-WmiObject win32_product Get-CimInstance win32_product Get-CimInstance win32_product | Select-Object Name, PackageName, InstallDate | Out-GridView

(Get-ADComputer -Filter * -Searchbase "OU=Test,DC=sid-500,DC=com").Name | Out-File C:\Temp\Computer.txt | notepad C:\Temp\Computer.txt

Get-CimInstance -ComputerName (Get-Content C:\Temp\Computer.txt) -ClassName win32_product -ErrorAction SilentlyContinue| Select-Object PSComputerName, Name, PackageName, InstallDate | Out-GridView

#Install Windows Features and reboot

Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online #-------------------------- Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -NoRestart -OutVariable results if ($results.RestartNeeded -eq $true) { Restart-Computer -Force } #-------------------------- $ProgPref = $ProgressPreference $ProgressPreference = 'SilentlyContinue' $results = Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -NoRestart -WarningAction SilentlyContinue $ProgressPreference = $ProgPref if ($results.RestartNeeded -eq $true) { Restart-Computer -Force } #-------------------------- Get-Command -Noun WindowsCapability Get-WindowsCapability -Name RSAT* -Online Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State Update-Help

#Monitorear un IIS Web Sites & AppPools con PS Install-WindowsFeature -Name Web-WMI $Servers = 'Server01' Invoke-Command -ComputerName $Servers { Import-Module -Name WebAdministration $Websites = Get-Website | Where-Object serverAutoStart -eq $true foreach ($Website in $Websites) { switch ($Website) { {(Get-WebAppPoolState -Name $.applicationPool).Value -eq 'Stopped'} {Start-WebAppPool -Name $.applicationPool} {$_.State -eq 'Stopped'} {Start-Website -Name $Website.Name} } } }

Comandos Multiplataforma (ejecuta en Linux)
wget https://raw.githubusercontent.com/PowerShell/PowerShell/v6.0.0-alpha.10/tools/download.sh

sudo chmod +x download.sh sudo ./download.sh #---- Bash Script 1 param ( $user, $birthday, $age )

Write-Output “The Username is $user” Write-Output “Their Birthday is on $birthday” Write-Output “The age of the user is $age”

Exit 42

#------Bash script 2

$c=New-Object System.Management.Automation.PsCredential -ArgumentList ('me',(Convertto-Securestring -asPlainText -force 'badpass'))

$Date=Get-Date $Name='John Smith'

Return [pscustomobject]@{Credential=$c;Date=$Date;Name=$name}

#------Bash script 3

$c=New-Object System.Management.Automation.PsCredential -ArgumentList ('me',(Convertto-Securestring -asPlainText -force 'badpass'))

$Date=Get-Date $Name='John Smith'

$Password=$c.getnetworkcredential(). $ShortDate=Get-Date $Date -format ‘MM/dd/yyyy’ $LowerName=$Name.tolower()

Return [pscustomobject]@{Credential=$Password;Date=$ShortDate;Name=$Lowername}

#Comandos en Python powershell python -c "print('Hello Everybody this is PowerShell Polly…RAWK!')"

$ThisLittleObject= python -c "print('Hello Everybody this is PowerShell Polly…RAWK!')"

powershell -file fooscript.ps1

SomeThingISee=powershell -file fooscript.ps1

python -c "import os; os.system('powershell -file fooscript.ps1')"

Hello.py
This program says hello and asks for my name.
print('Hello world!') print('What is your name?') # ask for their name myName = input() print('It is good to meet you, ' + myName) print('The length of your name is:') print(len(myName)) print('What is your age?') # ask for their age myAge = input() print('You will be ' + str(int(myAge) + 1) + ' in a year.')

inventory.py
stuff = {'rope': 1, 'torch': 6, 'gold coin': 42, 'dagger': 1, 'arrow': 12}

def display_inventory(inventory): print("Inventory:") item_total = 0 for k, v in inventory.items(): print(str(v) + ' ' + k) item_total += v print("Total number of items: " + str(item_total))

display_inventory(stuff)

#-------------------------

swordFish.py
while True: print('Who are you?') name = input() if name != 'Joe': continue print('Hello, Joe. What is the password? (It is a fish.)') password = input() if password == 'swordfish': break print('Access granted.')

#------------------------------------------- #! python3

countdown.py - A simple countdown script.
import time, subprocess

timeLeft = 60 while timeLeft > 0: print(timeLeft, end='') time.sleep(1) timeLeft = timeLeft - 1

At the end of the countdown, play a sound file.
subprocess.Popen(['start','alarm.wav'], shell=True)

#------------------------------------- #! python3

stopwatch.py - A simple stopwatch program.
import time

Display the program's instructions.
print('Press enter to begin. Afterwards, press ENTER to "click" the stopwatch. Press Ctrl-C to quit.') input() # press Enter to begin print('Started.') startTime = time.time() # get the first lap's start time lastTime = startTime lapNum = 1

Start tracking the lap times.
try: while True: input() lapTime = round(time.time() - lastTime, 2) totalTime = round(time.time() - startTime, 2) print('Lap #%s: %s (%s)' % (lapNum, totalTime, lapTime), end='') lapNum += 1 lastTime = time.time() # reset the last lap time except KeyboardInterrupt: # Handle the Ctrl-C exception to keep its error message from displaying. print('\nDone.')

#Update Git repository

git status

git remote show git remote show origin

git diff https://github.com/Bravecold/skyshell.git

git checkout

git remote add upstream https://github.com/Bravecold/skyshell.git git fetch upstream

git merge upstream/master

#------Windows Updates

Get-CimInstance -Class win32_quickfixengineering | Where-Object { $_.InstalledOn -gt (Get-Date).AddMonths(-3) }

#------Exchange Install-Module Exchange_AddIn

#------SQL Import-Module SqlServer

#Azure Cli

az group create --name myResourceGroup --location eastus az vm create --resource-group myResourceGroup --name myVM --image ubuntults az vm create --resource-group myResourceGroup --name myVM --image win2016datacenter

az vm start --resource-group myResourceGroup --name myVM az vm stop --resource-group myResourceGroup --name myVM az vm deallocate --resource-group myResourceGroup --name myVM az vm restart --resource-group myResourceGroup --name myVM az vm redeploy --resource-group myResourceGroup --name myVM az vm delete --resource-group myResourceGroup --name myVM

az vm list az vm disk attach --resource-group myResourceGroup --vm-name myVM --disk myDataDisk --size-gb 128 --new az vm disk detach --resource-group myResourceGroup --vm-name myVM --disk myDataDisk az disk update --resource-group myResourceGroup --name myDataDisk --size-gb 256

az storage account create
--name mystorageaccount
--resource-group myResourceGroup
--location eastus
--sku Standard_LRS
--encryption blob

y algunos cmd-lets para completar...

Administracion de Active Directory.

Filtrar usuarios con password never expire Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $True}
Filtrar usuarios con mas de 90 dias de inactividad Get-ADuser -Filter {LastLogonTimeStamp -lt (get-date).adddays(-(90)) -and enabled -eq $true} -Properties LastLogonTimeStamp
Get-ADComputer -Filter * | Select-Object @{n='ComputerName';e={$PSItem.Name}} | Set-Service -Name WinRM -StartupType Auto

Get-ADComputer -Filter * | Select @{n='ComputerName';e={$PSItem.Name}} | Get-Service -Name *

Get-ADComputer -Filter * -Properties OperatingSystem | Sort -Property OperatingSystem | Select-Object -Property OperatingSystem,Name | fl -GroupBy OperatingSystem -Property Name

New-PSDrive -Name "Samsung" -PSProvider "FileSystem" -Root "\192.168.10.20\Samsung500"

Get-ChildItem -Path C:\temp -Recurse | ForEach GetFiles

Get-ChildItem -Path CERT: -Recurse | Where { $PSItem.HasPrivateKey -eq $False -and $PSItem.NotAfter -gt (Get-Date) -and $PSItem.NotBefore -lt (Get-Date) } | Select-Object -Property NotBefore,NotAfter, FriendlyName,Issuer | ft -wrap

Get-ChildItem -Path CERT: -Recurse | Where HasPrivateKey -eq $False | Select-Object -Property FriendlyName,Issuer | fl

Get-Hotfix | Select-Object -Property HotFixID,InstalledOn,InstalledBy

Get-Volume | Where-Object -Filter{ $PSItem.HealthStatus -ne 'Healthy' -or $PSItem.SizeRemaining -lt 100GB}

get-service | ? {($_.name).Length -gt 10}

get-eventlog -LogName System -EntryType error | Select-Object -First 20| Format-list

Get-Process |Measure-Object -Property PM -Sum -Average

Test-netconnection ((Get-NetIPConfiguration -InterfaceAlias Ethernet).DNSServer).ServerAddresses

Get-WmiObject -Class Win32_Service -Filter "Name='WinRM'" | Invoke-WmiMethod -Name ChangeStartMode -Argument 'Automatic'

Get-CimInstance -Class Win32_UserAccount | Format-Table -Property Caption,Domain,SID,FullName,Name

Get-CimInstance –Query “SELECT * FROM Win32_NetworkAdapter"

Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where DHCPEnabled -eq $False | Select IPAddress

Get-CimInstance –ClassName Win32_LogicalDisk –Filter "DriveType=3"