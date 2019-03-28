<#
This script may be reached via: https://aka.ms/danmill/bootstrap .

In an elevated shell, execute the following command to download and
run this script:

Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://aka.ms/danmill/bootstrap | iex
#>

# Fail on an error.
$ErrorActionPreference = 'Stop'

# Remove bloatware.
@(
    'bubblewitch',
    'candycrush',
    'disney',
    'hiddencity',
    'officehub',
    'getstarted',
    'zunemusic',
    'windowsmaps',
    'solitairecollection',
    'zunevideo',
    'bingnews',
    'bingweather',
    'xboxapp'
) | ForEach-Object {
    Get-AppxPackage "*$_*" | Remove-AppxPackage -ErrorAction SilentlyContinue
}

# Follow: https://chocolatey.org/docs/installation.
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# See https://chocolatey.org/packages/<package name> for more details on any of these.
@(
    'adobereader',
    'docfx',
    'docker-desktop',
    'dotnetcore-sdk',
    'fiddler',
    'firacode',
    'git',
    'googlechrome',
    'ilspy',
    'jdk8',
    'linqpad',
    'microsoft-teams',
    'netfx-4.7.1-devpack',
    'nugetpackageexplorer',
    'nuget.commandline',
    'office365proplus',
    'r.project',
    'r.studio',
    'vscode',
    'vscode-csharp',
    'vscode-docker',
    'vscode-powershell'
) | ForEach-Object {
    choco install --yes --fail-on-standard-error $_
    refreshenv
}

choco install --yes --fail-on-standard-error anaconda3 --params '/InstallationType:AllUsers /AddToPath:1 /RegisterPython:1'
choco install --yes --fail-on-standard-error visualstudio2017enterprise --params '--allWorkloads --includeRecommended --includeOptional --passive'
