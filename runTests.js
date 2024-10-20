require('dotenv').config(); // Wczytuje zmienne z .env
const newman = require('newman'); // Ładuje Newmana
const fs = require('fs');

// Wczytaj kod testowy z pliku balanceTests.js
const balanceTestsScript = fs.readFileSync('./balanceTests.js', 'utf-8');
const transactionTestsScript = fs.readFileSync('./transactionTests.js', 'utf-8');

// Wczytaj kolekcję Postmana
const collection = require('./postman/Mock-bank_api.json');

// Dodaj sekcję 'event' i 'script' do requestu "Sprawdzenie salda", jeśli nie istnieje
if (!collection.item[0].event) {
    collection.item[0].event = [{ listen: 'test', script: { exec: [] } }];
}

// Przypisz kod testowy z pliku balanceTests.js
collection.item[0].event[0].script.exec = balanceTestsScript.split('\n'); // Dodaj kod do pierwszego requestu

// Dodaj sekcję 'event' i 'script' do requestu "Historia transakcji", jeśli nie istnieje
if (!collection.item[1].event) {
    collection.item[1].event = [{ listen: 'test', script: { exec: [] } }];
}

// Przypisz kod testowy z pliku transactionTests.js
collection.item[1].event[0].script.exec = transactionTestsScript.split('\n'); // Dodaj kod do drugiego requestu

// Uruchomienie Newmana z dynamicznymi zmiennymi
newman.run({
    collection: collection, // Użyj zaktualizowanej kolekcji
    reporters: 'cli',
    environment: {
        "values": [
            {
                "key": "MOCK_API_URL",
                "value": process.env.MOCK_API_URL, // Pobieranie z .env
                "enabled": true
            },
            {
                "key": "MOCK_API_PATH",
                "value": process.env.MOCK_API_PATH, // Pobieranie z .env
                "enabled": true
            },
            {
                "key": "TOKEN",
                "value": process.env.TOKEN, // Pobieranie z .env
                "enabled": true
            }
        ]
    }
}, function (err, summary) {
    if (err) { throw err; }
    console.log('Testy zostały zakończone.');
});
