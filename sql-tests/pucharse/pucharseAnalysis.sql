-- Tworzenie tabeli zakupów
CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Przykładowe dane zakupów
INSERT INTO purchases (user_id, item_name, price) VALUES
    (1, 'Sword of Destiny', 49.99),
    (2, 'Health Potion', 5.99),
    (1, 'Armor of Legends', 99.99);

-- Zapytanie: Suma wydatków użytkowników
SELECT u.username, SUM(p.price) AS total_spent
FROM users u
JOIN purchases p ON u.id = p.user_id
GROUP BY u.username
ORDER BY total_spent DESC;
