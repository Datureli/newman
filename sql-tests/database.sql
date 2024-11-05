-- Tworzenie tabeli użytkowników
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'player', 'moderator')),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ustawienie delimitera
DELIMITER //

-- Tworzenie procedury dodawania użytkownika
CREATE PROCEDURE add_user(
    IN p_username VARCHAR(50),
    IN p_password_hash VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_role VARCHAR(20)
)
BEGIN
    DECLARE existing_count INT;

    -- Sprawdzenie, czy użytkownik już istnieje
    SELECT COUNT(*) INTO existing_count FROM users WHERE username = p_username;

    IF existing_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists!';
    ELSE
        INSERT INTO users (username, password_hash, email, role)
        VALUES (p_username, p_password_hash, p_email, p_role);
    END IF;
END //

-- Przywrócenie domyślnego delimitera
DELIMITER ;

-- Wywołanie procedury w celu dodania użytkownika
CALL add_user('john_doe', 'hashed_password1', 'john11@example.com', 'admin');
CALL add_user('jane_smith', 'hashed_password2', 'jane00@example.com', 'player');

-- Sprawdzenie unikalności nazw użytkowników
SELECT username, COUNT(*) AS count
FROM users
GROUP BY username
HAVING count > 1;
