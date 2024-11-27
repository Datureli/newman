INSERT ALL
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (1, 1, 'Defibrillator', SYSDATE - INTERVAL '3' DAY)
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (2, 2, 'First aid kit', SYSDATE - INTERVAL '2' DAY)
    INTO MedicalEquipmentUsage (UsageID, SoldierID, EquipmentType, Timestamp)
    VALUES (3, 5, 'Tourniquet', SYSDATE - INTERVAL '4' DAY)
SELECT * FROM DUAL;
