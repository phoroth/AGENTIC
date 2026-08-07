param (
    [string]$Target = "all"
)

$targets = @()

if ($Target -eq "all" -or $Target -eq "gemini") {
    $targets += "$HOME\.gemini\config"
}
if ($Target -eq "all" -or $Target -eq "claude") {
    $targets += "$HOME\.claude"
}
if ($Target -eq "all" -or $Target -eq "opencode") {
    $targets += "$HOME\.config\opencode"
}
if ($Target -eq "all" -or $Target -eq "codex") {
    $targets += "$HOME\.codex"
}
if ($Target -eq "all" -or $Target -eq "cursor") {
    $targets += "$HOME\.cursor"
}

Write-Host "Installing AGENTIC Skills & Plugins to AI Agent configuration paths..."

$scriptDir = $PSScriptRoot
$sourceDir = ""

if ($scriptDir -and (Test-Path -Path "$scriptDir\skills")) {
    $sourceDir = $scriptDir
} else {
    $sourceDir = "$HOME\AGENTIC-tmp"
    if (Test-Path -Path $sourceDir) { Remove-Item -Path $sourceDir -Recurse -Force }
    Write-Host " -> Fetching AGENTIC repository..."
    git clone https://github.com/phoroth/AGENTIC.git $sourceDir
}

foreach ($dir in $targets) {
    Write-Host " -> Syncing skills & plugins to $dir..."
    New-Item -ItemType Directory -Force -Path "$dir\skills", "$dir\plugins" | Out-Null
    Copy-Item -Path "$sourceDir\skills\*" -Destination "$dir\skills" -Recurse -Force
    Copy-Item -Path "$sourceDir\plugins\*" -Destination "$dir\plugins" -Recurse -Force
}

if ($sourceDir -eq "$HOME\AGENTIC-tmp") {
    Remove-Item -Path $sourceDir -Recurse -Force
}

Write-Host "Installation complete for all AI agent harnesses! Restart your AI agent to load the new skills."
