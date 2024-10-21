require('dotenv').config();
const newman = require('newman');
const fs = require('fs');
const path = require('path');

// Wczytanie kolekcji Postmana
const collection = require('./postman/Mock-bank_api.json');

// Wczytanie skryptów testowych
const scriptsDir = './postman-test-scripts';
const testFiles = fs.readdirSync(scriptsDir).filter(file => file.endsWith('.js'));

// Przypisanie skryptów do odpowiednich elementów w kolekcji
testFiles.forEach((file, index) => {
  const scriptContent = fs.readFileSync(path.join(scriptsDir, file), 'utf-8');
  collection.item[index].event = collection.item[index].event || [{ listen: 'test', script: { exec: [] } }];
  collection.item[index].event[0].script.exec = scriptContent.split('\n');
});

// Dynamiczne ustawienie URL-i z pliku .env
collection.item.forEach(item => {
  if (item.name === "Sprawdzenie salda") {
    item.request.url = {
      raw: `${process.env.MOCK_API_URL}/${process.env.MOCK_API_BALANCE_PATH}`,
      protocol: 'https',
      host: process.env.MOCK_API_URL.replace('https://', '').split('.'),
      path: process.env.MOCK_API_BALANCE_PATH.split('/')
    };
  } else if (item.name === "Historia transakcji") {
    item.request.url = {
      raw: `${process.env.MOCK_API_URL}/${process.env.MOCK_API_TRANSACTIONS_PATH}`,
      protocol: 'https',
      host: process.env.MOCK_API_URL.replace('https://', '').split('.'),
      path: process.env.MOCK_API_TRANSACTIONS_PATH.split('/')
    };
  }
});

// Debugging: Wyświetlenie przetworzonych URL-i
collection.item.forEach(item => {
  console.log(`URL for ${item.name}: ${item.request.url.raw}`);
});

// Uruchomienie testów przez Newmana
newman.run({ collection, reporters: 'cli' }, (err, summary) => {
  if (err) throw err;
  console.log('Testy zostały zakończone.');
});
