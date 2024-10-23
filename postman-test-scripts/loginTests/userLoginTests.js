pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});

pm.test("Znaleziono użytkownika", () => {
    const jsonData = pm.response.json();
    pm.expect(jsonData.users).to.be.an('array').that.is.not.empty;
    pm.expect(jsonData.users[0].username).to.eql("john_doe");
});

pm.test("Nie ma tokenu", () => {
    pm.expect(pm.response.json()).to.not.have.property('token');
});

pm.test("Próba logowania z podanym username i password", () => {
    const jsonData = pm.response.json();
    const expectedUsername = "john_doe";
    const expectedPassword = "John!12345";
    const userExists = jsonData.users.some(user => user.username === expectedUsername && user.password === expectedPassword);
    pm.expect(userExists).to.be.true;
});
