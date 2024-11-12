const express = require('express');
const mysql = require('mysql');

// Konfiguracja aplikacji Express
const app = express();
const port = 3000;

// Połączenie z bazą danych MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',  // zmień na nazwę użytkownika MySQL
  password: 'misio11',  // zmień na hasło do MySQL
  database: 'my_database'    // zmień na nazwę bazy danych
});

// Sprawdzenie połączenia
connection.connect((err) => {
  if (err) throw err;
  console.log('Połączono z MySQL');
});

// Ścieżka główna
app.get('/', (req, res) => {
  const query = 'SELECT user_id, action, timestamp FROM user_activity';
  connection.query(query, (err, results) => {
    if (err) throw err;

    // Generowanie HTML
    let html = `
      <html>
      <head>
        <title>Aktywność Użytkowników</title>
        <style>
          table { width: 50%; margin: auto; border-collapse: collapse; }
          th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2 style="text-align: center;">Lista Aktywności Użytkowników</h2>
        <table>
          <tr>
            <th>User ID</th>
            <th>Akcja</th>
            <th>Timestamp</th>
          </tr>`;

    // Iteracja po wynikach i dodanie ich do tabeli HTML
    results.forEach(row => {
      html += `
          <tr>
            <td>${row.user_id}</td>
            <td>${row.action}</td>
            <td>${row.timestamp}</td>
          </tr>`;
    });

    html += `
        </table>
      </body>
      </html>`;

    // Wyświetlenie HTML
    res.send(html);
  });
});

// Uruchomienie serwera na porcie 3000
app.listen(port, () => {
  console.log(`Serwer działa na http://localhost:${port}`);
});
