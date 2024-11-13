SELECT 
    ROW_NUMBER() OVER (ORDER BY p.points DESC) AS position,
    u.username, 
    p.points
FROM 
    users u
JOIN 
    user_points p ON u.id = p.user_id
ORDER BY 
    p.points DESC;
