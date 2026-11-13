CREATE TABLE Material (
  MaterialID INT PRIMARY KEY,
  SupplierID INT NOT NULL,
  MaterialName VARCHAR(100) NOT NULL,
  MaterialDate DATE,
  Stock INT CHECK (Stock >= 0),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Material (MaterialID, SupplierID, MaterialName, MaterialDate, Stock)
VALUES
(1,  1, 'Portland Cement',           '2026-01-05', 500),
(2,  2, 'Portland Cement',           '2026-01-08', 350),
(3,  3, 'Washed Sand',               '2026-01-12', 420),
(4,  4, 'Structural Steel Plate',    '2026-01-15', 280),
(5,  5, 'Hydrated Lime',             '2026-01-20', 600),
(6,  1, 'Washed Sand',               '2026-01-25', 450),
(7,  2, 'Steel Rebar',               '2026-02-02', 320),
(8,  3, 'Copper Wire',               '2026-02-06', 550),
(9,  4, 'Steel Rebar',               '2026-02-10', 400),
(10, 5, 'Copper Wire',               '2026-02-14', 250),
(11, 1, 'Hydrated Lime',             '2026-02-18', 280),
(12, 2, 'Structural Steel Plate',    '2026-02-22', 360),
(13, 3, 'Gypsum Plaster',            '2026-03-01', 520),
(14, 4, 'Gypsum Plaster',            '2026-03-05', 200),
(15, 5, 'Portland Cement',           '2026-03-09', 650),
(16, 1, 'Crushed Granite Aggregate', '2026-03-13', 300),
(17, 2, 'Crushed Granite Aggregate', '2026-03-17', 570),
(18, 3, 'Washed Sand',               '2026-03-21', 390),
(19, 4, 'Crushed Granite Aggregate', '2026-03-25', 275),
(20, 5, 'Steel Rebar',               '2026-03-29', 610);
