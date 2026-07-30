$targetDir = "C:\Users\kibor\everything-ai-skills"
$files = Get-ChildItem -Path $targetDir -Recurse -File | Where-Object { $_.Extension -match "\.(md|json|txt|ps1|sh)$" -and $_.Name -ne "sanitize.ps1" }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
    
    if ($content) {
        # Replace paths
        $content = $content -ireplace 'C:\\Users\\kibor', '[USER_HOME]'
        $content = $content -ireplace 'C:/Users/kibor', '[USER_HOME]'
        
        # Scrub specific names
        $content = $content -ireplace 'umatter-africa', '[PROJECT_NAME]'
        $content = $content -ireplace 'viro', 'project'
        $content = $content -ireplace 'kibor', 'user'

        if ($content -cne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -NoNewline
            Write-Host "Sanitized: $($file.FullName)"
        }
    }
}
Write-Host "Sanitization complete."
