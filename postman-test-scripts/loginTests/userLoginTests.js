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

// Sprawdzanie lokalnie wygenerowanego tokenu JWT (zamiast tokenu z odpowiedzi API)
console.log("Lokalnie wygenerowany token JWT:", pm.environment.get("jwt_token"));

// Test dla autoryzacji odpowiedzi z API (jeśli API również zwraca token)
pm.test("Sprawdzam, czy token JWT został zwrócony przez API", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData).to.have.property("token").and.to.be.a("string").that.is
    .not.empty;
});

// Test dla odpowiedzi autoryzacyjnej
pm.test("Poprawna odpowiedź z autoryzacją", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData.users).to.be.an("array").that.is.not.empty;
  pm.expect(jsonData.users[0].username).to.eql("john_doe");
});
