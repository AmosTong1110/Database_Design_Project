CREATE TABLE Material (
  MaterialID INT PRIMARY KEY,
  SupplierID INT NOT NULL,
  MaterialName VARCHAR(100) NOT NULL,
  MaterialDate DATE,
  Composition VARCHAR(255), -- full breakdown of the material's chemical composition
  Stock INT CHECK (Stock >= 0),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Material (MaterialID, SupplierID, MaterialName, MaterialDate, Composition, Stock)
VALUES
(1,  1, 'Portland Cement',           '2026-01-05', 'Calcium silicates 85.5%, calcium aluminates 8.0%, gypsum 5.0%, other 1.5%', 500),
(2,  2, 'Portland Cement',           '2026-01-08', 'Calcium silicates 86.0%, calcium aluminates 7.5%, gypsum 5.0%, other 1.5%', 350),
(3,  3, 'Washed Sand',               '2026-01-12', 'Silica 94.0%, feldspar 4.0%, other minerals 2.0%', 420),
(4,  4, 'Structural Steel Plate',    '2026-01-15', 'Iron 98.0%, carbon 0.3%, manganese 1.2%, other 0.5%', 280),
(5,  5, 'Hydrated Lime',             '2026-01-20', 'Calcium hydroxide 92.0%, calcium carbonate 5.0%, other 3.0%', 600),
(6,  1, 'Washed Sand',               '2026-01-25', 'Silica 92.5%, feldspar 5.0%, other minerals 2.5%', 450),
(7,  2, 'Steel Rebar',               '2026-02-02', 'Iron 98.5%, carbon 0.4%, manganese 0.8%, other 0.3%', 320),
(8,  3, 'Copper Wire',               '2026-02-06', 'Copper 99.9%, other metals 0.1%', 550),
(9,  4, 'Steel Rebar',               '2026-02-10', 'Iron 98.0%, carbon 0.4%, manganese 1.2%, other 0.4%', 400),
(10, 5, 'Copper Wire',               '2026-02-14', 'Copper 99.5%, other metals 0.5%', 250),
(11, 1, 'Hydrated Lime',             '2026-02-18', 'Calcium hydroxide 90.5%, calcium carbonate 6.0%, other 3.5%', 280),
(12, 2, 'Structural Steel Plate',    '2026-02-22', 'Iron 97.5%, carbon 0.3%, manganese 1.5%, other 0.7%', 360),
(13, 3, 'Gypsum Plaster',            '2026-03-01', 'Calcium sulfate 93.0%, calcium carbonate 4.0%, other 3.0%', 520),
(14, 4, 'Gypsum Plaster',            '2026-03-05', 'Calcium sulfate 91.5%, calcium carbonate 5.0%, other 3.5%', 200),
(15, 5, 'Portland Cement',           '2026-03-09', 'Calcium silicates 85.0%, calcium aluminates 8.5%, gypsum 5.0%, other 1.5%', 650),
(16, 1, 'Crushed Granite Aggregate', '2026-03-13', 'Silica 72.0%, alumina 14.0%, other minerals 14.0%', 300),
(17, 2, 'Crushed Granite Aggregate', '2026-03-17', 'Silica 71.0%, alumina 14.5%, other minerals 14.5%', 570),
(18, 3, 'Washed Sand',               '2026-03-21', 'Silica 93.5%, feldspar 4.5%, other minerals 2.0%', 390),
(19, 4, 'Crushed Granite Aggregate', '2026-03-25', 'Silica 73.5%, alumina 13.5%, other minerals 13.0%', 275),
(20, 5, 'Steel Rebar',               '2026-03-29', 'Iron 97.8%, carbon 0.5%, manganese 1.2%, other 0.5%', 610);