CREATE TABLE IF NOT EXISTS MaintenanceRecord(
    RecordID INT PRIMARY KEY,
    StaffID INT NOT NULL, -- foreign key to Staff table
    MachineryID INT NOT NULL, -- foreign key to Machinery table
    RecordType VARCHAR(50), -- type of maintenance performed
    CreatedDate DATE,
    DamagePercentage DECIMAL(5,2) CHECK (DamagePercentage >= 0 AND DamagePercentage <= 100), -- record dmg percentage of machinery
    PreviousRecordID INT UNIQUE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID),
    FOREIGN KEY (PreviousRecordID) REFERENCES MaintenanceRecord(RecordID)
);

INSERT INTO MaintenanceRecord (RecordID, StaffID, MachineryID, RecordType, CreatedDate, DamagePercentage, PreviousRecordID)
VALUES
    (1,  1, 1, 'Routine Inspection',  '2026-01-20',  0.00, NULL),
    (2,  2, 2, 'Lubrication',         '2026-01-22',  5.50, NULL),
    (3,  3, 3, 'Component Repair',    '2026-01-27', 25.00, NULL),
    (4,  4, 4, 'Safety Check',        '2026-01-29',  2.00, NULL),
    (5,  5, 5, 'Motor Replacement',   '2026-01-31', 65.00, NULL),
    (6,  1, 2, 'Routine Inspection',  '2026-02-02',  0.00, 2),
    (7,  2, 3, 'Belt Replacement',    '2026-02-05', 18.50, 3),
    (8,  3, 4, 'Electrical Repair',   '2026-02-10', 35.00, 4),
    (9,  4, 5, 'Lubrication',         '2026-02-14',  4.00, 5),
    (10, 5, 1, 'Hydraulic Repair',    '2026-02-18', 42.75, 1),
    (11, 1, 3, 'Safety Check',        '2026-03-01',  1.50, 7),
    (12, 2, 4, 'Component Repair',    '2026-03-05', 28.00, 8),
    (13, 3, 5, 'Routine Inspection',  '2026-03-09',  0.00, 9),
    (14, 4, 1, 'Bearing Replacement', '2026-03-13', 55.25, 10),
    (15, 5, 2, 'Electrical Repair',   '2026-03-18', 32.00, 6),
    (16, 1, 4, 'Lubrication',         '2026-04-02',  3.50, 12),
    (17, 2, 5, 'Motor Replacement',   '2026-04-07', 78.00, 13),
    (18, 3, 1, 'Safety Check',        '2026-04-12',  0.50, 14),
    (19, 4, 2, 'Hydraulic Repair',    '2026-04-17', 46.00, 15),
    (20, 5, 3, 'Routine Inspection',  '2026-04-22',  0.00, 11),
    (21, 4, 7,  'Hydraulic Repair',   '2026-03-10', 38.00, NULL),
    (22, 5, 11, 'Safety Check',       '2026-03-12', 22.50, NULL);
