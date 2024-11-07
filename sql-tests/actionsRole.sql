SELECT p.action_name
FROM role_permissions rp
JOIN permissions p ON rp.permission_id = p.id
WHERE rp.role = 'admin';


SELECT p.action_name
FROM users u
JOIN role_permissions rp ON u.role = rp.role
JOIN permissions p ON rp.permission_id = p.id
WHERE u.username = 'john_doe' AND p.action_name = 'delete_post';


SELECT DISTINCT p.action_name
FROM permissions p
LEFT JOIN role_permissions rp ON p.id = rp.permission_id
WHERE rp.role = 'admin';
