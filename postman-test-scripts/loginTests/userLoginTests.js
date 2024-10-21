pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Znaleziono użytkownika", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.users).to.be.an('array').that.is.not.empty; // Sprawdza, czy tablica użytkowników nie jest pusta
    pm.expect(jsonData.users[0].username).to.eql("john_doe"); // Sprawdza, czy pierwszy użytkownik to john_doe
});

pm.test("Nie ma tokenu", function () {
    pm.expect(pm.response.json()).to.not.have.property('token'); // Sprawdza, czy nie ma tokenu
});
