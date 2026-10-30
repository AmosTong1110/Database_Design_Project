CREATE TABLE Initial_check (
InitialCheckID INT PRIMARY KEY,
MachineryID INT ,   
RecordDate DATE,
StressID INT,   
QualityID INT,   
LaserID INT, 
FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID),
FOREIGN KEY (StressID) REFERENCES Stress_test(StressID),
FOREIGN KEY (QualityID) REFERENCES Quality_control(QualityID),
FOREIGN KEY (LaserID) REFERENCES Laser_scans(LaserID)
);

INSERT INTO Initial_check (
    InitialCheckID, MachineryID, RecordDate, StressID, QualityID, LaserID) VALUES
(1, 1, '2026-01-10', 1,  1,  1),
(2, 2, '2026-01-12', 2,  2,  2),
(3, 3, '2026-01-17', 3,  3,  3),
(4, 4, '2026-01-19', 4,  4,  4),
(5, 5, '2026-01-24', 5,  5,  5),
(6, 6, '2026-01-26', 6,  6,  6),
(7, 7, '2026-01-31', 7,  7,  7),
(8, 8, '2026-02-02', 8,  8,  8),
(9, 9, '2026-02-07', 9,  9,  9),
(10, 10, '2026-02-09', 10, 10, 10),
(11, 11, '2026-02-14', 11, 11, 11),
(12, 12, '2026-02-16', 12, 12, 12),
(13, 13, '2026-02-21', 13, 13, 13),
(14, 14, '2026-02-23', 14, 14, 14),
(15, 15, '2026-02-28', 15, 15, 15),
(16, 16, '2026-03-02', 16, 16, 16),
(17, 17, '2026-03-07', 17, 17, 17),
(18, 18, '2026-03-09', 18, 18, 18),
(19, 19, '2026-03-14', 19, 19, 19),
(20, 20, '2026-03-16', 20, 20, 20);