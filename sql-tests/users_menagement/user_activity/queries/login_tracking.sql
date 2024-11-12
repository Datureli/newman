SELECT user_id, action, timestamp
FROM user_activity
WHERE user_id = 1 AND action = 'login'
ORDER BY timestamp DESC
LIMIT 5;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'misio11';
FLUSH PRIVILEGES;

