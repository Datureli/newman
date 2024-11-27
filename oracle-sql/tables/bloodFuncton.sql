SELECT 
    d.Name AS DonorName, d.BloodType AS DonorBloodType,
    r.Name AS RecipientName, r.BloodType AS RecipientBloodType,
    CanDonateBlood(d.BloodType, r.BloodType) AS IsCompatible
FROM 
    Soldiers d
CROSS JOIN 
    Soldiers r
WHERE 
    d.SoldierID != r.SoldierID; -- Wykluczamy porównywanie żołnierza z samym sobą
