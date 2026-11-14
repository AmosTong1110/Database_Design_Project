CREATE TABLE Initial_check (
    InitialCheckID INT PRIMARY KEY,
    MachineryID INT NOT NULL UNIQUE,
    RecordDate DATE,
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID)
);

INSERT INTO Initial_check (InitialCheckID, MachineryID, RecordDate) VALUES
(1, 1, '2026-01-10'),
(2, 2, '2026-01-12'),
(3, 3, '2026-01-17'),
(4, 4, '2026-01-19'),
(5, 5, '2026-01-24'),
(6, 6, '2026-01-26'),
(7, 7, '2026-01-31'),
(8, 8, '2026-02-02'),
(9, 9, '2026-02-07'),
(10, 10, '2026-02-09'),
(11, 11, '2026-02-14'),
(12, 12, '2026-02-16'),
(13, 13, '2026-02-21'),
(14, 14, '2026-02-23'),
(15, 15, '2026-02-28'),
(16, 16, '2026-03-02'),
(17, 17, '2026-03-07'),
(18, 18, '2026-03-09'),
(19, 19, '2026-03-14'),
(20, 20, '2026-03-16');
