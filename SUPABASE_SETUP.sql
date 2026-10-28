-- PixelPort setup additions. Run in Supabase SQL Editor after the original cafes table exists.

-- Extra columns used by the current website form
alter table public.cafes add column if not exists pc_price numeric(10,2);
alter table public.cafes add column if not exists ps_price numeric(10,2);
alter table public.cafes add column if not exists vr_price numeric(10,2);

-- Owners can view their own submissions, including pending/rejected ones.
create policy "Owners can view their own cafe listings"
on public.cafes for select
to authenticated
using (owner_id = (select auth.uid()));

-- Create public-read photo bucket. Uploads are restricted to a folder named with the user's auth UID.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('cafe-photos', 'cafe-photos', true, 5242880, array['image/jpeg','image/png','image/webp','image/gif'])
on conflict (id) do update set public = true, file_size_limit = 5242880,
  allowed_mime_types = array['image/jpeg','image/png','image/webp','image/gif'];

create policy "Signed-in cafe owners upload photos to own folder"
on storage.objects for insert
to authenticated
with check (
  bucket_id = 'cafe-photos'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

create policy "Public can view cafe photos"
on storage.objects for select
using (bucket_id = 'cafe-photos');

-- NOTE: Do not create an admin account by changing website form fields.
-- Admin privileges should be assigned only by the project owner through a secure server-side process.
