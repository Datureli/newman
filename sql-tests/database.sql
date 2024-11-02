USE my_database; -- Wybór bazy danych

-- Tworzenie tabeli users
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255)
);

-- Dodawanie danych do tabeli users
INSERT INTO users (username, password, token) VALUES
('john_doe', '1234', 'abcd1234'),
('jane_smith', 'password', 'xyz9876');
