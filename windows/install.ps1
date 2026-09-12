$ErrorActionPreference = 'Stop'
$targetDir = Join-Path $HOME 'codework'
$target = Join-Path $targetDir 'codework.ps1'
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item (Join-Path $PSScriptRoot 'codework.ps1') $target -Force

# Add the install directory to the user PATH once, without requiring admin rights.
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$parts = @($userPath -split ';' | Where-Object { $_ })
if ($parts -notcontains $targetDir) {
  [Environment]::SetEnvironmentVariable('Path', (($parts + $targetDir) -join ';'), 'User')
}
Write-Output "Installed $target"
Write-Output "Added $targetDir to the user PATH. Open a new PowerShell window to use it."
