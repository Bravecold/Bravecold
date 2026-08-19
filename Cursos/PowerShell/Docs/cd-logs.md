## The *cd-logs.ps1* Script

Changes the working directory to the operating system's log directory: `/var/log` on Linux or `%WINDIR%\Logs` on Windows.

## Usage

```powershell
PS> ./cd-logs.ps1
📂C:\Windows\Logs
```

The script takes no parameters. It exits with status `0` on success and `1` when the directory is unavailable.

## Related Links

- [Source script](../Scripts/cd-logs.ps1)
- [PowerShell repository](https://github.com/fleschutz/PowerShell)

## Notes

Author: Markus Fleschutz | License: CC0
