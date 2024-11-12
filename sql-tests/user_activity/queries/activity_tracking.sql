SELECT user_id, action, timestamp
FROM user_activity
WHERE timestamp >= NOW() - INTERVAL 1 DAY;