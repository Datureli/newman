-- Tworzenie tabeli użytkowników
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role ENUM('admin', 'player', 'moderator') NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Dodawanie użytkowników do bazy
INSERT INTO users (username, password_hash, email, role)
VALUES
    ('john_doe', 'hashed_password1', 'john11@example.com', 'admin'),
    ('jane_smith', 'hashed_password2', 'jane00@example.com', 'player');

-- Sprawdzenie unikalności nazw użytkowników
SELECT username, COUNT(*) AS count
FROM users
GROUP BY username
HAVING count > 1;
