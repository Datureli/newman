-- Sprawdzenie unikalności nazw użytkowników
SELECT username, COUNT(*) AS count
FROM users
GROUP BY username
HAVING count > 1;