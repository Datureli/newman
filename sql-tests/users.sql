USE my_database
SELECT * FROM users;

-- Dodanie użytkownika testowego
INSERT INTO users (username, password, token) VALUES ('testuser', 'testpassword', 'testtoken');

-- Aktualizacja użytkownika testowego
UPDATE users SET token = 'updatedtoken' WHERE username = 'testuser';

-- Usunięcie użytkownika testowego
DELETE FROM users WHERE username = 'testuser';
