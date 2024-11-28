CREATE TABLE BloodCompatibility (
    DonorBloodType CHAR(3) NOT NULL,   -- Grupa krwi dawcy
    RecipientBloodType CHAR(3) NOT NULL, -- Grupa krwi biorcy
    CONSTRAINT PK_BloodCompatibility PRIMARY KEY (DonorBloodType, RecipientBloodType)
);
