DROP TABLE IF EXISTS Initial_check;

CREATE TABLE Initial_check (
    InitialCheckID INT PRIMARY KEY,
    MachineryID INT NOT NULL UNIQUE,
    RecordDate DATE,
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID)
);

INSERT INTO Initial_check (InitialCheckID, MachineryID, RecordDate) VALUES
(1, 1, '2026-01-05'),
(2, 2, '2026-01-07'),
(3, 3, '2026-01-12'),
(4, 4, '2026-01-14'),
(5, 5, '2026-01-19'),
(6, 6, '2026-01-21'),
(7, 7, '2026-01-26'),
(8, 8, '2026-01-28'),
(9, 9, '2026-02-02'),
(10, 10, '2026-02-04'),
(11, 11, '2026-02-09'),
(12, 12, '2026-02-11'),
(13, 13, '2026-02-16'),
(14, 14, '2026-02-18'),
(15, 15, '2026-02-23'),
(16, 16, '2026-02-25'),
(17, 17, '2026-03-02'),
(18, 18, '2026-03-04'),
(19, 19, '2026-03-09'),
(20, 20, '2026-03-11');
