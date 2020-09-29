
$scriptFolder = Split-Path -Path $MyInvocation.MyCommand.Path

$VSDirectories = @()
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\TeamExplorer\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Professional\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\TeamExplorer\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio 14.0\Common7\IDE"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio 12.0\Common7\IDE"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio 11.0\Common7\IDE"
$VSDirectories += "${env:ProgramFiles(x86)}\Microsoft Visual Studio 10.0\Common7\IDE"

$WitAdminExe = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\witadmin.exe"

if(-not (Get-Command $WitAdminExe -ErrorAction SilentlyContinue)) {
  Write-Host -Verbose "Unable to find witadmin.exe on your path. Attempting VS install directories"
  foreach($vsDir in $VSDirectories) {
    $WitAdminExe = Join-Path $vsDir "witadmin.exe"
    Write-Host -Verbose "Testing for $WitAdminExe"
    if(Test-Path $WitAdminExe) {
      break
    }
  }
}

if(-not (Test-Path $WitAdminExe)) {
  throw "Unable to find the witadmin.exe in your path or in any VS install."
}

# Format witadmin exe with quotes for the invoke-expression to like
$WitAdminExe = "'$WitAdminExe'"