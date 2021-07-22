<#
In an elevated shell, execute the following command to download and
run this script:

Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://raw.githubusercontent.com/dkmiller/bootstrap/main/Bootstrap.ps1 | iex
#>

param(
    $Root = "C:\src",
    $Repo = "bootstrap",
    $Branch = "main"
)

# Fail on an error.
$ErrorActionPreference = "Stop"

Write-Host "Hi from the boostrap!"

if (!(Get-Command git)) {
    Write-Warning "Git is not installed, doing so"
    winget install --id Git.Git --exact
}

mkdir -Force $Root

$Current = $PWD

try {
    Set-Location $Root

    if (!(Test-Path $Repo)) {
        Write-Warning "$Repo repo is not already cloned, doing so"
        git clone https://github.com/dkmiller/$($Repo).git
    }

    Set-Location $Repo
    git checkout $Branch
    git pull

    # https://stackoverflow.com/a/35813307
    $ProfileFile = Split-Path $PROFILE -Leaf

    # https://stackoverflow.com/a/34905638
    New-Item -Path $PROFILE -ItemType SymbolicLink -Value $Root\$Repo\$ProfileFile -Force
}
finally {
    Set-Location $Current
}
