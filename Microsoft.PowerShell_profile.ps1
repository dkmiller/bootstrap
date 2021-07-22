# https://superuser.com/a/446836
function prompt {
    $p = Split-Path -leaf -path (Get-Location)
    "$p\ > "
}

function bootstrap {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-WebRequest https://raw.githubusercontent.com/dkmiller/bootstrap/vnext/Bootstrap.ps1 | Invoke-Expression
}

function Clear-GitRepo {
    $ErrorActionPreference = "Stop"

    # https://stackoverflow.com/a/44750379
    $DefaultBranch = git symbolic-ref refs/remotes/origin/HEAD | ForEach-Object { $_.Split("/")[-1] }
    Write-Warning "Clearning repo assuming default branch $DefaultBranch"

    git checkout $DefaultBranch
    git pull
    git clean -xdf
    git remote prune origin
}
