-- Wprowadzanie danych do tabeli Alerts
INSERT ALL
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (1, 3, 'Critical low oxygen level', SYSDATE - INTERVAL '10' MINUTE)
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (2, 4, 'High heart rate', SYSDATE - INTERVAL '5' MINUTE)
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (3, 5, 'Temperature anomaly', SYSDATE - INTERVAL '20' MINUTE)
SELECT * FROM DUAL;