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
