const mysql = require('mysql2');
const bcrypt = require('bcrypt');

// Konfiguracja połączenia z bazą danych
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'your_username',
  password: 'your_password',
  database: 'my_database'
});

// Funkcja do hashowania i dodawania użytkownika
async function addUser(username, password, role) {
  try {
    // Hashowanie hasła
    const hashedPassword = await bcrypt.hash(password, 10); // 10 to liczba rund solenia bcrypt
    const token = null; // przykładowa wartość tokena, można ją wygenerować inaczej
    
    // Zapis użytkownika do bazy danych
    const query = `INSERT INTO users (username, password, token, role) VALUES (?, ?, ?, ?)`;
    connection.execute(query, [username, hashedPassword, token, role], (err, results) => {
      if (err) {
        console.error('Błąd przy dodawaniu użytkownika:', err);
      } else {
        console.log('Dodano użytkownika:', results);
      }
    });
  } catch (err) {
    console.error('Błąd hashowania hasła:', err);
  }
}

// Przykładowe wywołanie funkcji
addUser('john_doe', '1234', 'admin');
