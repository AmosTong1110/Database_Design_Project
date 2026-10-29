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
(11, 11, 'Drilling Machine', 'Machine for creating holes in various materials through drilling'),
(12, 12, 'Lathe Machine', 'Machine for shaping materials by rotating them against cutting tools'),
(13, 13, 'Press Brake', 'Machine for bending sheet metal into desired shapes'),
(14, 14, 'Heat Treatment Furnace', 'Furnace for heat treating metals to alter their properties'),
(15, 15, 'Surface Finishing Machine', 'Machine for polishing and finishing surfaces of materials'),
(16, 16, 'Material Testing Equipment', 'Equipment for testing the mechanical properties of materials'),
(17, 17, 'Assembly Line Equipment', 'Various machines and tools used in assembly line production'),
(18, 18, 'Packaging Conveyor System', 'Conveyor system specifically designed for packaging operations'),
(19, 19, 'Industrial Mixer', 'Machine for mixing and blending materials in industrial processes'),
(20, 20, 'Quality Control Inspection Station', 'Station equipped with tools for quality control inspections');