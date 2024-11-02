USE my_database;

-- Pobranie wszystkich użytkowników
SELECT * FROM users;

-- Dodanie nowego użytkownika testowego z rolą
INSERT INTO users (username, password, token, role) VALUES 
('testuser', 'testpassword', 'testtoken', 'player'); 

-- Aktualizacja tokena użytkownika testowego
UPDATE users SET token = 'updatedtoken' WHERE username = 'testuser';

-- Usunięcie użytkownika testowego
DELETE FROM users WHERE username = 'testuser';
