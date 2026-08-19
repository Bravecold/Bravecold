<#
.SYNOPSIS
    Crea una cuenta de almacenamiento y un contenedor de blobs de forma idempotente.
.EXAMPLE
    ./New-AzStorageContainer.ps1 -SubscriptionId $subscriptionId `
        -ResourceGroupName 'rg-storage' -StorageAccountName 'stexample001' `
        -ContainerName 'data' -Location 'eastus'
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory)]
    [ValidatePattern('^[a-z0-9]{3,24}$')]
    [string] $StorageAccountName,

    [Parameter(Mandatory)]
    [ValidatePattern('^[a-z0-9](?!.*--)[a-z0-9-]{1,61}[a-z0-9]$')]
    [string] $ContainerName,

    [Parameter(Mandatory)]
    [string] $Location,

    [Parameter()]
    [ValidateSet('Standard_LRS', 'Standard_GRS', 'Standard_ZRS', 'Standard_RAGRS')]
    [string] $SkuName = 'Standard_LRS'
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Resources, Az.Storage

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop | Out-Null

$resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup -and $PSCmdlet.ShouldProcess($ResourceGroupName, 'Crear grupo de recursos')) {
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location -ErrorAction Stop | Out-Null
}

$account = Get-AzStorageAccount `
    -ResourceGroupName $ResourceGroupName `
    -Name $StorageAccountName `
    -ErrorAction SilentlyContinue

if (-not $account -and $PSCmdlet.ShouldProcess($StorageAccountName, 'Crear cuenta de almacenamiento')) {
    $account = New-AzStorageAccount `
        -ResourceGroupName $ResourceGroupName `
        -Name $StorageAccountName `
        -Location $Location `
        -SkuName $SkuName `
        -Kind StorageV2 `
        -EnableHttpsTrafficOnly $true `
        -MinimumTlsVersion TLS1_2 `
        -ErrorAction Stop
}

if ($account -and $PSCmdlet.ShouldProcess($ContainerName, 'Crear contenedor privado')) {
    New-AzStorageContainer `
        -Name $ContainerName `
        -Context $account.Context `
        -Permission Off `
        -ErrorAction Stop
}

