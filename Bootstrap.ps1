<#
This script may be reached via: https://aka.ms/danmill/bootstrap .

In an elevated shell, execute the following command to download and
run this script:

Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://aka.ms/danmill/bootstrap | iex
#>

# Fail on an error.
$ErrorActionPreference = 'Stop'

# Follow: https://chocolatey.org/docs/installation.
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# See https://chocolatey.org/packages/<package name> for more details on any of these.
choco install --yes --fail-on-standard-error anaconda3 --params '/InstallationType:AllUsers /AddToPath:1 /RegisterPython:1'
choco install --yes --fail-on-standard-error azure-cli
choco install --yes --fail-on-standard-error googlechrome
choco install --yes --fail-on-standard-error docker-for-windows
choco install --yes --fail-on-standard-error fiddler
choco install --yes --fail-on-standard-error git --params '/SChannel'
choco install --yes --fail-on-standard-error ilspy
choco install --yes --fail-on-standard-error jdk8
choco install --yes --fail-on-standard-error linqpad
choco install --yes --fail-on-standard-error microsoft-teams
# choco install --yes --fail-on-standard-error office365proplus
choco install --yes --fail-on-standard-error dotnetcore-sdk
choco install --yes --fail-on-standard-error netfx-4.7.1-devpack
choco install --yes --fail-on-standard-error r.project
choco install --yes --fail-on-standard-error r.studio
choco install --yes --fail-on-standard-error vscode --params '/NoDesktopIcon /NoQuickLaunchIcon'
choco install --yes --fail-on-standard-error visualstudio2017enterprise --params '--allWorkloads --includeRecommended --includeOptional --passive'
