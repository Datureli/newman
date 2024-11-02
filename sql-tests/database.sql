USE my_database; -- Wybór bazy danych

-- Tworzenie tabeli users z dodatkową kolumną role
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255),
    role ENUM('admin', 'player', 'beta_tester') NOT NULL -- Kolumna role o ograniczonym zakresie wartości
);

-- Dodawanie danych do tabeli users z różnymi rolami
INSERT INTO users (username, password, token, role) VALUES
('john_doe', '1234', 'abcd1234', 'admin'),
('jane_smith', 'password', 'xyz9876', 'player'),
('test_user', 'beta_password', 'test_token', 'beta_tester');
