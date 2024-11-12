-- Zapytanie: Pobranie akcji dla roli 'admin'
SELECT p.action_name
FROM role_permissions rp
JOIN permissions p ON rp.permission_id = p.id
WHERE rp.role = 'admin';