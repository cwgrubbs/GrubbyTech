# Deploy SEO Updates to GrubbyTech

Write-Host "Deploying SEO Updates to GrubbyTech" -ForegroundColor Green
Write-Host ""

# Check if we're in a git repository
if (-not (Test-Path .git)) {
    Write-Host "ERROR: Not in a git repository. Please run this from the GrubbyTech directory." -ForegroundColor Red
    exit 1
}

Write-Host "Checking git status..." -ForegroundColor Cyan
git status --short

Write-Host ""
Write-Host "Files being deployed:" -ForegroundColor Cyan
Write-Host "  [NEW] robots.txt" -ForegroundColor Green
Write-Host "  [NEW] sitemap.xml" -ForegroundColor Green
Write-Host "  [NEW] _headers" -ForegroundColor Green
Write-Host "  [NEW] SEO_CHECKLIST.md" -ForegroundColor Green
Write-Host "  [UPDATED] index.html - Enhanced SEO meta tags" -ForegroundColor Yellow
Write-Host "  [UPDATED] apps/pillcheckr/index.html - Enhanced SEO" -ForegroundColor Yellow
Write-Host "  [UPDATED] apps/sleepdbn/index.html - Enhanced SEO" -ForegroundColor Yellow
Write-Host "  [UPDATED] README.md - SEO documentation" -ForegroundColor Yellow
Write-Host ""

$confirm = Read-Host "Do you want to commit and push these changes? (y/n)"
if ($confirm -ne 'y') {
    Write-Host "Deployment cancelled." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "Adding files to git..." -ForegroundColor Cyan
git add robots.txt sitemap.xml _headers SEO_CHECKLIST.md index.html apps/ README.md

Write-Host "Committing changes..." -ForegroundColor Cyan
git commit -m "feat: Add comprehensive SEO optimization

- Add robots.txt for search engine crawling
- Add sitemap.xml with all pages
- Add _headers file for Cloudflare Pages
- Enhance all pages with Open Graph and Twitter Cards
- Add structured data (Schema.org) to all pages
- Improve meta descriptions and keywords
- Add canonical URLs
- Update README with SEO setup instructions
- Add SEO_CHECKLIST.md for tracking"

Write-Host "Pushing to remote..." -ForegroundColor Cyan
git push

Write-Host ""
Write-Host "Deployment complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "  1. Verify your site is live at: https://grubbytech.com" -ForegroundColor White
Write-Host "  2. Check robots.txt: https://grubbytech.com/robots.txt" -ForegroundColor White
Write-Host "  3. Check sitemap.xml: https://grubbytech.com/sitemap.xml" -ForegroundColor White
Write-Host "  4. Submit to Google Search Console: https://search.google.com/search-console" -ForegroundColor White
Write-Host "  5. Submit to Bing Webmaster Tools: https://www.bing.com/webmasters" -ForegroundColor White
Write-Host ""
Write-Host "See SEO_CHECKLIST.md for detailed instructions!" -ForegroundColor Cyan
Write-Host ""

