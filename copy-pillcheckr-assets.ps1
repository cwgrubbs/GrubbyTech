# Copy PillCheckr Assets Script
# This script will help you copy screenshots and icons from your PillCheckr project

$pillcheckrProject = "C:\Users\cwgru\work\pillcheckr"
$websiteAssets = "C:\Users\cwgru\work\GrubbyTech\apps\pillcheckr\assets"

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "PillCheckr Asset Copy Helper" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Function to find and copy icon
function Find-AndCopyIcon {
    Write-Host "[1/2] Looking for app icon..." -ForegroundColor Yellow

    # Common icon locations
    $iconSearchPaths = @(
        "$pillcheckrProject\android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png",
        "$pillcheckrProject\android\app\src\main\res\mipmap-xxhdpi\ic_launcher.png",
        "$pillcheckrProject\android\app\src\main\ic_launcher-playstore.png",
        "$pillcheckrProject\assets\icon.png",
        "$pillcheckrProject\icon.png",
        "$pillcheckrProject\android\app\src\main\res\drawable\ic_launcher.png"
    )

    foreach ($path in $iconSearchPaths) {
        if (Test-Path $path) {
            Write-Host "  ✓ Found icon at: $path" -ForegroundColor Green
            $destPath = "$websiteAssets\images\icon.png"

            # Create directory if it doesn't exist
            $destDir = Split-Path $destPath -Parent
            if (-not (Test-Path $destDir)) {
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            }

            Copy-Item $path $destPath -Force
            Write-Host "  ✓ Copied to: $destPath" -ForegroundColor Green
            return $true
        }
    }

    Write-Host "  ⚠ No icon found automatically." -ForegroundColor Yellow
    Write-Host "  Please manually copy your app icon to:" -ForegroundColor Yellow
    Write-Host "  $websiteAssets\images\icon.png" -ForegroundColor White
    return $false
}

# Function to find and copy screenshots
function Find-AndCopyScreenshots {
    Write-Host "`n[2/2] Looking for screenshots..." -ForegroundColor Yellow

    # Common screenshot locations
    $screenshotSearchPaths = @(
        "$pillcheckrProject\screenshots",
        "$pillcheckrProject\fastlane\screenshots",
        "$pillcheckrProject\metadata\android\en-US\images\phoneScreenshots",
        "$pillcheckrProject\assets\screenshots",
        "$pillcheckrProject\docs\screenshots"
    )

    $foundScreenshots = $false

    foreach ($searchPath in $screenshotSearchPaths) {
        if (Test-Path $searchPath) {
            $screenshots = Get-ChildItem -Path $searchPath -Include *.png,*.jpg,*.jpeg -File | Select-Object -First 4

            if ($screenshots.Count -gt 0) {
                Write-Host "  ✓ Found $($screenshots.Count) screenshot(s) at: $searchPath" -ForegroundColor Green

                # Create destination directory
                $destDir = "$websiteAssets\screenshots"
                if (-not (Test-Path $destDir)) {
                    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
                }

                # Copy and rename screenshots
                for ($i = 0; $i -lt $screenshots.Count; $i++) {
                    $screenshot = $screenshots[$i]
                    $destPath = "$destDir\screenshot$($i + 1).png"
                    Copy-Item $screenshot.FullName $destPath -Force
                    Write-Host "  ✓ Copied: $($screenshot.Name) -> screenshot$($i + 1).png" -ForegroundColor Green
                }

                $foundScreenshots = $true
                break
            }
        }
    }

    if (-not $foundScreenshots) {
        Write-Host "  ⚠ No screenshots found automatically." -ForegroundColor Yellow
        Write-Host "  Please manually copy 4 screenshots to:" -ForegroundColor Yellow
        Write-Host "  $websiteAssets\screenshots\" -ForegroundColor White
        Write-Host "  Name them: screenshot1.png, screenshot2.png, screenshot3.png, screenshot4.png" -ForegroundColor White
    }

    return $foundScreenshots
}

# Execute
if (-not (Test-Path $pillcheckrProject)) {
    Write-Host "✗ PillCheckr project not found at: $pillcheckrProject" -ForegroundColor Red
    Write-Host "`nPlease update the path in this script or manually copy the assets:" -ForegroundColor Yellow
    Write-Host "  1. App icon -> $websiteAssets\images\icon.png" -ForegroundColor White
    Write-Host "  2. Screenshots (4) -> $websiteAssets\screenshots\screenshot1-4.png" -ForegroundColor White
} else {
    $iconCopied = Find-AndCopyIcon
    $screenshotsCopied = Find-AndCopyScreenshots

    Write-Host "`n====================================" -ForegroundColor Cyan
    Write-Host "Summary" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan

    if ($iconCopied) {
        Write-Host "✓ Icon copied successfully" -ForegroundColor Green
    } else {
        Write-Host "⚠ Icon needs manual copy" -ForegroundColor Yellow
    }

    if ($screenshotsCopied) {
        Write-Host "✓ Screenshots copied successfully" -ForegroundColor Green
    } else {
        Write-Host "⚠ Screenshots need manual copy" -ForegroundColor Yellow
    }

    Write-Host "`nThe HTML has been updated to use these images!" -ForegroundColor Green
    Write-Host "Visit: C:\Users\cwgru\work\GrubbyTech\apps\pillcheckr\index.html" -ForegroundColor Cyan
}

Write-Host ""
Read-Host "Press Enter to exit"

