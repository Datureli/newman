require('dotenv').config();
const newman = require('newman');
const fs = require('fs');

// Wczytanie kolekcji Postmana dla API logowania
const collectionLogin = require('../postman/User-login_api.json');

// Wczytanie skryptu testowego i pre-request script z pliku
const scriptContent = fs.readFileSync('./postman-test-scripts/loginTests/userLoginTests.js', 'utf-8');
const preRequestScriptContent = fs.readFileSync('./postman-test-scripts/loginTests/preRequestScript.js', 'utf-8');

// Dodanie Pre-request Script i testów do żądań w kolekcji
collectionLogin.item.forEach(item => {
    item.event = item.event || [];
    item.event.push({
        listen: 'prerequest',
        script: { exec: preRequestScriptContent.split('\n') }
    });

    item.event.push({
        listen: 'test',
        script: { exec: scriptContent.split('\n') }
    });

    item.request.header.push({
        key: "Authorization",
        value: "Bearer {{jwt_token}}",
        type: "text"
    });
});

// Ustawienie dynamicznego URL-u na podstawie zmiennych środowiskowych
collectionLogin.item.forEach(item => {
    item.request.url = {
        raw: `${process.env.LOGIN_API_URL}/${process.env.LOGIN_API_LOGIN_PATH}`,
        protocol: 'https',
        host: process.env.LOGIN_API_URL.replace('https://', '').split('.'),
        path: process.env.LOGIN_API_LOGIN_PATH.split('/')
    };
    console.log(`URL for ${item.name}: ${item.request.url.raw}`);
});

// Uruchomienie testów przez Newmana
newman.run({ collection: collectionLogin, reporters: 'cli' }, (err, summary) => {
    if (err) throw err;
    console.log('Testy logowania zostały zakończone.');
});
