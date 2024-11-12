DROP TABLE IF EXISTS user_activity;

CREATE TABLE user_activity (
    user_id BIGINT UNSIGNED NOT NULL,
    action VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
