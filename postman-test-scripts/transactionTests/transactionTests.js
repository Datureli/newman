const jsonData = pm.response.json();

pm.test('Sprawdź czy lista transakcji istnieje', () => {
    pm.expect(jsonData?.transactions).to.exist;
});

pm.test('Transakcje to tablica', () => {
    pm.expect(jsonData?.transactions).to.be.an('array');
});

pm.test('Każda transakcja ma pole amount', () => {
    jsonData?.transactions?.forEach(transaction => {
        pm.expect(transaction?.amount).to.exist;
    });
});

jsonData?.transactions?.forEach(transaction => {
    pm.test(`Transakcja ${transaction?.id} zawiera wszystkie wymagane pola`, () => {
        pm.expect(transaction).to.have.all.keys('id', 'amount', 'type', 'date');
    });

    pm.test(`Typ transakcji ${transaction?.id} jest poprawny`, () => {
        pm.expect(transaction?.type).to.satisfy(type => ['deposit', 'withdrawal'].includes(type));
    });
});

jsonData?.transactions?.forEach(transaction => {
    pm.test(`Data transakcji ${transaction?.id} jest poprawna`, () => {
        const transactionDate = new Date(transaction?.date);
        const isValidDate = !isNaN(transactionDate.getTime());
        pm.expect(isValidDate).to.be.true;
    });
});
