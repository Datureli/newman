CREATE OR REPLACE FUNCTION GetBloodCompatibility(
    soldier_identifier IN VARCHAR2,
    identifier_type IN VARCHAR2
) RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
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
            AND d.SoldierID != r.SoldierID
        WHERE 
            (identifier_type = 'ID' AND d.SoldierID = soldier_identifier) OR
            (identifier_type = 'NAME' AND d.Name || ' ' || d.Surname = soldier_identifier)
        GROUP BY 
            d.Name, d.BloodType;

    RETURN result_cursor;
END;
/
