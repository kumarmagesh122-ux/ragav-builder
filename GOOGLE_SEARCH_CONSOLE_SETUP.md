# Google Search Console & SEO Deployment Guide
**Project:** RAGAV BUILDERS — Krishnagiri, Tamil Nadu  
**Target Domain:** `https://ragavbuilder.vercel.app` (or your custom domain)

---

## 1. What Has Been Added to Your Project

### A. Search Console & Crawler Assets
1. **`sitemap.xml`** (Created in root and `/RAGAV_BUILDERS_Scroll_Prototype`):
   - Tells Googlebot and Bingbot all primary URLs and page anchors (`#services`, `#waterproofing`, `#process`, `#faq`, `#contact`).
   - Includes official brand image metadata for Google Images indexing.
2. **`robots.txt`** (Created in root and `/RAGAV_BUILDERS_Scroll_Prototype`):
   - Allows all search crawlers to index the full website (`Allow: /`).
   - Declares the sitemap location: `https://ragavbuilder.vercel.app/sitemap.xml`.
3. **HTML Verification Meta Tag**:
   - `<meta name="google-site-verification" content="GSC_VERIFICATION_TOKEN_REPLACE_HERE">` is placed in `<head>`.

### B. On-Page SEO & Structured Data (JSON-LD)
1. **Optimized Meta Title & Description**:
   - **Title**: `RAGAV BUILDERS | Best Builders & Construction Company in Krishnagiri`
   - **Description**: `Looking for reliable builders in Krishnagiri? RAGAV BUILDERS offers turnkey house construction, 2D Vastu plans, 3D elevations, interior design, building blueprints & approvals, and 10-year certified waterproofing.`
2. **Comprehensive Keyword Bank**:
   - Injected into meta keywords, section headings, and the new **FAQ Section** (`#faq`).
   - Covers: Core construction, 2D Vastu plans, 3D elevations, interior design, blueprints & DTCP approvals, 10-year waterproofing, and regional targets (Bargur, Kaveripattinam, Hosur, Pochampalli, Shoolagiri, Bayanapalli).
3. **LocalBusiness & FAQPage Schema.org Structured Data**:
   - Injected into `<head>` with full business details (Address: District Stadium Road, Krishnagiri; Phone: `+91 86674 61459`; 6 core services catalogue; 6 FAQ question-answer entities).
   - This makes your website eligible for **Google Rich Snippets** (Expandable FAQ accordions right on the Google search results page).

---

## 2. Step-by-Step: Submitting to Google Search Console

### Step 1: Push Changes to GitHub & Vercel
Double-click and run:
```bat
push_to_github.bat
```
This automatically syncs `sitemap.xml`, `robots.txt`, and the SEO-enhanced `index.html` to your GitHub repo, triggering an automatic Vercel production build.

---

### Step 2: Open Google Search Console
1. Go to [Google Search Console](https://search.google.com/search-console/).
2. Sign in with your Google account (e.g. `ragavbuilder2066@gmail.com`).
3. Click **Add Property**.
4. In the **URL prefix** box, enter your live Vercel URL (e.g., `https://ragavbuilder.vercel.app/`) and click **Continue**.

---

### Step 3: Verify Ownership
Choose one of these easy methods:

#### Method A: HTML Tag (Easiest)
1. Under **Other verification methods**, click **HTML tag**.
2. Copy the code provided by Google (it looks like `<meta name="google-site-verification" content="abcdef123456..." />`).
3. Copy the string inside `content="..."` (e.g. `abcdef123456...`).
4. Replace `GSC_VERIFICATION_TOKEN_REPLACE_HERE` in `index.html` and `RAGAV_BUILDERS_Scroll_Prototype/index.html` with that code.
5. Run `push_to_github.bat` once more.
6. Click **Verify** in Google Search Console!

#### Method B: HTML File Upload
1. Download the verification file from Google (e.g., `google1234567890abcdef.html`).
2. Place it into both your project root and `RAGAV_BUILDERS_Scroll_Prototype/` folders.
3. Run `push_to_github.bat`.
4. Click **Verify** in Google Search Console!

---

### Step 4: Submit Your Sitemap
1. In the Search Console left sidebar, click **Sitemaps**.
2. Under **Add a new sitemap**, type:
   ```
   sitemap.xml
   ```
3. Click **Submit**.
4. Google will immediately queue your website for crawling and show Status: **Success**.

---

## 3. How to Test Your Rich Results Schema
1. Visit [Google Rich Results Test](https://search.google.com/test/rich-results).
2. Enter your URL: `https://ragavbuilder.vercel.app/`.
3. You will see green checkmarks for:
   - **LocalBusiness / GeneralContractor**
   - **FAQPage** (enables rich dropdown answers directly in Google search results).
