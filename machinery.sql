PRAGMA foreign_keys = ON; /*if we're doing in sqlite*/
CREATE TABLE Machinery(
  MachineryID INT PRIMARY KEY,
  SupplierID INT,
  MachineryName VARCHAR(100),
  Description VARCHAR(255),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


INSERT OR REPLACE INTO Machinery (MachineryID, SupplierID, MachineryName, Description) 
VALUES
(1, 1, 'Hydraulic Press', 'High-capacity hydraulic press for metal forming'),
(2, 2, 'CNC Milling Machine', 'Computer-controlled milling machine for precision machining'),
(3, 3, 'Industrial Robot Arm', 'Automated robotic arm for assembly line tasks'),
(4, 4, 'Laser Cutter', 'High-precision laser cutting machine for various materials'),
(5, 5, 'Injection Molding Machine', 'Machine for producing plastic parts through injection molding'),
(6, 6, '3D Printer', 'Additive manufacturing machine for creating three-dimensional objects'),
(7, 7, 'Conveyor System', 'Automated conveyor system for material handling'),
(8, 8, 'Packaging Machine', 'Machine for packaging products into boxes or containers'),
(9, 9, 'Welding Machine', 'Equipment for joining metal parts through welding processes'),
(10, 10, 'Grinding Machine', 'Machine for surface finishing and material removal through grinding');