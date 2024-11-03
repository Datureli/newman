-- Tworzenie tabeli punktów
CREATE TABLE IF NOT EXISTS user_points (
    user_id INT NOT NULL,
    points INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Przykładowe dodawanie punktów
INSERT INTO user_points (user_id, points) VALUES
    (1, 1500),
    (2, 2500);

-- Ranking użytkowników
SELECT u.username, p.points
FROM users u
JOIN user_points p ON u.id = p.user_id
ORDER BY p.points DESC;
