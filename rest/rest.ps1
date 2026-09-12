[CmdletBinding()]
param([switch]$All)

Write-Output 'Press Ctrl+C to cancel before sleep.'
Start-Sleep -Seconds 1
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)
