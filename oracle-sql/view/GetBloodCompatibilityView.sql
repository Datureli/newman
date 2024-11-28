CREATE OR REPLACE VIEW DonorCompatibility AS
SELECT 
    (d.Name || ' ' || d.Surname) AS DonorName, 
    d.BloodType AS DonorBloodType,
    LISTAGG(
        (r.Name || ' ' || r.Surname || ' (' || r.BloodType || ')'), ', ') 
        WITHIN GROUP (ORDER BY r.Name, r.Surname) AS CompatibleRecipients
FROM 
    Soldiers d
JOIN 
    BloodCompatibility bc 
    ON d.BloodType = bc.DonorBloodType
JOIN 
    Soldiers r 
    ON r.BloodType = bc.RecipientBloodType
    AND d.SoldierID != r.SoldierID
GROUP BY 
    d.Name, d.Surname, d.BloodType
ORDER BY 
    d.Name, d.Surname;
