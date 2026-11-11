CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT NOT NULL, -- Foreign key referencing OrderID in PurchaseOrder table
    ReceivedBy INT, -- Foreign key referencing StaffID in Staff table
    ReceivedDate DATE,
    Remarks TEXT,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (ReceivedBy) REFERENCES Staff(StaffID)
);

INSERT INTO Delivery (DeliveryID, OrderID, ReceivedBy, ReceivedDate, Remarks)
VALUES
(1, 1, 4, '2026-01-02', 'Delivered on schedule, no visible damage'),
(2, 2, 5, '2026-01-05', 'Delivered on schedule'),
(3, 3, 15, '2026-01-09', 'Delivered on schedule'),
(4, 4, 16, '2026-01-12', 'Delivered on schedule'),
(5, 5, 19, '2026-01-17', 'Delivered 1 day late'),
(6, 6, 4, '2026-01-19', 'Delivered on schedule'),
(7, 7, 5, '2026-01-23', 'Delivered on schedule'),
(8, 8, 15, '2026-01-26', 'Delivered on schedule'),
(9, 9, 16, '2026-01-05', 'Minor packaging damage, machine unaffected'),
(10, 10, 19, '2026-01-08', 'Delivered on schedule'),
(11, 11, 4, '2026-01-12', 'Delivered on schedule'),
(12, 12, 5, '2026-01-15', 'Delivered on schedule'),
(13, 13, 15, '2026-01-20', 'Delivered on schedule'),
(14, 14, 16, '2026-01-22', 'Delivered on schedule'),
(15, 15, 19, '2026-01-25', 'Delivered on schedule'),
(16, 16, 4, '2026-01-27', 'Delivered on schedule'),
(17, 17, 5, '2026-01-29', 'Delivered on schedule'),
(18, 18, 15, '2026-02-01', 'Delivered on schedule'),
(19, 19, 16, '2026-02-04', 'Delivered on schedule'),
(20, 20, 19, '2026-02-06', 'Delivered on schedule'),
(21, 21, 4, '2026-01-05', 'Delivered on schedule'),
(22, 22, 5, '2026-01-08', 'Delivered on schedule'),
(23, 23, 15, '2026-01-12', 'Delivered on schedule'),
(24, 24, 16, '2026-01-15', 'Delivered on schedule'),
(25, 25, 19, '2026-01-20', 'Delivered on schedule'),
(26, 26, 4, '2026-01-25', 'Delivered on schedule'),
(27, 27, 5, '2026-02-02', 'Delivered on schedule'),
(28, 28, 15, '2026-02-06', 'Delivered on schedule'),
(29, 29, 16, '2026-02-10', 'Delivered on schedule'),
(30, 30, 19, '2026-02-14', 'Delivered on schedule'),
(31, 31, 4, '2026-02-18', 'Delivered on schedule'),
(32, 32, 5, '2026-02-22', 'Delivered on schedule'),
(33, 33, 15, '2026-03-01', 'Delivered on schedule'),
(34, 34, 16, '2026-03-05', 'Delivered on schedule'),
(35, 35, 19, '2026-03-09', 'Delivered on schedule'),
(36, 36, 4, '2026-03-13', 'Delivered on schedule'),
(37, 37, 5, '2026-03-17', 'Delivered on schedule'),
(38, 38, 15, '2026-03-21', 'Delivered on schedule'),
(39, 39, 16, '2026-03-25', 'Delivered on schedule'),
(40, 40, 19, '2026-03-29', 'Delivered on schedule');

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

