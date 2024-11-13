const fs = require('fs');
const path = require('path');

const testsDir = path.join(__dirname, 'sql-tests', 'tests');

// Monitoruj katalog 'tests' w poszukiwaniu nowych folderów
fs.watch(testsDir, (eventType, filename) => {
  if (eventType === 'rename' && filename) {
    const folderPath = path.join(testsDir, filename);

    // Sprawdza, czy nowy element to folder
    if (fs.existsSync(folderPath) && fs.lstatSync(folderPath).isDirectory()) {
      const newFilePath = path.join(folderPath, `${filename}_test.sql`);

      // Generuje plik SQL z podstawową strukturą, jeśli jeszcze nie istnieje
      if (!fs.existsSync(newFilePath)) {
        fs.writeFileSync(newFilePath, '-- Nowy plik testowy SQL dla modułu ' + filename + '\n');
        console.log(`Utworzono nowy plik: ${newFilePath}`);
      }
    }
  }
});

console.log('Monitorowanie folderu tests... ');
