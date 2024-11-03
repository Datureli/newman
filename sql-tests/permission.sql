-- Tworzenie tabeli permissions (uprawnienia)
CREATE TABLE IF NOT EXISTS permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_name VARCHAR(50) NOT NULL UNIQUE
);

-- Tworzenie tabeli role_permissions (przypisanie ról do uprawnień)
CREATE TABLE IF NOT EXISTS role_permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role ENUM('admin', 'player', 'moderator') NOT NULL,
    permission_id INT NOT NULL,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);

-- Dodanie uprawnień do tabeli permissions, z użyciem INSERT IGNORE, aby uniknąć duplikatów
INSERT IGNORE INTO permissions (action_name) VALUES
    ('create_post'),
    ('edit_post'),
    ('delete_post'),
    ('ban_user');

-- Dodanie uprawnień dla poszczególnych ról, z użyciem INSERT IGNORE
INSERT IGNORE INTO role_permissions (role, permission_id) VALUES
    ('admin', 1),  -- create_post
    ('admin', 2),  -- edit_post
    ('admin', 3),  -- delete_post
    ('admin', 4),  -- ban_user
    ('moderator', 1),  -- create_post
    ('moderator', 2),  -- edit_post
    ('moderator', 4);  -- ban_user

-- Pobranie akcji dla roli 'admin'
SELECT p.action_name
FROM role_permissions rp
JOIN permissions p ON rp.permission_id = p.id
WHERE rp.role = 'admin';
