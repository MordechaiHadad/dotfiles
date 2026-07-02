# Creates a junction:
#   %LOCALAPPDATA%\nvim  ->  <this-repo>\nvim

$ErrorActionPreference = "Stop"

# Repo root = folder containing this script (works regardless of drive/path)
$RepoRoot   = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceNvim = Join-Path $RepoRoot "nvim"

if (-not (Test-Path -LiteralPath $SourceNvim -PathType Container)) {
  throw "Source folder not found: $SourceNvim"
}

$TargetNvim = Join-Path $env:LOCALAPPDATA "nvim"

Write-Host "Linking Neovim config..."
Write-Host "  Source: $SourceNvim"
Write-Host "  Target: $TargetNvim"

# If target exists and is already linked correctly, exit.
if (Test-Path -LiteralPath $TargetNvim) {
  $item = Get-Item -LiteralPath $TargetNvim -Force

  if ($item.LinkType -and ($item.Target -contains $SourceNvim)) {
    Write-Host "Already linked. Nothing to do."
    exit 0
  }

  # Safe default: back up existing config/link folder.
  $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
  $backup = "${TargetNvim}.backup.$timestamp"
  Write-Host "Target exists; moving to backup: $backup"
  Move-Item -LiteralPath $TargetNvim -Destination $backup
}

# Create the junction (Target is an alias for -Value in New-Item). [page:4]
New-Item -ItemType Junction -Path $TargetNvim -Value $SourceNvim | Out-Null

Write-Host "Done."

Write-Host "Now installing agent skills to ~/.config/opencode/skills"
git clone ssh://git@codeberg.org/MordechaiHadad/opencode.git ~/.config/opencode
