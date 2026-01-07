# SEO Validation Script
# This script checks all SEO elements are properly implemented

Write-Host "GrubbyTech SEO Validation" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""

$allGood = $true

# Check if critical files exist
Write-Host "Checking SEO Files..." -ForegroundColor Cyan

$files = @{
    "robots.txt" = "Allows search engines to crawl"
    "sitemap.xml" = "Sitemap for search engines"
    "_headers" = "Security and caching headers"
    "_redirects" = "URL redirect rules"
    "index.html" = "Main homepage"
    "apps/pillcheckr/index.html" = "PillCheckr page"
    "apps/sleepdbn/index.html" = "SleepDBN page"
}

foreach ($file in $files.Keys) {
    if (Test-Path $file) {
        Write-Host "  [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "  [FAIL] $file - MISSING!" -ForegroundColor Red
        $allGood = $false
    }
}

Write-Host ""
Write-Host "Checking Meta Tags..." -ForegroundColor Cyan

# Function to check meta tags in HTML file
function Check-MetaTags {
    param($filePath, $pageName)

    Write-Host "  Checking $pageName..." -ForegroundColor White

    if (-not (Test-Path $filePath)) {
        Write-Host "    [FAIL] File not found!" -ForegroundColor Red
        return $false
    }

    $content = Get-Content $filePath -Raw
    $hasIssues = $false

    # Check for essential meta tags
    $checks = @{
        '<meta name="description"' = "Description tag"
        '<meta name="keywords"' = "Keywords tag"
        '<meta property="og:title"' = "Open Graph title"
        '<meta property="og:description"' = "Open Graph description"
        '<meta property="og:image"' = "Open Graph image"
        '<meta property="twitter:card"' = "Twitter Card"
        '<link rel="canonical"' = "Canonical URL"
        'application/ld+json' = "Structured Data (JSON-LD)"
    }

    foreach ($tag in $checks.Keys) {
        if ($content -match [regex]::Escape($tag)) {
            Write-Host "    [OK] $($checks[$tag])" -ForegroundColor Green
        } else {
            Write-Host "    [FAIL] $($checks[$tag]) - MISSING!" -ForegroundColor Red
            $hasIssues = $true
        }
    }

    Write-Host ""
    return -not $hasIssues
}

# Check each page
$mainPage = Check-MetaTags "index.html" "Main Page"
$pillcheckr = Check-MetaTags "apps/pillcheckr/index.html" "PillCheckr"
$sleepdbn = Check-MetaTags "apps/sleepdbn/index.html" "SleepDBN"

if (-not ($mainPage -and $pillcheckr -and $sleepdbn)) {
    $allGood = $false
}

Write-Host "Checking Sitemap..." -ForegroundColor Cyan
if (Test-Path "sitemap.xml") {
    $sitemap = Get-Content "sitemap.xml" -Raw

    # Check if all pages are in sitemap
    $pages = @(
        "https://grubbytech.com/",
        "https://grubbytech.com/apps/pillcheckr/",
        "https://grubbytech.com/apps/sleepdbn/"
    )

    foreach ($page in $pages) {
        if ($sitemap -match [regex]::Escape($page)) {
            Write-Host "  [OK] $page in sitemap" -ForegroundColor Green
        } else {
            Write-Host "  [FAIL] $page NOT in sitemap!" -ForegroundColor Red
            $allGood = $false
        }
    }
}
Write-Host ""

Write-Host "Checking robots.txt..." -ForegroundColor Cyan
if (Test-Path "robots.txt") {
    $robots = Get-Content "robots.txt" -Raw
    if ($robots -match "Allow: /") {
        Write-Host "  [OK] robots.txt allows crawling" -ForegroundColor Green
    } else {
        Write-Host "  [WARN] robots.txt may block search engines" -ForegroundColor Yellow
    }

    if ($robots -match "Sitemap:") {
        Write-Host "  [OK] Sitemap referenced in robots.txt" -ForegroundColor Green
    } else {
        Write-Host "  [FAIL] Sitemap not referenced in robots.txt!" -ForegroundColor Red
        $allGood = $false
    }
}
Write-Host ""

Write-Host "================================" -ForegroundColor Green
if ($allGood) {
    Write-Host "SUCCESS: All SEO checks passed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your site is SEO-ready!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Deploy these changes" -ForegroundColor White
    Write-Host "  2. Submit to Google Search Console" -ForegroundColor White
    Write-Host "  3. Submit to Bing Webmaster Tools" -ForegroundColor White
    Write-Host "  4. See SEO_CHECKLIST.md for details" -ForegroundColor White
} else {
    Write-Host "FAILED: Some SEO checks failed!" -ForegroundColor Red
    Write-Host "Please fix the issues above before deploying." -ForegroundColor Yellow
}
Write-Host ""

