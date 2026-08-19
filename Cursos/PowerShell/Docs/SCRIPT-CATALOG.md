# Script catalog and maintenance guide

The repository contains more than 500 standalone PowerShell scripts. To preserve existing links and command-line workflows, scripts remain in the flat `Scripts/` directory. Use this catalog to find and maintain them consistently.

## Find scripts by intent

| Intent | Naming pattern | Examples |
| --- | --- | --- |
| Navigate between directories | `cd-*` | `cd-home.ps1`, `cd-repos.ps1` |
| Inspect or report information | `list-*`, `check-*`, `show-*` | `list-processes.ps1`, `check-dns.ps1` |
| Open or close applications | `open-*`, `close-*` | `open-firefox.ps1`, `close-spotify.ps1` |
| Install, update, or remove software | `install-*`, `upgrade-*`, `uninstall-*` | `install-github-cli.ps1` |
| Convert files or data | `convert-*`, `export-*` | `convert-md2pdf.ps1` |
| Work with Git repositories | `*-repo*`, `*-branch*`, `*-tag*` | `check-repo.ps1`, `new-branch.ps1` |
| Work with files | `copy-*`, `download-*`, `search-*`, `upload-*` | `search-files.ps1` |
| Audio and speech | `play-*`, `speak-*`, `tell-*` | `speak-text.ps1` |
| System state and power | `enable-*`, `restart-*`, `reboot.ps1`, `poweroff.ps1` | `restart-network-adapters.ps1` |

The root [README](../README.md) provides the detailed functional index. Search by filename when the same script can fit more than one category.

## Platform and safety checks

Before running a script, review its comment-based help and look for:

- `#Requires -RunAsAdministrator` or commands that change system state;
- Windows-only APIs such as COM objects, the registry, or Windows paths;
- external executables such as Pandoc, Git, curl, or package managers;
- network calls and required environment variables;
- destructive verbs such as `Remove`, `Clear`, `Uninstall`, or `Clean`.

Test state-changing scripts in a disposable environment first.

## Documentation standard

Every script should start with comment-based help containing:

```powershell
<#
.SYNOPSIS
    One-line purpose.
.DESCRIPTION
    Behavior, platform requirements, and side effects.
.PARAMETER Name
    Description for each parameter, when applicable.
.EXAMPLE
    PS> ./script-name.ps1
.LINK
    Project or reference URL.
.NOTES
    Author and license.
#>
```

Add a matching `Docs/<script-name>.md` file when users need setup instructions, dependency details, examples, or safety warnings beyond the embedded help.

## Secret handling

Never store access tokens, passwords, API keys, or connection strings directly in a script. Read secrets from an environment variable or a secret-management system and fail with a clear message when the value is missing.
