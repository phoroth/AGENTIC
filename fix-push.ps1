Set-Location "c:\Users\kibor\everything-ai-skills"

git checkout c1d1dc1 -- .
git reset HEAD

if (Test-Path "install.ps1") { git add install.ps1 }
if (Test-Path "install.sh") { git add install.sh }
if (Test-Path "sanitize.ps1") { git add sanitize.ps1 }
git add fix-push.ps1
git commit -m "add: root files"
git push origin main

if (Test-Path "plugins") {
    $pluginDirs = (Get-ChildItem -Path "plugins" -Directory).Name
    foreach ($dir in $pluginDirs) {
        git add "plugins/$dir"
        git commit -m "add: plugin $dir"
        git push origin main
        Write-Host "done: $dir"
    }
}

if (Test-Path "skills") {
    $skillDirs = (Get-ChildItem -Path "skills" -Directory).Name
    $batchSize = 50
    $total = $skillDirs.Count
    $totalBatches = [Math]::Ceiling($total / $batchSize)

    for ($i = 0; $i -lt $total; $i += $batchSize) {
        $batchNum = [Math]::Floor($i / $batchSize) + 1
        $end = [Math]::Min($i + $batchSize - 1, $total - 1)
        $slice = $skillDirs[$i..$end]
        foreach ($dir in $slice) {
            git add "skills/$dir"
        }
        git commit -m "add: skills $batchNum of $totalBatches"
        git push origin main
        Write-Host "skills batch $batchNum of $totalBatches done"
    }
}

Write-Host "DONE"
