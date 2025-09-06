# Create-VSCode-AltUserDataShortcut.ps1
$desktop  = [Environment]::GetFolderPath('Desktop')
$shortcut = Join-Path $desktop 'VS Code with Docker.lnk'

# Resolve Code.exe dynamically
try {
    $codeCmd = (Get-Command code -ErrorAction Stop).Source
    $codeExe = (Split-Path (Split-Path $codeCmd -Parent) -Parent) + "\Code.exe"
} catch {
    Write-Error "Could not find 'code' on PATH. Is VS Code installed and added to PATH?"
    exit 1
}

$altDataDir = "$env:USERPROFILE\.local\share\vscode"

# Ensure alternate data directory exists
if (-not (Test-Path $altDataDir)) {
    New-Item -ItemType Directory -Path $altDataDir | Out-Null
}

# Create shortcut
$wsh = New-Object -ComObject WScript.Shell
$s = $wsh.CreateShortcut($shortcut)
$s.TargetPath   = $codeExe
$s.Arguments    = "--user-data-dir `"$altDataDir`""
$s.IconLocation = "$codeExe,0"
$s.WorkingDirectory = Split-Path $codeExe
$s.Save()

Write-Host "Shortcut created: $shortcut"

