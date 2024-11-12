require('dotenv').config();
const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();
const port = 3000;

// Połączenie z bazą danych MySQL
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

connection.connect((err) => {
  if (err) throw err;
  console.log('Połączono z MySQL');
});

// Endpoint do serwowania statycznego pliku HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Endpoint, który zwraca dane w formacie JSON
app.get('/data.js', (req, res) => {
  const query = 'SELECT user_id, action, timestamp FROM user_activity';
  connection.query(query, (err, results) => {
    if (err) throw err;
    
    const script = `
      const table = document.getElementById("user-activity-table");
      const data = ${JSON.stringify(results)};
      data.forEach(row => {
        const tr = document.createElement("tr");
        tr.innerHTML = \`
          <td>\${row.user_id}</td>
          <td>\${row.action}</td>
          <td>\${row.timestamp}</td>
        \`;
        table.appendChild(tr);
      });
    `;
    res.setHeader('Content-Type', 'application/javascript');
    res.send(script);
  });
});

// Uruchomienie serwera
app.listen(port, () => {
  console.log(`Serwer działa na http://localhost:${port}`);
});
