[CmdletBinding()]
param(
  [switch]$All,
  [switch]$Restart,
  [string]$ProjectDirectory = (Get-Location).Path
)
$ErrorActionPreference = 'Stop'
$project = (Resolve-Path -LiteralPath $ProjectDirectory).Path

if ($Restart) {
  foreach ($name in @('Code','WindowsTerminal')) {
    Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
  }
  Start-Sleep -Milliseconds 800
}

$code = Get-Command code -ErrorAction SilentlyContinue
if (-not $code) {
  throw 'codework: VS Code command `code` was not found. Install VS Code and enable its shell command.'
}
Start-Process $code.Source -ArgumentList ('"' + $project + '"')

$terminal = Get-Command wt -ErrorAction SilentlyContinue
if ($terminal) { Start-Process $terminal.Source -ArgumentList ('-d', ('"' + $project + '"')) }
else { Start-Process 'powershell.exe' -WorkingDirectory $project }

if ($All -or $Restart) {
  if ($env:CODEWORK_AI_URL) { Start-Process $env:CODEWORK_AI_URL }
  else { Start-Process 'https://chatgpt.com/' }
}
Write-Output "Coding workspace opened: $project"
