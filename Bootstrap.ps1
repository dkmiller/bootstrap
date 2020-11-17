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

# See below for more packages:
# https://github.com/microsoft/winget-pkgs/
@(
    'Adobe.AdobeAcrobatReaderDC',
    'Anaconda.Miniconda3',
    'Docker.DockerDesktop',
    'Git.Git',
    'Google.Chrome',
    'LINQPad.LINQPad',
    'Microsoft.AzureCli',
    'Microsoft.dotnet',
    'Microsoft.Edge',
    'Microsoft.Powershell',
    'Microsoft.Teams',
    'Microsoft.WindowsTerminal',
    'Microsoft.VisualStudioCode',
    'Microsoft.VisualStudio.Enterprise',
    'Nvidia.GeForceExperience',
    'Postman.Postman'
) | ForEach-Object {
    Write-Host "Installing $_"
    # https://docs.microsoft.com/en-us/windows/package-manager/winget/install
    winget install --id $_ --exact
}
