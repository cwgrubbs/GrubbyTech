# Asset Copy Script for GrubbyTech Website
# Run this script to automatically copy assets from your project folders

$ErrorActionPreference = "Continue"

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "GrubbyTech Asset Copy Script" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Define paths
$pillcheckrSource = "C:\Users\cwgru\work\pillcheckr"
$sleepDBNSource = "C:\Users\cwgru\work\SleepDBN"
$grubbyTechRoot = "C:\Users\cwgru\work\GrubbyTech"

# Function to copy app icon
function Copy-AppIcon {
    param(
        [string]$SourcePath,
        [string]$DestPath,
        [string]$AppName
    )

    Write-Host "Looking for $AppName icon..." -ForegroundColor Yellow

    # Try different common icon locations
    $iconPaths = @(
        "$SourcePath\android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png",
        "$SourcePath\android\app\src\main\ic_launcher-playstore.png",
        "$SourcePath\assets\icon.png",
        "$SourcePath\icon.png"
    )

    foreach ($iconPath in $iconPaths) {
        if (Test-Path $iconPath) {
            Write-Host "  Found icon at: $iconPath" -ForegroundColor Green
            Copy-Item $iconPath $DestPath -Force
            Write-Host "  ✓ Copied to: $DestPath" -ForegroundColor Green
            return $true
        }
    }

    Write-Host "  ⚠ No icon found. Checked:" -ForegroundColor Red
    foreach ($iconPath in $iconPaths) {
        Write-Host "    - $iconPath" -ForegroundColor Gray
    }
    return $false
}

# Function to copy screenshots
function Copy-Screenshots {
    param(
        [string]$SourcePath,
        [string]$DestPath,
        [string]$AppName
    )

    Write-Host "Looking for $AppName screenshots..." -ForegroundColor Yellow

    # Try different common screenshot locations
    $screenshotPaths = @(
        "$SourcePath\screenshots",
        "$SourcePath\fastlane\screenshots",
        "$SourcePath\assets\screenshots",
        "$SourcePath\docs\screenshots"
    )

    foreach ($screenshotPath in $screenshotPaths) {
        if (Test-Path $screenshotPath) {
            $files = Get-ChildItem -Path $screenshotPath -Include *.png,*.jpg,*.jpeg -Recurse
            if ($files.Count -gt 0) {
                Write-Host "  Found $($files.Count) screenshot(s) at: $screenshotPath" -ForegroundColor Green

                # Create destination directory if it doesn't exist
                if (-not (Test-Path $DestPath)) {
                    New-Item -ItemType Directory -Path $DestPath -Force | Out-Null
                }

                # Copy all image files
                Copy-Item -Path "$screenshotPath\*" -Destination $DestPath -Include *.png,*.jpg,*.jpeg -Recurse -Force
                Write-Host "  ✓ Copied to: $DestPath" -ForegroundColor Green
                return $true
            }
        }
    }

    Write-Host "  ⚠ No screenshots found. Checked:" -ForegroundColor Red
    foreach ($screenshotPath in $screenshotPaths) {
        Write-Host "    - $screenshotPath" -ForegroundColor Gray
    }
    return $false
}

# Process PillCheckr
Write-Host "`n[1/2] Processing PillCheckr..." -ForegroundColor Cyan
Write-Host "------------------------------------" -ForegroundColor Cyan

if (Test-Path $pillcheckrSource) {
    $iconCopied = Copy-AppIcon -SourcePath $pillcheckrSource `
        -DestPath "$grubbyTechRoot\apps\pillcheckr\assets\images\icon.png" `
        -AppName "PillCheckr"

    $screenshotsCopied = Copy-Screenshots -SourcePath $pillcheckrSource `
        -DestPath "$grubbyTechRoot\apps\pillcheckr\assets\screenshots" `
        -AppName "PillCheckr"

    if ($iconCopied -or $screenshotsCopied) {
        Write-Host "✓ PillCheckr assets processed" -ForegroundColor Green
    } else {
        Write-Host "⚠ No PillCheckr assets found" -ForegroundColor Yellow
    }
} else {
    Write-Host "✗ PillCheckr source directory not found: $pillcheckrSource" -ForegroundColor Red
}

# Process SleepDBN
Write-Host "`n[2/2] Processing SleepDBN..." -ForegroundColor Cyan
Write-Host "------------------------------------" -ForegroundColor Cyan

if (Test-Path $sleepDBNSource) {
    $iconCopied = Copy-AppIcon -SourcePath $sleepDBNSource `
        -DestPath "$grubbyTechRoot\apps\sleepdbn\assets\images\icon.png" `
        -AppName "SleepDBN"

    $screenshotsCopied = Copy-Screenshots -SourcePath $sleepDBNSource `
        -DestPath "$grubbyTechRoot\apps\sleepdbn\assets\screenshots" `
        -AppName "SleepDBN"

    if ($iconCopied -or $screenshotsCopied) {
        Write-Host "✓ SleepDBN assets processed" -ForegroundColor Green
    } else {
        Write-Host "⚠ No SleepDBN assets found" -ForegroundColor Yellow
    }
} else {
    Write-Host "✗ SleepDBN source directory not found: $sleepDBNSource" -ForegroundColor Red
}

# Summary
Write-Host "`n====================================" -ForegroundColor Cyan
Write-Host "Asset Copy Complete!" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review copied assets in:" -ForegroundColor White
Write-Host "   - apps/pillcheckr/assets/" -ForegroundColor Gray
Write-Host "   - apps/sleepdbn/assets/" -ForegroundColor Gray
Write-Host ""
Write-Host "2. If screenshots were copied, update the HTML files" -ForegroundColor White
Write-Host "   to use <img> tags instead of placeholders" -ForegroundColor Gray
Write-Host "   (See ASSETS_SETUP.md for instructions)" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Optimize images for web using TinyPNG or Squoosh" -ForegroundColor White
Write-Host ""
Write-Host "4. Test the website locally or deploy to GitHub Pages" -ForegroundColor White
Write-Host ""

# Pause so user can see results
Read-Host "Press Enter to exit"

