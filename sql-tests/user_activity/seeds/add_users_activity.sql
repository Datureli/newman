-- Testowanie funkcji log_activity
SELECT log_activity(1, 'login');
SELECT log_activity(2, 'purchase');
SELECT log_activity(1, 'battle');
SELECT log_activity(2, 'chat');

-- Sprawdzenie wyników
SELECT * FROM user_activity ORDER BY timestamp DESC;
