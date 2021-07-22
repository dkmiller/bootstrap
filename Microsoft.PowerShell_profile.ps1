# https://stackoverflow.com/a/44411205
function Get-BranchName {
    # https://en.wikipedia.org/wiki/ANSI_escape_code
    $Blue = "`e[94m"
    $Red = "`e[31m"
    $Reset = "`e[0m"
    $Yellow = "`e[93m"

    try {
        $Branch = git rev-parse --abbrev-ref HEAD

        if ($Branch -eq "HEAD") {
            # We're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD

            # https://superuser.com/a/1259916
            $AnnotatedBranch = "$Red$Branch$Reset"
        }
        else {
            # We're on an actual branch, so print it
            $AnnotatedBranch = "$Blue$Branch$Reset"
        }
    }
    catch {
        # We'll end up here if we're in a newly initiated git repo
        $AnnotatedBranch = "$($Yellow)N/A$($Reset)"
    }

    return " ($AnnotatedBranch)"
}


# https://superuser.com/a/446836
function prompt {
    $p = Split-Path -leaf -path (Get-Location)

    if (Test-Path .git) {
        $Branch = Get-BranchName
        $p += $Branch
    }

    $p += "\ > "

    return $p
}

function bootstrap {
    param(
        $Branch = "main"
    )
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-WebRequest https://raw.githubusercontent.com/dkmiller/bootstrap/$Branch/Bootstrap.ps1 | Invoke-Expression
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
