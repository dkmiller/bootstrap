<#
In an elevated shell, execute the following command to download and
run this script:

Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://raw.githubusercontent.com/dkmiller/bootstrap/vnext/Bootstrap.ps1 | iex
#>

# Fail on an error.
$ErrorActionPreference = "Stop"

Write-Host "Hi from the boostrap!"
