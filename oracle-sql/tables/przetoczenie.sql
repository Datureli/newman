CREATE OR REPLACE FUNCTION CanDonateBlood(donorBloodType IN CHAR, recipientBloodType IN CHAR) 
RETURN VARCHAR2 IS
    isCompatible VARCHAR2(3);
BEGIN
    SELECT 'YES'
    INTO isCompatible
    FROM BloodCompatibility
    WHERE DonorBloodType = donorBloodType
      AND RecipientBloodType = recipientBloodType;

    RETURN isCompatible;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO';
END;
/
