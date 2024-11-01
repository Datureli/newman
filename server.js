// server.js
import express from 'express';
import { createClient } from '@supabase/supabase-js';

const app = express();
app.use(express.json());

const supabaseUrl = 'https://twoj-url.supabase.co';
const supabaseKey = 'twoj-klucz-api';
const supabase = createClient(supabaseUrl, supabaseKey);

// Endpoint do pobierania użytkowników
app.get('/api/users', async (req, res) => {
  const { data, error } = await supabase.from('users').select('*');
  if (error) return res.status(500).json({ error: error.message });
  res.json(data);
});

// Endpoint do dodania nowego użytkownika
app.post('/api/users', async (req, res) => {
  const { username, email } = req.body;
  const { data, error } = await supabase.from('users').insert([{ username, email }]);
  if (error) return res.status(500).json({ error: error.message });
  res.json(data);
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
