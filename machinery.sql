CREATE TABLE Machinery(
  MachineryID INT PRIMARY KEY,
  SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
  MachineryName VARCHAR(100),
  Description VARCHAR(255),
  PhotoPath VARCHAR(255),
  Status VARCHAR(50) NOT NULL DEFAULT 'Available'
    CHECK (Status IN ('Available', 'In Use', 'Under Maintenance', 'Out of Service')),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


INSERT INTO Machinery (MachineryID, SupplierID, MachineryName, Description, PhotoPath, Status) 
VALUES
(1, 1, 'Hydraulic Press', 'High-capacity hydraulic press for metal forming', NULL, 'Available'),
(2, 2, 'CNC Milling Machine', 'Computer-controlled milling machine for precision machining', NULL, 'Out of Service'),
(3, 3, 'Industrial Robot Arm', 'Automated robotic arm for assembly line tasks', NULL, 'Available'),
(4, 4, 'Laser Cutter', 'High-precision laser cutting machine for various materials', NULL, 'Available'),
(5, 5, 'Injection Molding Machine', 'Machine for producing plastic parts through injection molding', NULL, 'In Use'),
(6, 6, '3D Printer', 'Additive manufacturing machine for creating three-dimensional objects', NULL, 'Available'),
(7, 6, 'Conveyor System', 'Automated conveyor system for material handling', NULL, 'Under Maintenance'),
(8, 6, 'Packaging Machine', 'Machine for packaging products into boxes or containers', NULL, 'Available'),
(9, 9, 'Welding Machine', 'Equipment for joining metal parts through welding processes', NULL, 'Available'),
(10, 10, 'Grinding Machine', 'Machine for surface finishing and material removal through grinding', NULL, 'Available'),
(11, 11, 'Drilling Machine', 'Machine for creating holes in various materials through drilling', NULL, 'Under Maintenance'),
(12, 12, 'Lathe Machine', 'Machine for shaping materials by rotating them against cutting tools', NULL, 'In Use'),
(13, 13, 'Press Brake', 'Machine for bending sheet metal into desired shapes', NULL, 'Available'),
(14, 14, 'Heat Treatment Furnace', 'Furnace for heat treating metals to alter their properties', NULL, 'Available'),
(15, 15, 'Surface Finishing Machine', 'Machine for polishing and finishing surfaces of materials', NULL, 'Available'),
(16, 16, 'Material Testing Equipment', 'Equipment for testing the mechanical properties of materials', NULL, 'Available'),
(17, 17, 'Assembly Line Equipment', 'Various machines and tools used in assembly line production', NULL, 'Available'),
(18, 18, 'Packaging Conveyor System', 'Conveyor system specifically designed for packaging operations', NULL, 'Available'),
(19, 19, 'Industrial Mixer', 'Machine for mixing and blending materials in industrial processes', NULL, 'Available'),
(20, 20, 'Quality Control Inspection Station', 'Station equipped with tools for quality control inspections', NULL, 'Available');