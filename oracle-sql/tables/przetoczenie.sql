CREATE OR REPLACE FUNCTION CanDonateBlood(donorBloodType IN CHAR, recipientBloodType IN CHAR) 
RETURN VARCHAR2 IS
    isCompatible VARCHAR2(3);
BEGIN
    BEGIN
        SELECT 'YES'
        INTO isCompatible
        FROM BloodCompatibility
        WHERE DonorBloodType = donorBloodType
          AND RecipientBloodType = recipientBloodType;

        DBMS_OUTPUT.PUT_LINE('Compatibility found for ' || donorBloodType || ' -> ' || recipientBloodType);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No compatibility found for ' || donorBloodType || ' -> ' || recipientBloodType);
            RETURN 'NO';
    END;

    RETURN isCompatible;
END;
/
