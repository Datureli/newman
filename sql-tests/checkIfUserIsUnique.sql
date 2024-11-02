SELECT username, COUNT(*) 
FROM users 
GROUP BY username 
HAVING COUNT(*) > 1;
