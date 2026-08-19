<#
.SYNOPSIS
    Crea un registro de aplicacion y su entidad de servicio.
.DESCRIPTION
    No crea secretos de cliente. Para automatizacion, prefiera credenciales
    federadas, certificados o identidades administradas.
.EXAMPLE
    ./New-AzApplicationRegistration.ps1 -DisplayName 'demo-automation'
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $DisplayName
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Resources

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

$application = Get-AzADApplication -DisplayName $DisplayName -ErrorAction SilentlyContinue |
    Select-Object -First 1

if (-not $application -and $PSCmdlet.ShouldProcess($DisplayName, 'Crear registro de aplicacion')) {
    $application = New-AzADApplication -DisplayName $DisplayName -ErrorAction Stop
}

$servicePrincipal = if ($application) {
    Get-AzADServicePrincipal -ApplicationId $application.AppId -ErrorAction SilentlyContinue |
        Select-Object -First 1
}

if ($application -and -not $servicePrincipal -and
    $PSCmdlet.ShouldProcess($DisplayName, 'Crear entidad de servicio')) {
    $servicePrincipal = New-AzADServicePrincipal -ApplicationId $application.AppId -ErrorAction Stop
}

[pscustomobject]@{
    DisplayName              = $application.DisplayName
    ApplicationId            = $application.AppId
    ApplicationObjectId      = $application.Id
    ServicePrincipalObjectId = $servicePrincipal.Id
}
