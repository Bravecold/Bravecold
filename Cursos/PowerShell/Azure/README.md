# Azure con PowerShell

Ejemplos saneados y documentados para administrar Azure con el modulo `Az` y la CLI de Azure.

## Requisitos

- PowerShell 7 recomendado.
- Modulo `Az` actualizado: `Install-Module Az -Scope CurrentUser`.
- Azure CLI y `kubectl` para los ejemplos de AKS.
- Una sesion iniciada con `Connect-AzAccount` o `az login`.

## Contenido

| Carpeta | Proposito |
| --- | --- |
| `Compute` | Inventario de maquinas virtuales entre suscripciones. |
| `Monitoring` | Creacion de grupos de recursos y espacios de Log Analytics. |
| `Identity` | Registro de aplicaciones y entidades de servicio sin generar secretos. |
| `AKS` | Conexion parametrizada a AKS y manifiesto de ejemplo. |
| `ResourceGroups` | Ejemplo heredado para clonar recursos ARM. |

## Seguridad

Los ejemplos no contienen identificadores de suscripcion, nombres de recursos ni credenciales reales. Use parametros, variables de entorno, Azure Key Vault o identidades administradas. No guarde secretos, cadenas de conexion ni archivos de configuracion de `kubectl` en Git.

Revise siempre los comandos con `-WhatIf` cuando este disponible y pruebe primero en una suscripcion de laboratorio.

