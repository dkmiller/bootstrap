# https://superuser.com/a/446836
function prompt {
    $p = Split-Path -leaf -path (Get-Location)
    "$p\ > "
}
