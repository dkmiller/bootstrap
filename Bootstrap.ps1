<#
This script may be reached via: https://aka.ms/danmill/bootstrap .

In an elevated shell, run:
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://aka.ms/danmill/bootstrap'))
#>

# Fail on an error.
$ErrorActionPreference = 'Stop'

# Follow: https://chocolatey.org/docs/installation.
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# See https://chocolatey.org/packages/<package name> for more details on any of these.
choco install --yes anaconda3 --params '/InstallationType:AllUsers /AddToPath:1 /RegisterPython:1'
choco install --yes googlechrome
choco install --yes docker-for-windows
choco install --yes fiddler
choco install --yes git.install --params '/SChannel'
choco install --yes ilspy
choco install --yes jdk8
choco install --yes linqpad
choco install --yes office365proplus
choco install --yes dotnetcore-sdk
choco install --yes netfx-4.7.1-devpack
choco install --yes r.project
choco install --yes r.studio
choco install --yes vscode --params '/NoDesktopIcon /NoQuickLaunchIcon'
choco install --yes visualstudio2017enterprise
