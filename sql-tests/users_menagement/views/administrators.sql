CREATE VIEW administrators AS
SELECT user_id, name, salary
FROM users
WHERE role= 'admin';
