-- Zapytanie: Pobranie akcji dla roli 'admin'
SELECT p.action_name
FROM role_permissions rp
JOIN permissions p ON rp.permission_id = p.id
WHERE rp.role = 'admin';

-- Zapytanie: Pobranie akcji dla użytkownika 'john_doe' związanych z 'delete_post'
SELECT p.action_name
FROM users u
JOIN role_permissions rp ON u.role = rp.role
JOIN permissions p ON rp.permission_id = p.id
WHERE u.username = 'john_doe' AND p.action_name = 'delete_post';

-- Zapytanie: Pobranie unikalnych akcji dla roli 'admin' z LEFT JOIN
SELECT DISTINCT p.action_name
FROM permissions p
LEFT JOIN role_permissions rp ON p.id = rp.permission_id
WHERE rp.role = 'admin';
