const express = require('express');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const axios = require('axios'); // Użyj axios, aby pobierać dane z API

const app = express();
const PORT = 3000;
const secretKey = 'v3/a22eba96-995a-4b56-a623-9abf090eb412'; // Zmień to na bardziej skomplikowany klucz w produkcji

app.use(bodyParser.json());

// Endpoint logowania
app.post('/login', async (req, res) => {
    const { username, password } = req.body;

    try {
        // Pobieranie danych użytkowników z Twojego API
        const response = await axios.get('URL_DO_TWOJEGO_API'); // Podaj URL do API, które zwraca użytkowników
        const users = response.data.users; // Zakładam, że odpowiedź ma strukturę JSON z kluczem "users"

        // Wyszukiwanie użytkownika
        const user = users.find(u => u.username === username && u.password === password);
        if (!user) return res.status(401).send('Nieprawidłowe dane logowania');

        // Generowanie tokenu JWT
        const token = jwt.sign({ id: user.id, username: user.username }, secretKey, { expiresIn: '1h' });
        res.json({ token });
    } catch (error) {
        console.error(error);
        res.status(500).send('Wystąpił błąd serwera');
    }
});

// Middleware do weryfikacji tokenu
function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; // Token powinien być w formacie "Bearer <token>"

    if (!token) return res.sendStatus(401); // Jeśli token nie jest dostępny

    jwt.verify(token, secretKey, (err, user) => {
        if (err) return res.sendStatus(403); // Jeśli token jest nieprawidłowy
        req.user = user; // Zapisanie użytkownika w obiekcie żądania
        next(); // Kontynuowanie do następnego middleware
    });
}

// Przykładowa chroniona trasa
app.get('/protected', authenticateToken, (req, res) => {
    res.json({ message: 'To jest chroniona trasa, dostępna tylko dla zalogowanych użytkowników.', user: req.user });
});

// Uruchomienie serwera
app.listen(PORT, () => {
    console.log(`Serwer działa na http://localhost:${PORT}`);
});
