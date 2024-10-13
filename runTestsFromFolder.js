const newman = require('newman');
const fs = require('fs');
const path = require('path');
require('dotenv').config(); // Wczytuje zmienne środowiskowe z pliku .env

// Folder, z którego chcesz uruchomić wszystkie testy
const testFolder = './postman';

// Wyświetlenie zmiennych środowiskowych wczytanych z .env
console.log('MOCK_API_URL:', process.env.MOCK_API_URL);
console.log('MOCK_API_PATH:', process.env.MOCK_API_PATH);
console.log('TOKEN:', process.env.TOKEN);

// Znajdź wszystkie pliki JSON w folderze postman
fs.readdir(testFolder, (err, files) => {
    if (err) {
        return console.error('Wystąpił błąd podczas odczytywania folderu:', err);
    }

    // Filtruj tylko pliki .json
    const jsonFiles = files.filter(file => file.endsWith('.json'));

    if (jsonFiles.length === 0) {
        return console.log('Brak plików testowych do uruchomienia.');
    }

    // Uruchomienie każdego pliku za pomocą newman
    jsonFiles.forEach(file => {
        newman.run({
            collection: path.join(testFolder, file),
            environment: { // Ustawienie zmiennych środowiskowych z pliku .env
                values: [
                    { key: 'MOCK_API_URL', value: process.env.MOCK_API_URL, type: 'text' },
                    { key: 'MOCK_API_PATH', value: process.env.MOCK_API_PATH, type: 'text' },
                    { key: 'TOKEN', value: process.env.TOKEN, type: 'text' }
                ]
            },
            reporters: 'cli' // Dodajemy reporter CLI do wyświetlania szczegółów w konsoli
        }, (err, summary) => {
            if (err) {
                console.error(`Błąd podczas uruchamiania testu z pliku: ${file}`, err);
            } else {
                if (summary.run.failures.length) {
                    console.log(`Testy z pliku ${file} zakończone z błędami.`);
                    summary.run.failures.forEach(failure => {
                        console.error(failure.error.message);
                    });
                } else {
                    console.log(`Testy z pliku ${file} zakończone pomyślnie.`);
                }
            }
        });
    });
});
