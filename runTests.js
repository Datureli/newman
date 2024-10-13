require('dotenv').config(); // Ładuje zmienne z pliku .env
const newman = require('newman');

// Uruchamianie kolekcji Postmana, dynamicznie wstawiając URL API
newman.run({
    collection: require('./postman/Mock-bank_api.json'), // Ścieżka do twojej kolekcji
    environment: {
        values: [
            { key: 'MOCK_API_URL', value: process.env.MOCK_API_URL },
            { key: 'TOKEN', value: process.env.TOKEN }
        ]
    }
}, function (err, summary) {
    if (err) {
        throw err;
    }
    console.log('Testy zakończone.');
});
