$installDir = "$HOME\.gemini\config"
Write-Host "Installing AGENTIC Skills to $installDir..."
New-Item -ItemType Directory -Force -Path "$installDir\skills", "$installDir\plugins" | Out-Null
git clone https://github.com/phoroth/AGENTIC.git "$HOME\AGENTIC-tmp"
Copy-Item -Path "$HOME\AGENTIC-tmp\skills\*" -Destination "$installDir\skills" -Recurse -Force
Copy-Item -Path "$HOME\AGENTIC-tmp\plugins\*" -Destination "$installDir\plugins" -Recurse -Force
Remove-Item -Path "$HOME\AGENTIC-tmp" -Recurse -Force
Write-Host "Installation complete! Restart your AI agent to load the new skills."
