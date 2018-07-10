<#
Run this using:

iex ((New-Object System.Net.WebClient).DownloadString('https://aka.ms/danmill/bootstrap'))
#>

# Follow: https://chocolatey.org/docs/installation.
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# https://chocolatey.org/packages/linqpad
Write-Host 'Installing LINQPad ...'
choco install linqpad
