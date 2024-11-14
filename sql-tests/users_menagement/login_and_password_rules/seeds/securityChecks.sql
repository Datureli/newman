-- Sprawdzenie nieaktywnych użytkowników przez ponad 90 dni
SELECT u.username
FROM users u
LEFT JOIN user_activity a ON u.id = a.user_id
WHERE a.timestamp < NOW() - INTERVAL 90 DAY
   OR a.timestamp IS NULL;
