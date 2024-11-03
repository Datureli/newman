-- Tworzenie tabeli aktywności użytkowników
CREATE TABLE IF NOT EXISTS user_activity (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type ENUM('login', 'purchase', 'battle', 'chat') NOT NULL,
    activity_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Przykładowe dane aktywności
INSERT INTO user_activity (user_id, activity_type) VALUES
    (1, 'login'),
    (2, 'purchase'),
    (1, 'battle'),
    (2, 'chat');

-- Zapytanie pokazujące aktywność graczy w ciągu ostatnich 24 godzin
SELECT user_id, activity_type, activity_date
FROM user_activity
WHERE activity_date >= NOW() - INTERVAL 1 DAY;
