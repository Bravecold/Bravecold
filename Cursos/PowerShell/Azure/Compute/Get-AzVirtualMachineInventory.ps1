<#
.SYNOPSIS
    Obtiene un inventario de maquinas virtuales de una o varias suscripciones.
.DESCRIPTION
    Usa exclusivamente el modulo Az. No solicita ni almacena credenciales: requiere
    una sesion existente de Connect-AzAccount. Devuelve objetos que pueden enviarse
    a Export-Csv, Format-Table u otros comandos.
.EXAMPLE
    ./Get-AzVirtualMachineInventory.ps1 | Format-Table
.EXAMPLE
    ./Get-AzVirtualMachineInventory.ps1 -SubscriptionId $subscriptionId |
        Export-Csv ./vms.csv -NoTypeInformation
#>
[CmdletBinding()]
param(
    [Parameter()]
    [string[]] $SubscriptionId
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Compute

$originalContext = Get-AzContext
if (-not $originalContext) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

try {
    $subscriptions = if ($SubscriptionId) {
        foreach ($id in $SubscriptionId) {
            Get-AzSubscription -SubscriptionId $id -ErrorAction Stop
        }
    }
    else {
        Get-AzSubscription -ErrorAction Stop | Where-Object State -eq 'Enabled'
    }

    foreach ($subscription in $subscriptions) {
        Set-AzContext -SubscriptionId $subscription.Id -ErrorAction Stop | Out-Null

        foreach ($vm in Get-AzVM -Status -ErrorAction Stop) {
            $powerState = $vm.Statuses |
                Where-Object Code -like 'PowerState/*' |
                Select-Object -First 1 -ExpandProperty DisplayStatus

            [pscustomobject]@{
                SubscriptionName = $subscription.Name
                SubscriptionId   = $subscription.Id
                ResourceGroup    = $vm.ResourceGroupName
                Name             = $vm.Name
                Location         = $vm.Location
                Size             = $vm.HardwareProfile.VmSize
                PowerState       = $powerState
            }
        }
    }
}
finally {
    Set-AzContext -Context $originalContext -ErrorAction SilentlyContinue | Out-Null
}
