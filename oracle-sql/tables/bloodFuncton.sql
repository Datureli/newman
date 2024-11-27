SELECT 
    d.Name AS DonorName, 
    d.BloodType AS DonorBloodType,
    r.Name AS RecipientName, 
    r.BloodType AS RecipientBloodType,
    'YES' AS IsCompatible
FROM 
    Soldiers d
JOIN 
    Soldiers r ON d.SoldierID != r.SoldierID
JOIN 
    BloodCompatibility bc ON d.BloodType = bc.DonorBloodType
                          AND r.BloodType = bc.RecipientBloodType;
