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

-- Uproszczone dodanie uprawnień dla poszczególnych ról
INSERT IGNORE INTO role_permissions (role, permission_id)
SELECT 'admin', id FROM permissions WHERE action_name IN ('create_post', 'edit_post', 'delete_post', 'ban_user')
UNION ALL
SELECT 'moderator', id FROM permissions WHERE action_name IN ('create_post', 'edit_post', 'ban_user');

-- Pobranie unikalnych akcji dla roli 'admin'
SELECT DISTINCT p.action_name
FROM role_permissions rp
JOIN permissions p ON rp.permission_id = p.id
WHERE rp.role = 'admin';
