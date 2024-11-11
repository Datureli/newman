-- Dodanie uprawnień dla poszczególnych ról, używając UNION, aby usunąć duplikaty
INSERT IGNORE INTO role_permissions (role, permission_id)
SELECT 'admin', id FROM permissions WHERE action_name IN ('create_post', 'edit_post', 'delete_post', 'ban_user')
UNION
SELECT 'moderator', id FROM permissions WHERE action_name IN ('create_post', 'edit_post', 'ban_user');