## The *on-desktop-login.ps1* Script

Runs a small set of desktop-startup tasks after a user signs in. The current implementation opens the configured dashboards and Windows Terminal.

## Usage

```powershell
PS> ./on-desktop-login.ps1
```

This script invokes `open-dashboards.ps1` and `open-windows-terminal.ps1` from the same directory. Review that list before registering the script as a login task.

## Related Links

- [Source script](../Scripts/on-desktop-login.ps1)
- [PowerShell repository](https://github.com/fleschutz/PowerShell)

## Notes

Author: Markus Fleschutz | License: CC0
