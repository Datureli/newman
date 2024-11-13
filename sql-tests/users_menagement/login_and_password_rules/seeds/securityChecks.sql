SELECT username, 
       password,
       LENGTH(password) AS password_length
FROM users
WHERE LENGTH(password) < 8; -- Przykład: długość hasła mniejsza niż 8 znaków


-- Sprawdzenie nieaktywnych użytkowników przez ponad 90 dni
SELECT u.username
FROM users u
LEFT JOIN user_activity a ON u.id = a.user_id
WHERE a.timestamp < NOW() - INTERVAL 90 DAY
   OR a.timestamp IS NULL;
