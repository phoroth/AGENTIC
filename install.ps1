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

Write-Host "Installing AGENTIC Skills to AI Agent configuration paths..."

$tmpDir = "$HOME\AGENTIC-tmp"
if (Test-Path -Path $tmpDir) { Remove-Item -Path $tmpDir -Recurse -Force }

git clone https://github.com/phoroth/AGENTIC.git $tmpDir

foreach ($dir in $targets) {
    Write-Host " -> Syncing skills & plugins to $dir..."
    New-Item -ItemType Directory -Force -Path "$dir\skills", "$dir\plugins" | Out-Null
    Copy-Item -Path "$tmpDir\skills\*" -Destination "$dir\skills" -Recurse -Force
    Copy-Item -Path "$tmpDir\plugins\*" -Destination "$dir\plugins" -Recurse -Force
}

Remove-Item -Path $tmpDir -Recurse -Force
Write-Host "Installation complete for all AI agent harnesses! Restart your AI agent to load the new skills."
