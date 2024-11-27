-- Wstawienie żołnierzy tylko, jeśli nie istnieją
INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 1, 'Liam', 'Anderson', 'O-', 'None', 'Healthy' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 1 AND Name = 'Liam' AND Surname = 'Anderson' AND BloodType = 'O-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 2, 'Noah', 'Thomas', 'O+', 'Peanuts', 'Mild Asthma' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 2 AND Name = 'Noah' AND Surname = 'Thomas' AND BloodType = 'O+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 3, 'William', 'Harris', 'A-', 'Pollen', 'No significant history' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 3 AND Name = 'William' AND Surname = 'Harris' AND BloodType = 'A-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 4, 'James', 'Martin', 'A+', 'None', 'Old fracture in 2018' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 4 AND Name = 'James' AND Surname = 'Martin' AND BloodType = 'A+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 5, 'Oliver', 'Garcia', 'B-', 'None', 'Diabetes Type 1' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 5 AND Name = 'Oliver' AND Surname = 'Garcia' AND BloodType = 'B-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 6, 'Sophia', 'Davis', 'B+', 'Lactose Intolerant', 'Healthy' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 6 AND Name = 'Sophia' AND Surname = 'Davis' AND BloodType = 'B+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 7, 'Lucas', 'Martinez', 'AB-', 'None', 'Minor surgery in 2020' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 7 AND Name = 'Lucas' AND Surname = 'Martinez' AND BloodType = 'AB-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 8, 'Amelia', 'Lopez', 'AB+', 'Shellfish', 'Healthy' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 8 AND Name = 'Amelia' AND Surname = 'Lopez' AND BloodType = 'AB+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 9, 'Ethan', 'Gonzalez', 'O-', 'None', 'Asthma' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 9 AND Name = 'Ethan' AND Surname = 'Gonzalez' AND BloodType = 'O-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 10, 'Isabella', 'Wilson', 'O+', 'None', 'Healthy' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 10 AND Name = 'Isabella' AND Surname = 'Wilson' AND BloodType = 'O+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 11, 'Mason', 'Anderson', 'A-', 'Gluten', 'High blood pressure' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 11 AND Name = 'Mason' AND Surname = 'Anderson' AND BloodType = 'A-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 12, 'Ava', 'Brown', 'A+', 'None', 'No significant medical history' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 12 AND Name = 'Ava' AND Surname = 'Brown' AND BloodType = 'A+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 13, 'Sebastian', 'Jackson', 'B-', 'Dust', 'No significant medical history' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 13 AND Name = 'Sebastian' AND Surname = 'Jackson' AND BloodType = 'B-');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 14, 'Lily', 'Taylor', 'B+', 'None', 'Healthy' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 14 AND Name = 'Lily' AND Surname = 'Taylor' AND BloodType = 'B+');

INSERT INTO Soldiers (SoldierID, Name, Surname, BloodType, Allergies, MedicalHistory)
SELECT 15, 'James', 'Miller', 'AB-', 'None', 'No significant medical history' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM Soldiers WHERE SoldierID = 15 AND Name = 'James' AND Surname = 'Miller' AND BloodType = 'AB-');
