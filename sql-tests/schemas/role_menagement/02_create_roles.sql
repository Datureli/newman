-- Tworzenie tabeli permissions (uprawnienia)
CREATE TABLE IF NOT EXISTS permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_name VARCHAR(50) NOT NULL UNIQUE
);