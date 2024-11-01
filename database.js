import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

// Konfiguracja Supabase – zmień na swoje dane
const supabaseUrl = 'https://zpdgginjqniqouffzvuc.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

// Funkcja do dodania nowego użytkownika
const addUser = async (username, email) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .insert([{ username, email }])
      .select();

    if (error) {
      if (error.code === '23505') { // Obsługa błędu duplikatu
        console.error("User with this email already exists. Try updating instead.");
      } else {
        throw error;
      }
    } else {
      console.log("User added:", data);
    }
  } catch (error) {
    console.error("Error adding user:", error);
  }
};

// Funkcja do pobierania wszystkich użytkowników
const getUsers = async () => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('*');

    if (error) throw error;

    console.log("Users:", data);
  } catch (error) {
    console.error("Error fetching users:", error);
  }
};

// Funkcja do aktualizacji emaila użytkownika
const updateUser = async (id, newEmail) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .update({ email: newEmail })
      .eq('id', id)
      .select();

    if (error) throw error;

    console.log("User updated:", data);
  } catch (error) {
    console.error("Error updating user:", error);
  }
};

// Funkcja do usuwania użytkownika po ID
const deleteUser = async (id) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .delete()
      .eq('id', id)
      .select();

    if (error) throw error;

    console.log("User deleted:", data);
  } catch (error) {
    console.error("Error deleting user:", error);
  }
};

// Wywołanie funkcji do testów
(async () => {
  await addUser('janedoe', 'janedoe@example.com');  // Dodawanie użytkownika
  await getUsers();                                // Pobieranie wszystkich użytkowników
  await updateUser('49a86cd6-917c-4326-a6e3-e267b1f7fabd', 'newemail@example.com'); // Aktualizacja użytkownika po ID
  await deleteUser('3375b6ca-033d-4483-8dde-5abe09642585');                         // Usuwanie użytkownika po ID
})();
