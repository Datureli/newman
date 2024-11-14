SELECT * 
FROM users 
WHERE LENGTH(password_hash) < 6;
