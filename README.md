# GrubbyTech - Small Studio, Big Apps

Professional website for GrubbyTech, showcasing our cross-platform applications.

## 🚀 Featured Apps

### PillCheckr
**AI-Powered Pill Identification**
- Available on [Google Play Store](https://play.google.com/store/apps/details?id=com.grubbytech.pillcheckr)
- Coming soon to iOS
- [Learn more](apps/pillcheckr/)

### SleepDBN
**Deep Brown Noise Generator**
- Coming soon to Android and iOS
- [Learn more](apps/sleepdbn/)

## 📁 Project Structure

```
GrubbyTech/
├── index.html              # Main landing page
├── apps/
│   ├── pillcheckr/        # PillCheckr app page
│   │   ├── assets/        # Icons and screenshots
│   │   └── index.html
│   └── sleepdbn/          # SleepDBN app page
│       ├── assets/        # Icons and screenshots
│       └── index.html
├── ASSETS_SETUP.md        # Guide for adding app assets
├── IMPLEMENTATION_SUMMARY.md  # Implementation details
├── copy-assets.ps1        # PowerShell script to copy assets
└── README.md              # This file
```

## 🎨 Design Features

- **Modern, Professional Design**: Gradient backgrounds, smooth animations, and responsive layout
- **Mobile-First**: Fully responsive design that works on all devices
- **Static Site**: No backend required - host for free on GitHub Pages, Netlify, or Vercel
- **SEO Optimized**: Proper meta tags and semantic HTML
- **Fast Loading**: Optimized for performance

## 🛠️ Setup & Deployment

### SEO Setup & Google Search Console

**SEO Files Included:**
- ✅ `robots.txt` - Allows search engines to crawl all pages
- ✅ `sitemap.xml` - Helps search engines discover all pages
- ✅ `_headers` - Security and caching headers for Cloudflare Pages
- ✅ Comprehensive meta tags (Open Graph, Twitter Cards, structured data)

**To Get Your Site Indexed by Google:**

1. **Submit to Google Search Console:**
   - Go to [Google Search Console](https://search.google.com/search-console)
   - Click "Add Property"
   - Enter your domain: `grubbytech.com`
   - Verify ownership (DNS or HTML file method)

2. **Submit Your Sitemap:**
   - In Search Console, go to "Sitemaps"
   - Submit: `https://grubbytech.com/sitemap.xml`
   - Google will start crawling within 24-48 hours

3. **Request Indexing:**
   - In Search Console, use "URL Inspection" tool
   - Enter: `https://grubbytech.com`
   - Click "Request Indexing" to expedite the process
   - Repeat for your app pages:
     - `https://grubbytech.com/apps/pillcheckr/`
     - `https://grubbytech.com/apps/sleepdbn/`

4. **Submit to Bing:**
   - Go to [Bing Webmaster Tools](https://www.bing.com/webmasters)
   - Import from Google Search Console or add manually
   - Submit sitemap

5. **Build Backlinks:**
   - Share your site on social media
   - Add your site to app directories
   - Link from your GitHub profile
   - Add to relevant forums or communities

**Expected Timeline:**
- Google may take 1-7 days to index your homepage
- Full site indexing typically takes 1-2 weeks
- Rankings improve over time with content and backlinks

### Adding Your App Assets

1. **Run the automated script:**
   ```powershell
   .\copy-assets.ps1
   ```

2. **Or manually copy assets** following instructions in `ASSETS_SETUP.md`

### Local Development

Simply open `index.html` in a web browser. No build process required!

### Deploy to GitHub Pages

1. Push to GitHub
2. Go to Settings → Pages
3. Select source branch
4. Your site will be live at `https://yourusername.github.io/GrubbyTech/`

### Deploy to Netlify

1. Connect your GitHub repository
2. Netlify will auto-deploy (no build command needed)
3. Set up custom domain if desired

## 📝 Implementation Status

✅ Main landing page with Apps section  
✅ PillCheckr page with Google Play link  
✅ SleepDBN page with Coming Soon badges  
✅ Screenshot placeholders (ready for real images)  
✅ Asset directories created  
✅ Responsive design  
✅ Modern UI/UX  
✅ SEO meta tags  

📋 Next Steps:
- Add real app screenshots
- Add app icons
- Optimize images for web
- Set up analytics (optional)
- Add more content (testimonials, FAQs, etc.)

## 📧 Contact

- **Email**: support@grubbytech.com
- **GitHub**: [@cwgrubbs](https://github.com/cwgrubbs)

## 📄 License

See [LICENSE](LICENSE) file for details.

---

**Last Updated**: January 5, 2026  
**Status**: Ready for deployment ✅ Website

Small Studio, Big Apps - Cross-platform app development

## Structure

```
GrubbyTech/
├── index.html                          # Main portfolio page
├── apps/                               # App-specific pages
│   ├── pillcheckr/
│   │   ├── index.html                  # PillCheckr app page
│   │   ├── privacy-policy.html         # Privacy policy (HTML)
│   │   └── privacy-policy.md           # Privacy policy (Markdown)
│   └── sleepdbn/
│       └── index.html                  # SleepDBN app page
├── LICENSE
└── README.md
```

## Apps

### PillCheckr 💊
AI-powered pill identification app using OCR and manual search capabilities.

**Features:**
- OCR image recognition for pill identification
- Manual search by imprint, color, and shape
- Confidence ratings for accuracy
- Comprehensive drug reference data

**Pages:**
- Main: `/apps/pillcheckr/index.html`
- Privacy Policy: `/apps/pillcheckr/privacy-policy.html`

### SleepDBN 🌙
Deep Brown Noise Generator for better sleep and relaxation.

**Features:**
- Deep brown noise generation
- Customizable audio profiles
- Sleep timer with fade out
- Offline playback support

**Page:**
- Main: `/apps/sleepdbn/index.html`

## Development

This is a static website hosted on GitHub Pages. All pages are responsive and mobile-friendly.

## Contact

- Email: support@grubbytech.com
- GitHub: [@cwgrubbs](https://github.com/cwgrubbs)

## License

© 2026 GrubbyTech. All rights reserved.

Landing page.
