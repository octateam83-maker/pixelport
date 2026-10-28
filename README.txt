PIXELPORT — SUPABASE-CONNECTED WEBSITE STARTER
Working brand name: PixelPort (can be renamed later).

Files:
- index.html: responsive frontend connected to Supabase Auth, database reads and café photo storage.
- manifest.json, sw.js, icon.svg: installable PWA foundation.
- SUPABASE_SETUP.sql: extra database columns, owner listing access, and photo bucket policies.

ALREADY CONFIGURED IN index.html
- Project URL: https://asohgmhcynujdgvtabjf.supabase.co
- Publishable key: browser-safe publishable key provided in chat.
Never put a Supabase secret/service_role key in frontend code.

NEXT STEPS
1. In Supabase SQL Editor, run SUPABASE_SETUP.sql once, after the initial cafes table SQL. If a policy already exists with the same name, do not repeatedly rerun blindly; check existing policies first.
2. Check Authentication > Sign In / Providers: Email is enabled.
3. Check Authentication > URL Configuration: Site URL is https://octateam83-maker.github.io and Redirect URL includes https://octateam83-maker.github.io/pixelport/ .
4. Upload the files from this folder to the ROOT of the existing GitHub repository https://github.com/octateam83-maker/pixelport (replace the existing index.html and README). Commit changes and wait for GitHub Pages deployment.
5. Test Create account with a test email. If email confirmation is enabled, confirm the email, then use Sign in.
6. Choose the Café Business role when creating a café-owner account. Sign in to that account before submitting a listing. Uploads are limited to 8 images, 5 MB each.
7. New listings are saved with status=pending and are not public until approved. Review/approve them in Supabase Table Editor by changing status to approved only after you verify the café. Never create admin privileges through client-side form fields.

LIMITATIONS
- The website does not yet include a secure in-site admin dashboard, player/team profile publishing, tournament management, password reset UI, or formal café identity verification.
- Demo cards shown on the site are examples, not verified businesses.
- The cafe-photos bucket is public-read so approved listing images can display; don't upload sensitive/private images.
- GitHub Pages is static hosting. Never store secret keys in frontend code.
