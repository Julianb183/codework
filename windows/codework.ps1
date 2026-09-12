[CmdletBinding()]
param(
  [switch]$All,
  [switch]$Restart,
  [string]$ProjectDirectory = (Get-Location).Path
)
$ErrorActionPreference = 'Stop'
$project = (Resolve-Path -LiteralPath $ProjectDirectory).Path

if ($Restart) {
  foreach ($name in @('Code','WindowsTerminal','cmd','powershell','pwsh')) {
    Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
  }
  Start-Sleep -Milliseconds 800
}

$code = Get-Command code -ErrorAction SilentlyContinue
if ($code) { Start-Process $code.Source -ArgumentList ('"' + $project + '"') }
else { Start-Process 'code' -ArgumentList ('"' + $project + '"') }

$terminal = Get-Command wt -ErrorAction SilentlyContinue
if ($terminal) { Start-Process $terminal.Source -ArgumentList ('-d', ('"' + $project + '"')) }
else { Start-Process 'powershell.exe' -WorkingDirectory $project }

if ($All -or $Restart) {
  if ($env:CODEWORK_AI_URL) { Start-Process $env:CODEWORK_AI_URL }
  else { Start-Process 'https://chatgpt.com/' }
}
Write-Output "Coding workspace opened: $project"
