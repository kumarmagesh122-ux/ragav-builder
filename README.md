# RAGAV BUILDERS — Premium Architectural & Turnkey Construction Website

Official website and digital engineering consultation platform for **RAGAV BUILDERS** (Krishnagiri, Tamil Nadu).

## 🌟 Key Features
- **Cinematic Scrollytelling Architecture**: Seamless dual-group background video scrubbing and frame renderer.
- **Construction Cost & Duration Calculator**: Interactive Indian cost estimator with live sq. ft. calculation, category selection (Standard, Premium, Luxury), timeline forecasting, and PDF quotation generation.
- **Engineering Consultation Desk**:
  - Live Supabase Cloud Database integration (`public.enquiries`).
  - Automated FormSubmit email delivery to `mageshbmw13@gmail.com`.
  - Instant WhatsApp alert dispatch to `+91 80723 41848`.
  - Direct 1-click Gmail Web compose backup.
- **Grand Luxury Brand Footer**: Custom architectural theme with watermark-free villa view, core service links, and registered company credentials.
- **100% Mobile & Desktop Responsive**: Tailored layouts for mobile, tablet, and widescreen viewports.

---

## 🚀 Live Deployment Options

### 1. Vercel (Recommended)
1. Import this GitHub repository into [Vercel](https://vercel.com).
2. The project is pre-configured with `vercel.json` and deploys automatically with zero configuration.

### 2. Netlify
1. Connect this repository to [Netlify](https://netlify.com).
2. The pre-configured `netlify.toml` sets the publish directory to `RAGAV_BUILDERS_Scroll_Prototype`.

### 3. GitHub Pages
1. Go to repository **Settings** → **Pages**.
2. Select **Source: Deploy from a branch** → Branch: `main` / `root`.
3. The root `index.html` automatically forwards visitors directly to the main application.

---

## 🗄️ Database Setup (Supabase)
Run the SQL script located in `supabase_schema.sql` inside your Supabase SQL Editor:
- Creates the `public.enquiries` table
- Enables Row Level Security (RLS)
- Grants public insert permissions for anonymous website visitors
- Restricts full management permissions to authenticated administrators

---

## 📞 Official Contact
- **Office**: District Stadium Road, Near Sandhiya College, Krishnagiri, Tamil Nadu.
- **Hotline / Direct**: +91 80723 41848
- **Email**: mageshbmw13@gmail.com
- **Website Prototype**: `RAGAV_BUILDERS_Scroll_Prototype/index.html`
