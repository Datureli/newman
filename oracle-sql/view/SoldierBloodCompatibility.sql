CREATE OR REPLACE VIEW DonorCompatibility AS
SELECT 
    d.Name AS DonorName, 
    d.BloodType AS DonorBloodType,
    LISTAGG(r.BloodType, ', ') WITHIN GROUP (ORDER BY r.BloodType) AS CompatibleRecipients
FROM 
    Soldiers d
JOIN 
    BloodCompatibility bc 
    ON d.BloodType = bc.DonorBloodType
JOIN 
    Soldiers r 
    ON r.BloodType = bc.RecipientBloodType
    AND d.SoldierID != r.SoldierID  -- Wykluczamy porównanie tego samego żołnierza
GROUP BY 
    d.Name, d.BloodType
ORDER BY 
    d.Name;

    
