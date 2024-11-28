DECLARE
    v_donorName VARCHAR2(100);
    v_donorBloodType VARCHAR2(5);
    v_compatibleRecipients VARCHAR2(500);
BEGIN
    -- Wybieramy dane z widoku DonorCompatibility
    FOR v_row IN (SELECT DonorName, DonorBloodType, CompatibleRecipients
                  FROM DonorCompatibility) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Dawca: ' || v_row.DonorName || 
                             ', Grupa: ' || v_row.DonorBloodType || 
                             ', Zgodne grupy: ' || v_row.CompatibleRecipients);
    END LOOP;
END;
/
