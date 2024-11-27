-- Wprowadzanie danych do tabeli Soldiers
INSERT ALL
    INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
    VALUES (1, 'Liam', 'Anderson', 'O-', 'None', 'Healthy')
    INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
    VALUES (2, 'Noah', 'Thomas', 'O+', 'Peanuts', 'Mild Asthma')
    INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
    VALUES (3, 'William', 'Harris', 'A-', 'Pollen', 'No significant history')
    INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
    VALUES (4, 'James', 'Martin', 'A+', 'None', 'Old fracture in 2018')
    INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
    VALUES (5, 'Oliver', 'Garcia', 'B-', 'None', 'Diabetes Type 1')
SELECT * FROM DUAL;

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

-- Wprowadzanie danych do tabeli Incidents
INSERT ALL
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (1, 1, 'Fracture', '45.4215 N, 75.6972 W', SYSDATE - INTERVAL '2' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (2, 2, 'Allergic reaction', '47.3769 N, 8.5417 E', SYSDATE - INTERVAL '1' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (3, 3, 'Heat stroke', '40.7128 N, 74.0060 W', SYSDATE - INTERVAL '3' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (4, 4, 'Gunshot wound', '34.0522 N, 118.2437 W', SYSDATE - INTERVAL '5' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (5, 5, 'Burn', '48.8566 N, 2.3522 E', SYSDATE - INTERVAL '7' DAY)
SELECT * FROM DUAL;

-- Wprowadzanie danych do tabeli Alerts
INSERT ALL
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (1, 3, 'Critical low oxygen level', SYSDATE - INTERVAL '10' MINUTE)
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (2, 4, 'High heart rate', SYSDATE - INTERVAL '5' MINUTE)
    INTO Alerts (AlertID, SoldierID, AlertType, Timestamp)
    VALUES (3, 5, 'Temperature anomaly', SYSDATE - INTERVAL '20' MINUTE)
SELECT * FROM DUAL;

-- Wprowadzanie danych do tabeli MedicalEquipmentUsage
INSERT ALL
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (1, 1, 'Defibrillator', SYSDATE - INTERVAL '3' DAY)
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (2, 2, 'First aid kit', SYSDATE - INTERVAL '2' DAY)
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (3, 5, 'Tourniquet', SYSDATE - INTERVAL '4' DAY)
SELECT * FROM DUAL;
