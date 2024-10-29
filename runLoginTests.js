require('dotenv').config();
const newman = require('newman');
const fs = require('fs');
const path = require('path');

// Wczytanie kolekcji Postmana dla API logowania
const collectionLogin = require('./postman/User-login_api.json');

// Wczytanie jednego pliku ze skryptami testowymi
const scriptContent = fs.readFileSync('./postman-test-scripts/loginTests/userLoginTests.js', 'utf-8');

// Przypisanie skryptu do wszystkich elementów w kolekcji
collectionLogin.item.forEach(item => {
    item.event = item.event || [{ listen: 'test', script: { exec: [] } }];
    item.event[0].script.exec = scriptContent.split('\n');
});

// Dynamiczne ustawienie URL-i z pliku .env
collectionLogin.item.forEach(item => {
    item.request.url = {
        raw: `${process.env.LOGIN_API_URL}/${process.env.LOGIN_API_LOGIN_PATH}`,
        protocol: 'https',
        host: process.env.LOGIN_API_URL.replace('https://', '').split('.'),
        path: process.env.LOGIN_API_LOGIN_PATH.split('/')
    };
});

// Debugging: Wyświetlenie przetworzonych URL-i
collectionLogin.item.forEach(item => {
    console.log(`URL for ${item.name}: ${item.request.url.raw}`);
});

// Uruchomienie testów przez Newmana
newman.run({ collection: collectionLogin, reporters: 'cli' }, (err, summary) => {
    if (err) throw err;
    console.log('Testy logowania zostały zakończone.');
});
