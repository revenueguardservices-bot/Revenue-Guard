# Deploying Revenue Guard on Vercel (Next.js)

## Project is ready to deploy

- **Framework:** Next.js 14
- **Build:** `npm run build` (tested and passing)
- **Output:** Static + server-rendered as needed

## Steps to deploy on Vercel

1. **Push your code to GitHub**  
   Ensure your repo has the latest code (including `vercel.json`, `package.json`, `app/`, `public/`, etc.).

2. **Import on Vercel**  
   - Go to [vercel.com](https://vercel.com) → **Add New** → **Project**.  
   - Import your GitHub repository.  
   - **Root Directory:** Leave blank if `package.json` is in the repo root. If your project lives in a subfolder (e.g. `revenue-guard/`), set **Root Directory** to that folder (e.g. `revenue-guard`).  
   - Vercel will detect Next.js from `vercel.json` and `package.json`.

3. **Environment variables (optional)**  
   If you use EmailJS for the “Free Pricing Review” form, add in Vercel → Project → **Settings** → **Environment Variables**:
   - `NEXT_PUBLIC_EMAILJS_SERVICE_ID`
   - `NEXT_PUBLIC_EMAILJS_TEMPLATE_ID`
   - `NEXT_PUBLIC_EMAILJS_PUBLIC_KEY`  
   If these are not set, the form falls back to opening the user’s email client (`mailto:`).

4. **Deploy**  
   Click **Deploy**. Vercel will run `npm install` and `npm run build` and then deploy.

## After deployment

- Your site will be available at `https://your-project.vercel.app` (or your custom domain).  
- The build has been verified locally; the same build runs on Vercel.
