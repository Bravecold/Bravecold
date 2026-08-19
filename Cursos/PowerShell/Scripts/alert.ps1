<#
.SYNOPSIS
	Handles and escalates an alert 
.DESCRIPTION
	This PowerShell script handles and escalates the given alert message through Pushbullet.
	Set the PUSHBULLET_ACCESS_TOKEN environment variable before running the script.
.PARAMETER message
	Specifies the alert message
.EXAMPLE
	PS> ./alert "Harddisk failure"
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$Message = "")

try {
	if ($Message -eq "" ) { $Message = Read-Host "Enter alert message" }
	$AccessToken = $env:PUSHBULLET_ACCESS_TOKEN
	if ([string]::IsNullOrWhiteSpace($AccessToken)) {
		throw "Set the PUSHBULLET_ACCESS_TOKEN environment variable before running this script"
	}

	Write-Output "ALERT: $Message"

	$Headers = @{
		"Access-Token" = $AccessToken
		"Content-Type" = "application/json"
	}
	$Body = @{
		type = "note"
		title = "ALERT"
		body = $Message
	} | ConvertTo-Json
	Invoke-RestMethod -Uri "https://api.pushbullet.com/v2/pushes" -Method Post -Headers $Headers -Body $Body

	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
