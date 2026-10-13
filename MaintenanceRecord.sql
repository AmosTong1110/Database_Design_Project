CREATE TABLE IF NOT EXISTS MaintenanceRecord(
    [RecordID] INT PRIMARY KEY,
    [StaffID] INT, -- foreign key to Staff table
    [MachineryID] INT, -- foreign key to Machinery table
    [RecordType] VARCHAR(50), -- type of maintenance performed
    [CreatedDate] DATE,
    [DamagePercentage] DECIMAL(5,2) CHECK (DamagePercentage >= 0 AND DamagePercentage <= 100), -- record dmg percentage of machinery
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID)
);