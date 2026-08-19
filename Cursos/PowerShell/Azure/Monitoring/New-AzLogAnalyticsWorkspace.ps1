<#
.SYNOPSIS
    Crea un espacio de Log Analytics de forma idempotente.
.EXAMPLE
    ./New-AzLogAnalyticsWorkspace.ps1 -SubscriptionId $subscriptionId `
        -ResourceGroupName 'rg-monitoring' -WorkspaceName 'law-demo' `
        -Location 'eastus'
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [ValidatePattern('^[-\w\.\(\)]+$')]
    [string] $ResourceGroupName,

    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9-]{4,63}$')]
    [string] $WorkspaceName,

    [Parameter(Mandatory)]
    [string] $Location,

    [Parameter()]
    [ValidateSet('Free', 'PerGB2018', 'Standalone')]
    [string] $Sku = 'PerGB2018'
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Resources, Az.OperationalInsights

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop | Out-Null

$resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup -and $PSCmdlet.ShouldProcess($ResourceGroupName, 'Crear grupo de recursos')) {
    $resourceGroup = New-AzResourceGroup -Name $ResourceGroupName -Location $Location -ErrorAction Stop
}

$workspace = Get-AzOperationalInsightsWorkspace `
    -ResourceGroupName $ResourceGroupName `
    -Name $WorkspaceName `
    -ErrorAction SilentlyContinue

if (-not $workspace -and $PSCmdlet.ShouldProcess($WorkspaceName, 'Crear espacio de Log Analytics')) {
    $workspace = New-AzOperationalInsightsWorkspace `
        -ResourceGroupName $ResourceGroupName `
        -Name $WorkspaceName `
        -Location $Location `
        -Sku $Sku `
        -ErrorAction Stop
}

$workspace
