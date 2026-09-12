$ErrorActionPreference = 'Stop'
$targetDir = Join-Path $HOME 'codework'
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item (Join-Path $PSScriptRoot 'rest.ps1') (Join-Path $targetDir 'rest.ps1') -Force
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$parts = @($userPath -split ';' | Where-Object { $_ })
if ($parts -notcontains $targetDir) {
  [Environment]::SetEnvironmentVariable('Path', (($parts + $targetDir) -join ';'), 'User')
}
Write-Output "Installed $(Join-Path $targetDir 'rest.ps1')"
Write-Output 'Run: powershell -ExecutionPolicy Bypass -File "$HOME\codework\rest.ps1"'
