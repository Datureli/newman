-- Tworzenie tabeli wiadomości
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

-- Wysyłanie wiadomości
INSERT INTO messages (sender_id, receiver_id, message_text) VALUES
    (1, 2, 'Hej, widziałeś już nowe poziomy?');

-- Wyświetlanie wiadomości między dwoma graczami
SELECT sender_id, receiver_id, message_text, sent_at
FROM messages
WHERE (sender_id = 1 AND receiver_id = 2)
   OR (sender_id = 2 AND receiver_id = 1)
ORDER BY sent_at;
