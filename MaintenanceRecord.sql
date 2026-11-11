CREATE TABLE MaintenanceRecord(
    RecordID INT PRIMARY KEY,
    StaffID INT, -- foreign key to Staff table
    MachineryID INT, -- foreign key to Machinery table
    RecordType VARCHAR(50), -- type of maintenance performed
    CreatedDate DATE,
    PhotoPath VARCHAR(255),
    DamagePercentage DECIMAL(5,2) CHECK (DamagePercentage >= 0 AND DamagePercentage <= 100), -- record dmg percentage of machinery
    PreviousRecordID INT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID),
    FOREIGN KEY (PreviousRecordID) REFERENCES MaintenanceRecord(RecordID)
);

INSERT INTO MaintenanceRecord (RecordID, StaffID, MachineryID, RecordType, CreatedDate, PhotoPath, DamagePercentage, PreviousRecordID)
VALUES
    (1,  1, 1, 'Routine Inspection',  '2026-01-20', 'photos/maintenance/rec_01.jpg',  0.00, NULL),
    (2,  2, 2, 'Lubrication',         '2026-01-22', 'photos/maintenance/rec_02.jpg',  5.50, NULL),
    (3,  3, 3, 'Component Repair',    '2026-01-27', 'photos/maintenance/rec_03.jpg', 25.00, NULL),
    (4,  4, 4, 'Safety Check',        '2026-01-29', 'photos/maintenance/rec_04.jpg',  2.00, NULL),
    (5,  5, 5, 'Motor Replacement',   '2026-01-31', 'photos/maintenance/rec_05.jpg', 65.00, NULL),
    (6,  1, 2, 'Routine Inspection',  '2026-02-02', 'photos/maintenance/rec_06.jpg',  0.00, 2),
    (7,  2, 3, 'Belt Replacement',    '2026-02-05', 'photos/maintenance/rec_07.jpg', 18.50, 3),
    (8,  3, 4, 'Electrical Repair',   '2026-02-10', 'photos/maintenance/rec_08.jpg', 35.00, 4),
    (9,  4, 5, 'Lubrication',         '2026-02-14', 'photos/maintenance/rec_09.jpg',  4.00, 5),
    (10, 5, 1, 'Hydraulic Repair',    '2026-02-18', 'photos/maintenance/rec_10.jpg', 42.75, 1),
    (11, 1, 3, 'Safety Check',        '2026-03-01', 'photos/maintenance/rec_11.jpg',  1.50, 7),
    (12, 2, 4, 'Component Repair',    '2026-03-05', 'photos/maintenance/rec_12.jpg', 28.00, 8),
    (13, 3, 5, 'Routine Inspection',  '2026-03-09', 'photos/maintenance/rec_13.jpg',  0.00, 9),
    (14, 4, 1, 'Bearing Replacement', '2026-03-13', 'photos/maintenance/rec_14.jpg', 55.25, 10),
    (15, 5, 2, 'Electrical Repair',   '2026-03-18', 'photos/maintenance/rec_15.jpg', 32.00, 6),
    (16, 1, 4, 'Lubrication',         '2026-04-02', 'photos/maintenance/rec_16.jpg',  3.50, 12),
    (17, 2, 5, 'Motor Replacement',   '2026-04-07', 'photos/maintenance/rec_17.jpg', 78.00, 13),
    (18, 3, 1, 'Safety Check',        '2026-04-12', 'photos/maintenance/rec_18.jpg',  0.50, 14),
    (19, 4, 2, 'Hydraulic Repair',    '2026-04-17', 'photos/maintenance/rec_19.jpg', 46.00, 15),
    (20, 5, 3, 'Routine Inspection',  '2026-04-22', 'photos/maintenance/rec_20.jpg',  0.00, 11),
    (21, 4, 7,  'Hydraulic Repair', '2026-03-10', 'photos/maintenance/rec_21.jpg', 38.00, NULL),
    (22, 5, 11, 'Safety Check',     '2026-03-12', 'photos/maintenance/rec_22.jpg', 22.50, NULL);