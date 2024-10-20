const jsonData = pm.response.json();

pm.test('Sprawdź, czy saldo (balance) istnieje', () => {
    pm.expect(jsonData?.accounts?.[0]?.balance).to.exist;
});

pm.test('Saldo (balance) jest liczbą', () => {
    pm.expect(jsonData?.accounts?.[0]?.balance).to.be.a('number');
});

pm.test('Saldo (balance) jest większe od zera', () => {
    pm.expect(jsonData?.accounts?.[0]?.balance).to.be.greaterThan(0);
});

pm.test('Waluta jest poprawna', () => {
    pm.expect(jsonData?.accounts?.[0]?.currency).to.equal('USD');
});

pm.test('Nagłówek Content-Type jest poprawny', () => {
    pm.expect(pm.response.headers.get('Content-Type')).to.include('application/json');
});

pm.test('Czas odpowiedzi jest poniżej 500ms', () => {
    pm.expect(pm.response.responseTime).to.be.below(500);
});
