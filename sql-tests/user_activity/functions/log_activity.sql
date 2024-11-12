DELIMITER //

CREATE FUNCTION log_activity(p_user_id BIGINT, p_action VARCHAR(100))
RETURNS VOID
DETERMINISTIC
BEGIN
    -- Wstawia aktywność do tabeli user_activity
    INSERT INTO user_activity (user_id, action) VALUES (p_user_id, p_action);
END //

DELIMITER ;
