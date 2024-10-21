require('dotenv').config();
const newman = require('newman');
const fs = require('fs');
const path = require('path');

// Wczytanie kolekcji Postmana dla API logowania
const collectionLogin = require('./postman/User-login_api.json');

// Wczytanie skryptów testowych
const scriptsDir = './postman-test-scripts/loginTests'; // Zmień na odpowiednią ścieżkę
const testFiles = fs.readdirSync(scriptsDir).filter(file => file.endsWith('.js'));

// Przypisanie skryptów do odpowiednich elementów w kolekcji
testFiles.forEach((file, index) => {
    const scriptContent = fs.readFileSync(path.join(scriptsDir, file), 'utf-8');
    collectionLogin.item[index].event = collectionLogin.item[index].event || [{ listen: 'test', script: { exec: [] } }];
    collectionLogin.item[index].event[0].script.exec = scriptContent.split('\n');
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