CREATE TABLE Laser_scans(
  LaserID INT PRIMARY KEY,
  LaserDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Laser_scans (LaserID, LaserDate, Description, Status) VALUES
(1,  '2026-01-09', '3D laser scan of chassis - within tolerance', 1),
(2,  '2026-01-11', 'Laser alignment scan of drive shaft - aligned', 1),
(3,  '2026-01-16', '3D laser scan of frame - warping of 1.2 mm detected', 0),
(4,  '2026-01-18', '3D laser scan of chassis - within tolerance', 1),
(5,  '2026-01-23', 'Laser alignment scan of rollers - aligned', 1),
(6,  '2026-01-25', 'Surface flatness scan of base plate - within tolerance', 1),
(7,  '2026-01-30', '3D laser scan of housing - within tolerance', 1),
(8,  '2026-02-01', 'Laser alignment scan of drive shaft - aligned', 1),
(9,  '2026-02-06', 'Surface flatness scan of base plate - within tolerance', 1),
(10, '2026-02-08', '3D laser scan of frame - dent of 2 mm detected', 0),
(11, '2026-02-13', '3D laser scan of chassis - within tolerance', 1),
(12, '2026-02-15', 'Laser alignment scan of rollers - aligned', 1),
(13, '2026-02-20', 'Surface flatness scan of base plate - within tolerance', 1),
(14, '2026-02-22', '3D laser scan of housing - within tolerance', 1),
(15, '2026-02-27', 'Laser alignment scan of drive shaft - misaligned by 0.8 mm', 0),
(16, '2026-03-01', '3D laser scan of chassis - within tolerance', 1),
(17, '2026-03-06', 'Surface flatness scan of base plate - within tolerance', 1),
(18, '2026-03-08', '3D laser scan of frame - within tolerance', 1),
(19, '2026-03-13', 'Laser alignment scan of rollers - aligned', 1),
(20, '2026-03-15', '3D laser scan of housing - within tolerance', 1);

CREATE TABLE IF NOT EXISTS MaintenanceRecord(
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

CREATE TABLE Quality_control(
  QualityID INT PRIMARY KEY,
  QualityDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Quality_control (QualityID, QualityDate, Description, Status) VALUES
(1,'2026-01-07', 'Surface finish and paint inspection - meets standard', 1),
(2,'2026-01-09', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(3,'2026-01-14', 'Weld seam visual inspection - passed', 1),
(4,'2026-01-16', 'Component labelling and serial number check - passed', 1),
(5,'2026-01-21', 'Electrical wiring and insulation check - passed', 1),
(6,'2026-01-23', 'Surface finish inspection - paint peeling found', 0),
(7,'2026-01-28', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(8,'2026-01-30', 'Fastener torque check - passed', 1),
(9,'2026-02-04', 'Weld seam visual inspection - passed', 1),
(10,'2026-02-06', 'Lubrication system check - passed', 1),
(11,'2026-02-11', 'Electrical wiring check - loose terminal found', 0),
(12,'2026-02-13', 'Surface finish and paint inspection - meets standard', 1),
(13,'2026-02-18', 'Fastener torque check - passed', 1),
(14,'2026-02-20', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(15,'2026-02-25', 'Safety guard and emergency stop check - passed', 1),
(16,'2026-02-27', 'Lubrication system check - passed', 1),
(17,'2026-03-04', 'Weld seam visual inspection - porosity found', 0),
(18,'2026-03-06', 'Component labelling and serial number check - passed', 1),
(19,'2026-03-11', 'Safety guard and emergency stop check - passed', 1),
(20,'2026-03-13', 'Electrical wiring and insulation check - passed', 1);

CREATE TABLE Stress_test(
  StressID INT PRIMARY KEY,
  StressDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Stress_test (StressID, StressDate, Description, Status) VALUES
(1, '2026-01-05','Load test at 120% rated capacity - no deformation', 1),
(2, '2026-01-07','Vibration endurance test 48 hours - passed', 1),
(3, '2026-01-12','Thermal cycling -10C to 80C - hairline crack at weld', 0),
(4, '2026-01-14','Static load test on main frame - passed', 1),
(5, '2026-01-19','Fatigue test 10,000 cycles - passed', 1),
(6, '2026-01-21','Torsion test on drive shaft - deformation above limit', 0),
(7, '2026-01-26','Overload test at 150% - passed with minor flex', 1),
(8, '2026-01-28','Hydraulic pressure test at 200 bar - passed', 1),
(9, '2026-02-02','Impact resistance test on housing - passed', 1),
(10,'2026-02-04','Vibration endurance test 48 hours - bearing overheating', 0),
(11,'2026-02-09','Load test at 120% rated capacity - passed', 1),
(12,'2026-02-11','Static load test on boom arm - passed', 1),
(13,'2026-02-16','Fatigue test 10,000 cycles - passed', 1),
(14,'2026-02-18','Thermal cycling -10C to 80C - seal leakage detected', 0),
(15,'2026-02-23','Hydraulic pressure test at 200 bar - passed', 1),
(16,'2026-02-25','Overload test at 150% - passed', 1),
(17,'2026-03-02','Impact resistance test on housing - passed', 1),
(18,'2026-03-04','Torsion test on drive shaft - shaft cracked', 0),
(19,'2026-03-09','Static load test on main frame - passed', 1),
(20,'2026-03-11','Vibration endurance test 48 hours - passed', 1);

CREATE TABLE Supplier(
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(100),
  ContactDetails VARCHAR(100)
  );
  
INSERT INTO Supplier (SupplierID, SupplierName, ContactDetails) 
VALUES
(1, 'BuildPro Construction Supplies', 'sales@buildpro.com'),
(2, 'Titan Heavy Equipment', '+60-12-345-6781'),
(3, 'Cemex Building Materials', 'contact@cemexbuild.com'),
(4, 'Apex Crane and Lifting Solutions', '+60-12-345-6782'),
(5, 'SteelCore Manufacturing', 'sales@steelcore.com'),
(6, 'Prime Earthmoving Equipment', '+60-12-345-6783'),
(7, 'RoadMaster Machinery', 'support@roadmaster.com'),
(8, 'HeavyHaul Transport Solutions', '+60-12-345-6784'),
(9, 'TerraBuild Machinery', 'info@terrabuild.com'),
(10, 'ConcreteTech Equipment', '+60-12-345-6785'),
(11, 'PowerLift Industrial Supplies', 'sales@powerlift.com'),
(12, 'AsphaltPro Construction Systems', '+60-12-345-6786'),
(13, 'GroundForce Engineering', 'contact@groundforce.com'),
(14, 'Compac Construction Equipment', '+60-12-345-6787'),
(15, 'SkyReach Crane Services', 'info@skyreach.com'),
(16, 'ReadyMix Concrete Solutions', '+60-12-345-6788'),
(17, 'FoundationWorks Engineering', 'sales@foundationworks.com'),
(18, 'SafeHeight Access Equipment', '+60-12-345-6789'),
(19, 'RockSolid Building Materials', 'contact@rocksolid.com'),
(20, 'DemolishPro Machinery', '+60-12-345-6790');

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
(1, 1, 'Hydraulic Excavator', 'Heavy-duty excavator used for digging trenches, foundations and moving soil', NULL, 'Available'),
(2, 2, 'Tower Crane', 'Tall construction crane used for lifting and moving heavy materials on building sites', NULL, 'Out of Service'),
(3, 3, 'Concrete Mixer', 'Equipment used for mixing cement, sand, gravel and water to produce concrete', NULL, 'Available'),
(4, 4, 'Bulldozer', 'Heavy tracked machine used for pushing soil, clearing land and leveling construction sites', NULL, 'Available'),
(5, 5, 'Mobile Crane', 'Truck-mounted crane used for lifting and transporting heavy construction materials', NULL, 'In Use'),
(6, 6, 'Wheel Loader', 'Heavy equipment used for loading soil, sand and construction materials into trucks', NULL, 'Available'),
(7, 6, 'Road Roller', 'Compaction machine used for flattening and compacting soil and asphalt surfaces', NULL, 'Under Maintenance'),
(8, 6, 'Dump Truck', 'Heavy vehicle designed for transporting and unloading sand, gravel and construction debris', NULL, 'Available'),
(9, 9, 'Backhoe Loader', 'Versatile construction machine equipped with a front loader and rear digging bucket', NULL, 'Available'),
(10, 10, 'Concrete Pump Truck', 'Truck-mounted equipment used to pump liquid concrete to construction locations', NULL, 'Available'),
(11, 11, 'Forklift', 'Industrial lifting vehicle used for transporting and stacking construction materials', NULL, 'Under Maintenance'),
(12, 12, 'Asphalt Paver', 'Machine used for laying and spreading asphalt during road construction', NULL, 'In Use'),
(13, 13, 'Motor Grader', 'Construction machine used for leveling and smoothing ground surfaces and roads', NULL, 'Available'),
(14, 14, 'Vibratory Plate Compactor', 'Compaction equipment used for compressing soil and gravel in smaller construction areas', NULL, 'Available'),
(15, 15, 'Crawler Crane', 'Tracked crane designed for lifting heavy loads on uneven construction terrain', NULL, 'Available'),
(16, 16, 'Concrete Batching Plant', 'Equipment used for measuring and mixing concrete ingredients in large quantities', NULL, 'Available'),
(17, 17, 'Pile Driver', 'Heavy construction equipment used to drive piles into the ground for building foundations', NULL, 'Available'),
(18, 18, 'Scissor Lift', 'Mobile elevated work platform used for lifting workers and tools to higher working areas', NULL, 'Available'),
(19, 19, 'Trench Compactor', 'Specialized equipment used for compacting soil inside narrow trenches and confined spaces', NULL, 'Available'),
(20, 20, 'Demolition Excavator', 'Specialized excavator equipped with attachments for demolishing concrete structures and buildings', NULL, 'Available');

CREATE TABLE IF NOT EXISTS Staff(
    StaffID INT PRIMARY KEY,
    EngineerName VARCHAR(100),
    Role VARCHAR(50) NOT NULL
        CHECK (Role IN ('Engineer', 'Technical Staff', 'Procurement Officer', 'Compliance Officer', 'Admin'))
);

INSERT INTO Staff (StaffID, EngineerName, Role) 
VALUES
(1, 'John Smith', 'Engineer'),
(2, 'Emily Johnson', 'Engineer'),
(3, 'Michael Brown', 'Engineer'),
(4, 'Sarah Davis', 'Technical Staff'),
(5, 'David Wilson', 'Technical Staff'),
(6, 'Jessica Martinez', 'Procurement Officer'),
(7, 'Daniel Anderson', 'Procurement Officer'),
(8, 'Olivia Thomas', 'Procurement Officer'),
(9, 'James Taylor', 'Compliance Officer'),
(10, 'Sophia Moore', 'Compliance Officer'),
(11, 'Liam Jackson', 'Admin'),
(12, 'William Jackson', 'Admin'),
(13, 'Ava White', 'Engineer'),
(14, 'Alexander Harris', 'Engineer'),
(15, 'Mia Clark', 'Technical Staff'),
(16, 'Benjamin Lewis', 'Technical Staff'),
(17, 'Charlotte Robinson', 'Procurement Officer'),
(18, 'Ethan Walker', 'Compliance Officer'),
(19, 'Amelia Hall', 'Technical Staff'),
(20, 'Lucas Allen', 'Admin');

CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
    RequestBy INT, -- Foreign key referencing StaffID in Staff table
    ApprovedBy INT, -- Foreign key referencing StaffID in Staff table
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status VARCHAR(25),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (RequestBy) REFERENCES Staff(StaffID),
    FOREIGN KEY (ApprovedBy) REFERENCES Staff(StaffID),
    CHECK (ApprovedBy <> RequestBy)
);

INSERT INTO PurchaseOrder
(OrderID, SupplierID, RequestBy, ApprovedBy, OrderDate, ExpectedDeliveryDate, Status)
VALUES
-- Machinery purchase orders (1–20)
(1,  1,  6, 11, '2025-12-15', '2026-01-02', 'Delivered'),
(2,  2,  7, 12, '2025-12-18', '2026-01-05', 'Delivered'),
(3,  3,  8, 11, '2025-12-22', '2026-01-09', 'Delivered'),
(4,  4, 17, 12, '2025-12-26', '2026-01-12', 'Delivered'),
(5,  5,  6, 20, '2025-12-30', '2026-01-16', 'Delivered'),
(6,  6,  7, 11, '2026-01-02', '2026-01-19', 'Delivered'),
(7,  6,  6, 11, '2026-01-02', '2026-01-23', 'Delivered'),
(8,  6,  7, 12, '2026-01-02', '2026-01-26', 'Delivered'),
(9,  9,  8, 20, '2025-12-28', '2026-01-05', 'Delivered'),
(10, 10, 17, 11, '2026-01-02', '2026-01-08', 'Delivered'),
(11, 11,  6, 12, '2026-01-06', '2026-01-12', 'Delivered'),
(12, 12,  7, 20, '2026-01-09', '2026-01-15', 'Delivered'),
(13, 13,  8, 11, '2026-01-14', '2026-01-20', 'Delivered'),
(14, 14, 17, 12, '2026-01-16', '2026-01-22', 'Delivered'),
(15, 15,  6, 20, '2026-01-18', '2026-01-25', 'Delivered'),
(16, 16,  7, 11, '2026-01-20', '2026-01-27', 'Delivered'),
(17, 17,  8, 12, '2026-01-22', '2026-01-29', 'Delivered'),
(18, 18,  6, 20, '2026-01-25', '2026-02-01', 'Delivered'),
(19, 19, 17, 11, '2026-01-28', '2026-02-04', 'Delivered'),
(20, 20,  7, 12, '2026-01-30', '2026-02-06', 'Delivered'),

-- Material purchase orders (21–40)
(21,  1,  6, 11, '2025-12-29', '2026-01-05', 'Delivered'),
(22,  2,  7, 12, '2025-12-31', '2026-01-08', 'Delivered'),
(23,  3,  8, 11, '2026-01-04', '2026-01-12', 'Delivered'),
(24,  4, 17, 12, '2026-01-07', '2026-01-15', 'Delivered'),
(25,  5,  6, 20, '2026-01-12', '2026-01-20', 'Delivered'),
(26,  1,  7, 11, '2026-01-17', '2026-01-25', 'Delivered'),
(27,  2,  8, 12, '2026-01-25', '2026-02-02', 'Delivered'),
(28,  3,  6, 20, '2026-01-29', '2026-02-06', 'Delivered'),
(29,  4,  7, 11, '2026-02-02', '2026-02-10', 'Delivered'),
(30,  5,  8, 12, '2026-02-06', '2026-02-14', 'Delivered'),
(31,  1, 17, 20, '2026-02-10', '2026-02-18', 'Delivered'),
(32,  2,  6, 11, '2026-02-14', '2026-02-22', 'Delivered'),
(33,  3,  7, 12, '2026-02-21', '2026-03-01', 'Delivered'),
(34,  4,  8, 20, '2026-02-25', '2026-03-05', 'Delivered'),
(35,  5, 17, 11, '2026-03-02', '2026-03-09', 'Delivered'),
(36,  1,  6, 12, '2026-03-06', '2026-03-13', 'Delivered'),
(37,  2,  7, 20, '2026-03-10', '2026-03-17', 'Delivered'),
(38,  3,  8, 11, '2026-03-14', '2026-03-21', 'Delivered'),
(39,  4, 17, 12, '2026-03-18', '2026-03-25', 'Delivered'),
(40,  5,  6, 20, '2026-03-22', '2026-03-29', 'Delivered'),

-- Restock orders still waiting for delivery (41-42)
(41,  3,  6, 11, '2026-04-06', '2026-04-14', 'Pending'),
(42,  5,  7, 12, '2026-04-10', '2026-04-18', 'Pending');

CREATE TABLE PurchaseOrderMachinery (
    OrderID INT,
    MachineryID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    PRIMARY KEY (OrderID, MachineryID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID)
);

INSERT INTO PurchaseOrderMachinery (OrderID, MachineryID, UnitPrice) 
VALUES
(1, 1, 48500.00),
(2, 2, 125000.00),
(3, 3, 89000.00),
(4, 4, 76500.00),
(5, 5, 112000.00),
(6, 6, 18900.00),
(7, 9, 9800.00),
(8, 10, 14500.00),
(9, 3, 89500.00),
(10, 2, 125000.00),
(11, 5, 112000.00),
(12, 6, 18900.00),
(13, 7, 54000.00),
(14, 8, 38500.00),
(15, 9, 9800.00),
(16, 1, 48500.00),
(17, 2, 128000.00),
(18, 3, 90000.00),
(19, 4, 77000.00),
(20, 5, 115000.00);

CREATE TABLE PurchaseOrderMaterial (
    OrderID INT,
    MaterialID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    PRIMARY KEY (OrderID, MaterialID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

INSERT INTO PurchaseOrderMaterial (OrderID, MaterialID, Quantity, UnitPrice)
VALUES
(21, 1, 500, 15.00),
(22, 2, 350, 15.00),
(23, 3, 500, 9.80),
(24, 4, 280, 45.00),
(25, 5, 600, 6.20),
(26, 6, 450, 8.75),
(27, 7, 320, 22.40),
(28, 8, 550, 31.00),
(29, 9, 400, 18.60),
(30, 10, 250, 27.30),
(31, 11, 280, 6.50),
(32, 12, 360, 45.00),
(33, 13, 520, 12.00),
(34, 14, 200, 12.00),
(35, 15, 650, 15.50),
(36, 16, 300, 20.00),
(37, 17, 570, 20.00),
(38, 18, 390, 10.00),
(39, 19, 275, 20.00),
(40, 20, 610, 23.00),
(41, 3, 300, 9.80),
(41, 8, 200, 31.00),
(42, 5, 250, 6.20);
