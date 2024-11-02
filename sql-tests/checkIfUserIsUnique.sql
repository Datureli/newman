SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN 'Nie znaleziono zadnych duplikatow'
        ELSE CONCAT('Znaleziono duplikaty: ', COUNT(*))
    END AS result
FROM 
    (SELECT username FROM users GROUP BY username HAVING COUNT(*) > 1) AS subquery;
