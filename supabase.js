import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://<your_project_ref>.supabase.co';
const supabaseKey = '<your_public_anon_key>';
const supabase = createClient(supabaseUrl, supabaseKey);
