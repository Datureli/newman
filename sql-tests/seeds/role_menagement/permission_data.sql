-- Dodanie uprawnień do tabeli permissions, z użyciem INSERT IGNORE, aby uniknąć duplikatów
INSERT IGNORE INTO permissions (action_name) VALUES
    ('create_post'),
    ('edit_post'),
    ('delete_post'),
    ('ban_user');