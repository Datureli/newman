require('dotenv').config();
const newman = require('newman');
const fs = require('fs');
const path = require('path');

const collection = require('./postman/Mock-bank_api.json');

const scriptsDir = './postman-test-scripts';
const testFiles = fs.readdirSync(scriptsDir).filter(file => file.endsWith('.js'));

testFiles.forEach((file, index) => {
    const scriptContent = fs.readFileSync(path.join(scriptsDir, file), 'utf-8');

    if (!collection.item[index].event) {
        collection.item[index].event = [{ listen: 'test', script: { exec: [] } }];
    }

    collection.item[index].event[0].script.exec = scriptContent.split('\n');
});

collection.item.forEach((item, index) => {
    const apiUrl = `${process.env.MOCK_API_URL}/v3/${item.request.url.raw.split('/').pop()}`;
    item.request.url.raw = apiUrl;
});

newman.run(
    {
        collection: collection,
        reporters: 'cli',
    },
    function (err, summary) {
        if (err) {
            throw err;
        }
        console.log('Testy zostały zakończone.');
    }
);
