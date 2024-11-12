SELECT user_id, action, timestamp
FROM user_activity
WHERE user_id = 1 AND action = 'login'
ORDER BY timestamp DESC
LIMIT 1;
