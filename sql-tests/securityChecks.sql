-- Sprawdzenie haseł o zbyt małej długości
SELECT username
FROM users
WHERE CHAR_LENGTH(password_hash) < 8;

-- Sprawdzenie nieaktywnych użytkowników przez ponad 90 dni
SELECT u.username
FROM users u
LEFT JOIN user_activity a ON u.id = a.user_id
WHERE a.activity_date < NOW() - INTERVAL 90 DAY
OR a.activity_date IS NULL;

-- Kontrola zgodności haseł przy logowaniu (w przykładzie hasło jako plain-text)
SELECT u.username
FROM users u
WHERE u.password_hash = 'hashed_password_attempt';
