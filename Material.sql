CREATE TABLE Material (
  MaterialID INT PRIMARY KEY,
  SupplierID INT NOT NULL,
  MaterialName VARCHAR(100) NOT NULL,
  MaterialDate DATE,
  Composition DECIMAL(5,2) CHECK (Composition >= 0 AND Composition <= 100),
  Stock INT CHECK (Stock >= 0),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Material (MaterialID, SupplierID, MaterialName, MaterialDate, Composition, Stock) 
VALUES
(1,  1, 'Portland Cement',           '2026-01-05', 85.50, 500),
(2,  2, 'Portland Cement',           '2026-01-08', 86.00, 350),
(3,  3, 'Washed Sand',               '2026-01-12', 94.00, 420),
(4,  4, 'Structural Steel Plate',    '2026-01-15', 98.00, 280),
(5,  5, 'Hydrated Lime',             '2026-01-20', 92.00, 600),
(6,  1, 'Washed Sand',               '2026-01-25', 92.50, 450),
(7,  2, 'Steel Rebar',               '2026-02-02', 98.50, 320),
(8,  3, 'Copper Wire',               '2026-02-06', 99.90, 550),
(9,  4, 'Steel Rebar',               '2026-02-10', 98.00, 400),
(10, 5, 'Copper Wire',               '2026-02-14', 99.50, 250),
(11, 1, 'Hydrated Lime',             '2026-02-18', 90.50, 280),
(12, 2, 'Structural Steel Plate',    '2026-02-22', 97.50, 360),
(13, 3, 'Gypsum Plaster',            '2026-03-01', 93.00, 520),
(14, 4, 'Gypsum Plaster',            '2026-03-05', 91.50, 200),
(15, 5, 'Portland Cement',           '2026-03-09', 85.00, 650),
(16, 1, 'Crushed Granite Aggregate', '2026-03-13', 72.00, 300),
(17, 2, 'Crushed Granite Aggregate', '2026-03-17', 71.00, 570),
(18, 3, 'Washed Sand',               '2026-03-21', 93.50, 390),
(19, 4, 'Crushed Granite Aggregate', '2026-03-25', 73.50, 275),
(20, 5, 'Steel Rebar',               '2026-03-29', 97.80, 610);