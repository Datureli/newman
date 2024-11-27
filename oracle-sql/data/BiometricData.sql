-- Wprowadzanie danych do tabeli BiometricData
INSERT ALL
    INTO BiometricData (BiometricID, SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
    VALUES (1, 1, SYSDATE, 80, '120/80', 98.6, 36.7)
    INTO BiometricData (BiometricID, SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
    VALUES (2, 2, SYSDATE, 76, '118/76', 97.5, 36.5)
    INTO BiometricData (BiometricID, SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
    VALUES (3, 3, SYSDATE, 85, '122/82', 96.8, 37.0)
    INTO BiometricData (BiometricID, SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
    VALUES (4, 4, SYSDATE, 90, '130/85', 95.0, 37.5)
    INTO BiometricData (BiometricID, SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
    VALUES (5, 5, SYSDATE, 78, '115/75', 99.0, 36.6)
SELECT * FROM DUAL;