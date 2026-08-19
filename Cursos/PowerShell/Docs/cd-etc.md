## The *cd-etc.ps1* Script

Changes the working directory to the operating system's configuration directory: `/etc` on Linux or `%WINDIR%\System32\drivers\etc` on Windows.

## Usage

```powershell
PS> ./cd-etc.ps1
📂C:\Windows\System32\drivers\etc
```

The script takes no parameters. It exits with status `0` on success and `1` when the directory cannot be resolved.

## Related Links

- [Source script](../Scripts/cd-etc.ps1)
- [PowerShell repository](https://github.com/fleschutz/PowerShell)

## Notes

Author: Markus Fleschutz | License: CC0
