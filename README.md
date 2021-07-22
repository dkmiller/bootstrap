# Boostrap

PowerShell script to download and install basic data science setup on a Windows machine.

To initialize the bootstrap, execute the following command from an admin (elevated) PowerShell prompt.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://raw.githubusercontent.com/dkmiller/bootstrap/main/Bootstrap.ps1 | iex
```

After the bootstrap has been initialized, you may also use the following commands.

- `bootstrap` (re-bootstrap)
- `Clear-GitRepo` checkout the primary branch, clean local files, and prune from origin.
    - This command only makes sense in the context of a Git repo.
