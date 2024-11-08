CREATE TABLE IF NOT EXISTS role_permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role ENUM('admin', 'player', 'moderator') NOT NULL,
    permission_id INT NOT NULL,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE,
    UNIQUE (role, permission_id)  -- Zapewnia unikalność kombinacji roli i uprawnienia
);