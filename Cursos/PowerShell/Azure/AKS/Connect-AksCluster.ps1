<#
.SYNOPSIS
    Configura kubectl para conectarse a un cluster de Azure Kubernetes Service.
.EXAMPLE
    ./Connect-AksCluster.ps1 -SubscriptionId $subscriptionId `
        -ResourceGroupName 'rg-aks' -ClusterName 'aks-demo'
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory)]
    [string] $ClusterName,

    [Parameter()]
    [switch] $Admin
)

$ErrorActionPreference = 'Stop'

foreach ($command in 'az', 'kubectl') {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
        throw "No se encontro '$command' en PATH."
    }
}

az account set --subscription $SubscriptionId
if ($LASTEXITCODE -ne 0) { throw 'No fue posible seleccionar la suscripcion.' }

$arguments = @(
    'aks', 'get-credentials',
    '--resource-group', $ResourceGroupName,
    '--name', $ClusterName,
    '--overwrite-existing'
)
if ($Admin) { $arguments += '--admin' }

az @arguments
if ($LASTEXITCODE -ne 0) { throw 'No fue posible obtener las credenciales de AKS.' }

kubectl cluster-info
