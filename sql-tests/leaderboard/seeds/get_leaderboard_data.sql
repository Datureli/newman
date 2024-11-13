-- Ranking użytkowników
SELECT u.username, p.points
FROM users u
JOIN user_points p ON u.id = p.user_id
ORDER BY p.points DESC;