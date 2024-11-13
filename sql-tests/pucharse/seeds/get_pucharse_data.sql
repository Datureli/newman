-- Zapytanie: Suma wydatków użytkowników
SELECT u.username, SUM(p.price) AS total_spent
FROM users u
JOIN purchases p ON u.id = p.user_id
GROUP BY u.username
ORDER BY total_spent DESC;
