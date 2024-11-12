-- Usuwanie procedury, jeśli istnieje
DROP PROCEDURE IF EXISTS log_activity;

-- Tworzenie procedury logującej aktywność
DELIMITER //
CREATE PROCEDURE log_activity(p_user_id BIGINT, p_action VARCHAR(100))
BEGIN
    INSERT INTO user_activity (user_id, action) VALUES (p_user_id, p_action);
END //
DELIMITER ;