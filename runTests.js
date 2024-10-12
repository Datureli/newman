require('dotenv').config();
const newman = require('newman');

newman.run({
    collection: require('./postman/Mock-bank_api.json'), // Upewnij się, że ścieżka do pliku JSON jest poprawna
    reporters: 'cli',
    environment: {
        "values": [
            {
                "key": "MOCK_API_URL",
                "value": process.env.MOCK_API_URL,
                "enabled": true
            }
        ]
    }
}, function (err) {
    if (err) { throw err; }
    console.log('Collection run complete!');
});
