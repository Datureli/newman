DECLARE
    v_dummy NUMBER;  -- Zmienna pomocnicza do sprawdzenia istnienia rekordu
BEGIN
    FOR record IN (
        SELECT DISTINCT d.DonorBloodType, r.RecipientBloodType
        FROM (
            SELECT 'O-' AS DonorBloodType FROM DUAL UNION ALL
            SELECT 'O+' FROM DUAL UNION ALL
            SELECT 'A-' FROM DUAL UNION ALL
            SELECT 'A+' FROM DUAL UNION ALL
            SELECT 'B-' FROM DUAL UNION ALL
            SELECT 'B+' FROM DUAL UNION ALL
            SELECT 'AB-' FROM DUAL UNION ALL
            SELECT 'AB+' FROM DUAL
        ) d
        CROSS JOIN (
            SELECT 'O-' AS RecipientBloodType FROM DUAL UNION ALL
            SELECT 'O+' FROM DUAL UNION ALL
            SELECT 'A-' FROM DUAL UNION ALL
            SELECT 'A+' FROM DUAL UNION ALL
            SELECT 'B-' FROM DUAL UNION ALL
            SELECT 'B+' FROM DUAL UNION ALL
            SELECT 'AB-' FROM DUAL UNION ALL
            SELECT 'AB+' FROM DUAL
        ) r
        WHERE 
            (d.DonorBloodType, r.RecipientBloodType) NOT IN (
                SELECT DonorBloodType, RecipientBloodType FROM BloodCompatibility
            ) AND (
                -- Reguły kompatybilności
                (d.DonorBloodType = 'O-' AND r.RecipientBloodType IN ('O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+')) OR
                (d.DonorBloodType = 'O+' AND r.RecipientBloodType IN ('O+', 'A+', 'B+', 'AB+')) OR
                (d.DonorBloodType = 'A-' AND r.RecipientBloodType IN ('A-', 'A+', 'AB-', 'AB+')) OR
                (d.DonorBloodType = 'A+' AND r.RecipientBloodType IN ('A+', 'AB+')) OR
                (d.DonorBloodType = 'B-' AND r.RecipientBloodType IN ('B-', 'B+', 'AB-', 'AB+')) OR
                (d.DonorBloodType = 'B+' AND r.RecipientBloodType IN ('B+', 'AB+')) OR
                (d.DonorBloodType = 'AB-' AND r.RecipientBloodType IN ('AB-', 'AB+')) OR
                (d.DonorBloodType = 'AB+' AND r.RecipientBloodType = 'AB+')
            )
    ) LOOP
        -- Sprawdzamy, czy kombinacja już istnieje w tabeli
        BEGIN
            -- Próbujemy pobrać rekord
            SELECT 1 
            INTO   v_dummy
            FROM   BloodCompatibility 
            WHERE  DonorBloodType = record.DonorBloodType 
            AND    RecipientBloodType = record.RecipientBloodType;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Jeśli rekord nie istnieje, wstawiamy nowy
                INSERT INTO BloodCompatibility (DonorBloodType, RecipientBloodType)
                VALUES (record.DonorBloodType, record.RecipientBloodType);
            WHEN OTHERS THEN
                -- Obsługuje przypadek, gdy inny błąd wystąpi, np. naruszenie unikalnego klucza
                NULL; -- Ignorujemy inne błędy
        END;
    END LOOP;
END;
/
