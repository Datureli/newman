-- Zapytanie pokazujące aktywność graczy w ciągu ostatnich 24 godzin
SELECT user_id, activity_type, activity_date
FROM user_activity
WHERE activity_date >= NOW() - INTERVAL 1 DAY;