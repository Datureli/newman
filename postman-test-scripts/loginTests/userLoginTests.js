// Test poprawnego logowania
pm.test("Status code is 200", () => {
  pm.response.to.have.status(200);
});

pm.test("Znaleziono użytkownika", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData.users).to.be.an("array").that.is.not.empty;
  pm.expect(jsonData.users[0].username).to.eql("john_doe");
});

pm.test("Próba logowania z podanym username i password", () => {
  const jsonData = pm.response.json();
  const expectedUsername = "john_doe";
  const expectedPassword = "John!12345";
  const userExists = jsonData.users.some(
    (user) =>
      user.username === expectedUsername && user.password === expectedPassword
  );
  pm.expect(userExists).to.be.true;
});

// Sprawdzanie zwrócenia tokenu JWT
pm.test("Sprawdzam, czy token JWT został zwrócony", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData).to.have.property("token").and.to.be.a("string").that.is
    .not.empty;
  pm.environment.set("jwt_token", jsonData.token);
});

// Testy dla autoryzacji poprawnej odpowiedzi
pm.test("Poprawna odpowiedź z autoryzacją", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData.users).to.be.an("array").that.is.not.empty;
  pm.expect(jsonData.users[0].username).to.eql("john_doe");
});

// Test niepoprawnego logowania
if (pm.request.url.raw) {
  if (pm.request.url.raw.includes("wrong_user")) {
    pm.test("Status code is 401", () => {
      pm.response.to.have.status(401);
    });

    pm.test("Brak tokenu JWT w odpowiedzi", () => {
      pm.expect(pm.response.json()).to.not.have.property("token");
    });
  } else {
    // Oczekiwany wynik dla poprawnego logowania
    pm.test("Poprawny wynik logowania", () => {
      pm.response.to.have.status(200);
    });
  }
}
