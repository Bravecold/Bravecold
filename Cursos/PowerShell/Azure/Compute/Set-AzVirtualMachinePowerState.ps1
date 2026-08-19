<#
.SYNOPSIS
    Inicia o detiene maquinas virtuales seleccionadas por nombre o etiqueta.
.EXAMPLE
    ./Set-AzVirtualMachinePowerState.ps1 -SubscriptionId $subscriptionId `
        -State Start -TagName 'Schedule' -TagValue 'BusinessHours' -WhatIf
#>
[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [ValidateSet('Start', 'Stop')]
    [string] $State,

    [Parameter(ParameterSetName = 'Name', Mandatory)]
    [string[]] $Name,

    [Parameter(ParameterSetName = 'Tag', Mandatory)]
    [string] $TagName,

    [Parameter(ParameterSetName = 'Tag', Mandatory)]
    [string] $TagValue
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Compute

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop | Out-Null
$virtualMachines = Get-AzVM -ErrorAction Stop

if ($PSCmdlet.ParameterSetName -eq 'Name') {
    $virtualMachines = $virtualMachines | Where-Object Name -in $Name
}
else {
    $virtualMachines = $virtualMachines | Where-Object {
        $_.Tags.ContainsKey($TagName) -and $_.Tags[$TagName] -eq $TagValue
    }
}

if (-not $virtualMachines) {
    Write-Warning 'No se encontraron maquinas virtuales que coincidan con el filtro.'
    return
}

foreach ($vm in $virtualMachines) {
    $target = "$($vm.ResourceGroupName)/$($vm.Name)"
    if ($State -eq 'Start' -and $PSCmdlet.ShouldProcess($target, 'Iniciar maquina virtual')) {
        Start-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -ErrorAction Stop
    }
    elseif ($State -eq 'Stop' -and $PSCmdlet.ShouldProcess($target, 'Detener y desasignar maquina virtual')) {
        Stop-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Force -ErrorAction Stop
    }
}

