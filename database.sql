-- Create bookings table
CREATE TABLE bookings (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  name text NOT NULL,
  email text NOT NULL,
  phone text,
  journey text,
  message text
);

-- Create testimonials table
CREATE TABLE testimonials (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  name text NOT NULL,
  location text NOT NULL,
  message text NOT NULL,
  is_approved boolean DEFAULT false
);

-- Allow anonymous inserts for website visitors (RLS policies)
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE testimonials ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous inserts for bookings" ON bookings FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Allow anonymous inserts for testimonials" ON testimonials FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Allow anonymous reads for approved testimonials" ON testimonials FOR SELECT TO anon USING (is_approved = true);
