-- Wprowadzanie danych do tabeli Soldiers
INSERT INTO Soldiers (Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 'John', 'Smith', 'O+', 'None', 'No medical history' FROM DUAL UNION ALL
SELECT 'Jane', 'Doe', 'A-', 'Peanuts', 'Asthma in childhood' FROM DUAL UNION ALL
SELECT 'Mike', 'Johnson', 'B+', 'None', 'Fractured arm in 2019' FROM DUAL UNION ALL
SELECT 'Emily', 'Clark', 'AB-', 'Shellfish', 'Allergic rhinitis' FROM DUAL UNION ALL
SELECT 'Tom', 'Brown', 'O-', 'None', 'Diabetes Type 2' FROM DUAL UNION ALL
SELECT 'Anna', 'Taylor', 'A+', 'Dust', 'No medical history' FROM DUAL UNION ALL
SELECT 'Robert', 'Lee', 'B-', 'Latex', 'Hypertension' FROM DUAL UNION ALL
SELECT 'Sophia', 'Wilson', 'AB+', 'None', 'Broken leg in 2020' FROM DUAL UNION ALL
SELECT 'Chris', 'Evans', 'O+', 'None', 'High cholesterol' FROM DUAL UNION ALL
SELECT 'Olivia', 'Martinez', 'A-', 'Pollen', 'Asthma in adulthood' FROM DUAL;

-- Wprowadzanie danych do tabeli BiometricData
INSERT INTO BiometricData (SoldierID, Timestamp, HeartRate, BloodPressure, OxygenLevel, BodyTemperature)
SELECT 1, SYSDATE, 80, '120/80', 98.6, 36.7 FROM DUAL UNION ALL
SELECT 2, SYSDATE, 76, '118/76', 97.5, 36.5 FROM DUAL UNION ALL
SELECT 3, SYSDATE, 85, '122/82', 96.8, 37.0 FROM DUAL UNION ALL
SELECT 4, SYSDATE, 90, '130/85', 95.0, 37.5 FROM DUAL UNION ALL
SELECT 5, SYSDATE, 78, '115/75', 99.0, 36.6 FROM DUAL UNION ALL
SELECT 6, SYSDATE, 82, '125/78', 98.2, 36.8 FROM DUAL UNION ALL
SELECT 7, SYSDATE, 74, '110/70', 96.5, 36.4 FROM DUAL UNION ALL
SELECT 8, SYSDATE, 88, '128/80', 97.8, 37.1 FROM DUAL UNION ALL
SELECT 9, SYSDATE, 92, '135/88', 95.5, 37.3 FROM DUAL UNION ALL
SELECT 10, SYSDATE, 79, '120/78', 98.1, 36.7 FROM DUAL;

-- Wprowadzanie danych do tabeli Incidents
INSERT INTO Incidents (SoldierID, IncidentType, Location, Timestamp)
SELECT 1, 'Fracture', '45.4215 N, 75.6972 W', SYSDATE - INTERVAL '2' DAY FROM DUAL UNION ALL
SELECT 2, 'Allergic reaction', '47.3769 N, 8.5417 E', SYSDATE - INTERVAL '1' DAY FROM DUAL UNION ALL
SELECT 3, 'Heat stroke', '40.7128 N, 74.0060 W', SYSDATE - INTERVAL '3' DAY FROM DUAL UNION ALL
SELECT 4, 'Gunshot wound', '34.0522 N, 118.2437 W', SYSDATE - INTERVAL '5' DAY FROM DUAL UNION ALL
SELECT 5, 'Burn', '48.8566 N, 2.3522 E', SYSDATE - INTERVAL '7' DAY FROM DUAL;

-- Wprowadzanie danych do tabeli Alerts
INSERT INTO Alerts (SoldierID, AlertType, Timestamp)
SELECT 3, 'Critical low oxygen level', SYSDATE - INTERVAL '10' MINUTE FROM DUAL UNION ALL
SELECT 4, 'High heart rate', SYSDATE - INTERVAL '5' MINUTE FROM DUAL UNION ALL
SELECT 6, 'Temperature anomaly', SYSDATE - INTERVAL '20' MINUTE FROM DUAL;

-- Wprowadzanie danych do tabeli MedicalEquipmentUsage
INSERT INTO MedicalEquipmentUsage (SoldierID, EquipmentType, Timestamp)
SELECT 1, 'Defibrillator', SYSDATE - INTERVAL '3' DAY FROM DUAL UNION ALL
SELECT 2, 'First aid kit', SYSDATE - INTERVAL '2' DAY FROM DUAL UNION ALL
SELECT 5, 'Tourniquet', SYSDATE - INTERVAL '4' DAY FROM DUAL;
