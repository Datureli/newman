// balanceTests.js
const jsonData = pm.response.json();

pm.test('Sprawdź czy saldo (balance) istnieje', function () {
    pm.expect(jsonData.balance).to.exist;
});

pm.test('Saldo (balance) jest liczbą', function () {
    pm.expect(jsonData.balance).to.be.a('number');
});

pm.test('Saldo (balance) jest większe od zera', function () {
    pm.expect(jsonData.balance).to.be.greaterThan(0);
});

pm.test('Waluta jest poprawna', function () {
    pm.expect(jsonData.currency).to.equal('USD');
});

pm.test('Nagłówek Content-Type jest poprawny', function () {
    pm.expect(pm.response.headers.get('Content-Type')).to.include('application/json');
});

pm.test('Czas odpowiedzi jest poniżej 500ms', function () {
    pm.expect(pm.response.responseTime).to.be.below(500);
});
