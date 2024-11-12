-- Testowanie funkcji log_activity
CALL log_activity(1, 'login');
CALL log_activity(2, 'login');
CALL log_activity(2, 'purchase');
CALL log_activity(1, 'battle');
CALL log_activity(2, 'chat');


-- Sprawdzenie wyników
SELECT * FROM user_activity ORDER BY timestamp DESC;
