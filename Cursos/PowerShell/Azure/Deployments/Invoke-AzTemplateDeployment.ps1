<#
.SYNOPSIS
    Ejecuta un despliegue de grupo de recursos desde ARM o Bicep.
.DESCRIPTION
    Acepta un archivo local o una URI HTTPS. No descarga plantillas mediante
    claves de almacenamiento y funciona con la sesion actual de Az.
.EXAMPLE
    ./Invoke-AzTemplateDeployment.ps1 -SubscriptionId $subscriptionId `
        -ResourceGroupName 'rg-demo' -TemplateFile ./main.bicep -WhatIf
#>
[CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'File')]
param(
    [Parameter(Mandatory)]
    [string] $SubscriptionId,

    [Parameter(Mandatory)]
    [string] $ResourceGroupName,

    [Parameter()]
    [string] $DeploymentName = "deployment-$(Get-Date -Format 'yyyyMMdd-HHmmss')",

    [Parameter(ParameterSetName = 'File', Mandatory)]
    [string] $TemplateFile,

    [Parameter(ParameterSetName = 'Uri', Mandatory)]
    [ValidatePattern('^https://')]
    [uri] $TemplateUri,

    [Parameter()]
    [string] $TemplateParameterFile,

    [Parameter()]
    [hashtable] $TemplateParameterObject
)

#Requires -Version 7.0
#Requires -Modules Az.Accounts, Az.Resources

if (-not (Get-AzContext)) {
    throw 'No existe una sesion de Azure. Ejecute Connect-AzAccount.'
}

Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop | Out-Null

$parameters = @{
    Name              = $DeploymentName
    ResourceGroupName = $ResourceGroupName
    ErrorAction       = 'Stop'
}

if ($PSCmdlet.ParameterSetName -eq 'File') {
    if (-not (Test-Path -LiteralPath $TemplateFile -PathType Leaf)) {
        throw "No se encontro la plantilla: $TemplateFile"
    }
    $parameters.TemplateFile = $TemplateFile
}
else {
    $parameters.TemplateUri = $TemplateUri
}

if ($TemplateParameterFile) {
    $parameters.TemplateParameterFile = $TemplateParameterFile
}
if ($TemplateParameterObject) {
    $parameters.TemplateParameterObject = $TemplateParameterObject
}

if ($WhatIfPreference) {
    Get-AzResourceGroupDeploymentWhatIfResult @parameters
}
elseif ($PSCmdlet.ShouldProcess($ResourceGroupName, "Ejecutar despliegue $DeploymentName")) {
    New-AzResourceGroupDeployment @parameters
}
