<#
.SYNOPSIS
    Crea una base de datos en un servidor logico de Azure SQL existente.
.DESCRIPTION
    No recibe ni almacena contrasenas. La autenticacion al plano de control usa
    la sesion actual de Az. El esquema opcional se aplica por separado con una
    identidad de Microsoft Entra y el modulo SqlServer.
.EXAMPLE
    ./New-AzSqlDatabase.ps1 -SubscriptionId $subscriptionId `
        -ResourceGroupName 'rg-data' -ServerName 'sql-example' `
        -DatabaseName 'training' -ApplySchema -SchemaPath ./schema.sql
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory)]
    [string] $ServerName,

    [Parameter(Mandatory)]
    [string] $DatabaseName,

    [Parameter()]
    [string] $Edition = 'GeneralPurpose',

    [Parameter()]
    [string] $ServiceObjectiveName = 'GP_S_Gen5_1',

    [Parameter()]
    [switch] $ApplySchema,

    [Parameter()]
    [string] $SchemaPath = (Join-Path $PSScriptRoot 'schema.sql')
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Sql

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop | Out-Null

$database = Get-AzSqlDatabase `
    -ResourceGroupName $ResourceGroupName `
    -ServerName $ServerName `
    -DatabaseName $DatabaseName `
    -ErrorAction SilentlyContinue

if (-not $database -and $PSCmdlet.ShouldProcess($DatabaseName, 'Crear base de datos de Azure SQL')) {
    $database = New-AzSqlDatabase `
        -ResourceGroupName $ResourceGroupName `
        -ServerName $ServerName `
        -DatabaseName $DatabaseName `
        -Edition $Edition `
        -RequestedServiceObjectiveName $ServiceObjectiveName `
        -ErrorAction Stop
}

if ($ApplySchema) {
    if (-not (Test-Path -LiteralPath $SchemaPath -PathType Leaf)) {
        throw "No se encontro el esquema: $SchemaPath"
    }
    if (-not (Get-Module -ListAvailable -Name SqlServer)) {
        throw 'Instale el modulo SqlServer para aplicar el esquema.'
    }
    if ($PSCmdlet.ShouldProcess($DatabaseName, 'Aplicar esquema SQL con token de Microsoft Entra')) {
        $accessToken = (Get-AzAccessToken -ResourceUrl 'https://database.windows.net').Token
        Invoke-Sqlcmd `
            -ServerInstance "$ServerName.database.windows.net" `
            -Database $DatabaseName `
            -AccessToken $accessToken `
            -InputFile $SchemaPath `
            -ErrorAction Stop
    }
}

$database

