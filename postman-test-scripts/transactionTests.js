// transactionTests.js
const jsonData = pm.response.json();

pm.test('Sprawdź czy lista transakcji istnieje', function () {
    pm.expect(jsonData.transactions).to.exist;
});

pm.test('Transakcje to tablica', function () {
    pm.expect(jsonData.transactions).to.be.an('array');
});

pm.test('Każda transakcja ma pole amount', function () {
    jsonData.transactions.forEach(function (transaction) {
        pm.expect(transaction.amount).to.exist;
    });
});

jsonData.transactions.forEach(function (transaction) {
    pm.test(`Transakcja ${transaction.id} zawiera wszystkie wymagane pola`, function () {
        pm.expect(transaction).to.have.all.keys('id', 'amount', 'type', 'date');
    });
    pm.test(`Typ transakcji ${transaction.id} jest poprawny`, function () {
        pm.expect(transaction.type).to.satisfy(type => ['deposit', 'withdrawal'].includes(type));
    });
});

jsonData.transactions.forEach(function (transaction) {
    pm.test(`Data transakcji ${transaction.id} jest poprawna`, function () {
        const transactionDate = new Date(transaction.date);
        const isValidDate = !isNaN(transactionDate.getTime());
        pm.expect(isValidDate).to.be.true;
    });
});
