CREATE DATABASE IF NOT EXISTS constructiondb;
USE constructiondb;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS DocumentAuditLoan, TechnicalDocument,
  MaintenanceRecord, InspectionTest, Initial_check, Delivery,
  PurchaseOrderMaterial, PurchaseOrderMachinery, PurchaseOrder, Machinery,
  MaterialComposition, Material, Staff, Supplier,
  Stress_test, Quality_control, Laser_scans;

-- =====================================================================
-- Supplier
-- =====================================================================
DROP TABLE IF EXISTS Supplier;

CREATE TABLE Supplier(
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(100),
  Phone VARCHAR(20),
  Email VARCHAR(50),
  Address VARCHAR(255)
);

INSERT INTO Supplier (SupplierID, SupplierName, Phone, Email, Address) 
VALUES
(1, 'BuildPro Construction Supplies', NULL, 'sales@buildpro.com', NULL),
(2, 'Titan Heavy Equipment', '+60-12-345-6781', NULL, NULL),
(3, 'Cemex Building Materials', NULL, 'contact@cemexbuild.com', NULL),
(4, 'Apex Crane and Lifting Solutions', '+60-12-345-6782', NULL, NULL),
(5, 'SteelCore Manufacturing', NULL, 'sales@steelcore.com', NULL),
(6, 'Prime Earthmoving Equipment', '+60-12-345-6783', NULL, NULL),
(7, 'RoadMaster Machinery', NULL, 'support@roadmaster.com', NULL),
(8, 'HeavyHaul Transport Solutions', '+60-12-345-6784', NULL, NULL),
(9, 'TerraBuild Machinery', NULL, 'info@terrabuild.com', NULL),
(10, 'ConcreteTech Equipment', '+60-12-345-6785', NULL, NULL),
(11, 'PowerLift Industrial Supplies', NULL, 'sales@powerlift.com', NULL),
(12, 'AsphaltPro Construction Systems', '+60-12-345-6786', NULL, NULL),
(13, 'GroundForce Engineering', NULL, 'contact@groundforce.com', NULL),
(14, 'Compac Construction Equipment', '+60-12-345-6787', NULL, NULL),
(15, 'SkyReach Crane Services', NULL, 'info@skyreach.com', NULL),
(16, 'ReadyMix Concrete Solutions', '+60-12-345-6788', NULL, NULL),
(17, 'FoundationWorks Engineering', NULL, 'sales@foundationworks.com', NULL),
(18, 'SafeHeight Access Equipment', '+60-12-345-6789', NULL, NULL),
(19, 'RockSolid Building Materials', NULL, 'contact@rocksolid.com', NULL),
(20, 'DemolishPro Machinery', '+60-12-345-6790', NULL, NULL);

-- =====================================================================
-- Staff
-- =====================================================================
DROP TABLE IF EXISTS Staff;

CREATE TABLE Staff(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Role VARCHAR(25) NOT NULL
        CHECK (Role IN ('Engineer', 'Technical Staff', 'Procurement Officer', 'Compliance Officer', 'Admin'))
);

INSERT INTO Staff (StaffID, StaffName, Role) 
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

-- =====================================================================
-- Material
-- =====================================================================
DROP TABLE IF EXISTS Material;

CREATE TABLE Material (
  MaterialID INT PRIMARY KEY,
  SupplierID INT NOT NULL,
  MaterialName VARCHAR(100) NOT NULL,
  StockInDate DATE,
  Stock INT CHECK (Stock >= 0),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Material (MaterialID, SupplierID, MaterialName, StockInDate, Stock)
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

-- =====================================================================
-- MaterialComposition
-- =====================================================================
DROP TABLE IF EXISTS MaterialComposition;

CREATE TABLE MaterialComposition (
    MaterialID INT NOT NULL,
    ElementName VARCHAR(50) NOT NULL,
    Percentage DECIMAL(5, 2) NOT NULL CHECK (Percentage >= 0 AND Percentage <= 100),
    PRIMARY KEY (MaterialID, ElementName),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

INSERT INTO MaterialComposition (MaterialID, ElementName, Percentage) VALUES
(1, 'Calcium Silicates', 85.50),
(1, 'Calcium Aluminates', 8.00),
(1, 'Gypsum', 5.00),
(1, 'Other', 1.50),
(2, 'Calcium Silicates', 86.00),
(2, 'Calcium Aluminates', 7.50),
(2, 'Gypsum', 5.00),
(2, 'Other', 1.50),
(3, 'Silica', 94.00),
(3, 'Feldspar', 4.00),
(3, 'Other Minerals', 2.00),
(4, 'Iron', 98.00),
(4, 'Carbon', 0.30),
(4, 'Manganese', 1.20),
(4, 'Other', 0.50),
(5, 'Calcium Hydroxide', 92.00),
(5, 'Calcium Carbonate', 5.00),
(5, 'Other', 3.00),
(6, 'Silica', 92.50),
(6, 'Feldspar', 5.00),
(6, 'Other Minerals', 2.50),
(7, 'Iron', 98.50),
(7, 'Carbon', 0.40),
(7, 'Manganese', 0.80),
(7, 'Other', 0.30),
(8, 'Copper', 99.90),
(8, 'Other Metals', 0.10),
(9, 'Iron', 98.00),
(9, 'Carbon', 0.40),
(9, 'Manganese', 1.20),
(9, 'Other', 0.40),
(10, 'Copper', 99.50),
(10, 'Other Metals', 0.50),
(11, 'Calcium Hydroxide', 90.50),
(11, 'Calcium Carbonate', 6.00),
(11, 'Other', 3.50),
(12, 'Iron', 97.50),
(12, 'Carbon', 0.30),
(12, 'Manganese', 1.50),
(12, 'Other', 0.70),
(13, 'Calcium Sulfate', 93.00),
(13, 'Calcium Carbonate', 4.00),
(13, 'Other', 3.00),
(14, 'Calcium Sulfate', 91.50),
(14, 'Calcium Carbonate', 5.00),
(14, 'Other', 3.50),
(15, 'Calcium Silicates', 85.00),
(15, 'Calcium Aluminates', 8.50),
(15, 'Gypsum', 5.00),
(15, 'Other', 1.50),
(16, 'Silica', 72.00),
(16, 'Alumina', 14.00),
(16, 'Other Minerals', 14.00),
(17, 'Silica', 71.00),
(17, 'Alumina', 14.50),
(17, 'Other Minerals', 14.50),
(18, 'Silica', 93.50),
(18, 'Feldspar', 4.50),
(18, 'Other Minerals', 2.00),
(19, 'Silica', 73.50),
(19, 'Alumina', 13.50),
(19, 'Other Minerals', 13.00),
(20, 'Iron', 97.80),
(20, 'Carbon', 0.50),
(20, 'Manganese', 1.20),
(20, 'Other', 0.50);

-- =====================================================================
-- Machinery
-- =====================================================================
DROP TABLE IF EXISTS Machinery;

CREATE TABLE Machinery(
  MachineryID INT PRIMARY KEY,
  SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
  MachineryName VARCHAR(100),
  Description VARCHAR(255),
  PhotoPath VARCHAR(255),
  Status VARCHAR(25) NOT NULL DEFAULT 'Available'
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
(6, 6, 'Wheel Loader', 'Heavy equipment used for loading soil, sand and construction materials into trucks', NULL, 'Out of Service'),
(7, 6, 'Road Roller', 'Compaction machine used for flattening and compacting soil and asphalt surfaces', NULL, 'Under Maintenance'),
(8, 6, 'Dump Truck', 'Heavy vehicle designed for transporting and unloading sand, gravel and construction debris', NULL, 'Available'),
(9, 9, 'Backhoe Loader', 'Versatile construction machine equipped with a front loader and rear digging bucket', NULL, 'Available'),
(10, 10, 'Concrete Pump Truck', 'Truck-mounted equipment used to pump liquid concrete to construction locations', NULL, 'Out of Service'),
(11, 11, 'Forklift', 'Industrial lifting vehicle used for transporting and stacking construction materials', NULL, 'Under Maintenance'),
(12, 12, 'Asphalt Paver', 'Machine used for laying and spreading asphalt during road construction', NULL, 'In Use'),
(13, 13, 'Motor Grader', 'Construction machine used for leveling and smoothing ground surfaces and roads', NULL, 'Available'),
(14, 14, 'Vibratory Plate Compactor', 'Compaction equipment used for compressing soil and gravel in smaller construction areas', NULL, 'Out of Service'),
(15, 15, 'Crawler Crane', 'Tracked crane designed for lifting heavy loads on uneven construction terrain', NULL, 'Out of Service'),
(16, 16, 'Concrete Batching Plant', 'Equipment used for measuring and mixing concrete ingredients in large quantities', NULL, 'Available'),
(17, 17, 'Pile Driver', 'Heavy construction equipment used to drive piles into the ground for building foundations', NULL, 'Out of Service'),
(18, 18, 'Scissor Lift', 'Mobile elevated work platform used for lifting workers and tools to higher working areas', NULL, 'Out of Service'),
(19, 19, 'Trench Compactor', 'Specialized equipment used for compacting soil inside narrow trenches and confined spaces', NULL, 'Available'),
(20, 20, 'Demolition Excavator', 'Specialized excavator equipped with attachments for demolishing concrete structures and buildings', NULL, 'Available');

-- =====================================================================
-- PurchaseOrder
-- =====================================================================
DROP TABLE IF EXISTS PurchaseOrder;

CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
    RequestedBy INT NOT NULL, -- Foreign key referencing StaffID in Staff table
    ApprovedBy INT, -- Foreign key referencing StaffID in Staff table
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status VARCHAR(25) CHECK (Status IN ('Pending', 'Delivered')),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (RequestedBy) REFERENCES Staff(StaffID),
    FOREIGN KEY (ApprovedBy) REFERENCES Staff(StaffID),
    CHECK (ApprovedBy <> RequestedBy)
);

INSERT INTO PurchaseOrder
(OrderID, SupplierID, RequestedBy, ApprovedBy, OrderDate, ExpectedDeliveryDate, Status)
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
(41,  3,  6, NULL, '2026-04-06', '2026-04-14', 'Pending'),
(42,  5,  7, NULL, '2026-04-10', '2026-04-18', 'Pending');

-- =====================================================================
-- PurchaseOrderMachinery
-- =====================================================================
DROP TABLE IF EXISTS PurchaseOrderMachinery;

CREATE TABLE PurchaseOrderMachinery (
    OrderID INT,
    MachineryID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    Quantity INT NOT NULL DEFAULT 1 CHECK (Quantity > 0),
    PRIMARY KEY (OrderID, MachineryID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID)
);

INSERT INTO PurchaseOrderMachinery (OrderID, MachineryID, UnitPrice, Quantity)
VALUES
(1,  1, 48500.00, 1),
(2,  2, 125000.00, 1),
(3,  3, 89000.00, 1),
(4,  4, 76500.00, 1),
(5,  5, 112000.00, 1),
(6,  6, 18900.00, 1),
(7,  7, 54000.00, 1),
(8,  8, 38500.00, 1),
(9,  9, 9800.00, 1),
(10, 10, 14500.00, 1),
(11, 11, 18900.00, 1),
(12, 12, 250000.00, 1),
(13, 13, 180000.00, 1),
(14, 14, 5400.00, 1),
(15, 15, 540000.00, 1),
(16, 16, 385000.00, 1),
(17, 17, 128000.00, 1),
(18, 18, 38500.00, 1),
(19, 19, 9800.00, 1),
(20, 20, 125000.00, 1);

-- =====================================================================
-- PurchaseOrderMaterial
-- =====================================================================
DROP TABLE IF EXISTS PurchaseOrderMaterial;

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

-- =====================================================================
-- Delivery
-- =====================================================================
DROP TABLE IF EXISTS Delivery;

CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT NOT NULL, 
    ReceivedBy INT NOT NULL, 
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

-- =====================================================================
-- Initial_check
-- =====================================================================
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

-- =====================================================================
-- InspectionTest
-- =====================================================================
DROP TABLE IF EXISTS InspectionTest;

CREATE TABLE InspectionTest (
    TestID INT PRIMARY KEY,
    InitialCheckID INT NOT NULL,
    TestType VARCHAR(50) NOT NULL CHECK (TestType IN ('Stress Test', 'Quality Control', 'Laser Scan')),
    TestDate DATE NOT NULL,
    Description TEXT,
    Passed BOOLEAN NOT NULL,
    FOREIGN KEY (InitialCheckID) REFERENCES Initial_check(InitialCheckID) ON DELETE CASCADE
);

INSERT INTO InspectionTest (TestID, InitialCheckID, TestType, TestDate, Description, Passed) VALUES
(1, 1, 'Stress Test', '2026-01-10', 'Load test at 120% rated capacity - no deformation', 1),
(2, 2, 'Stress Test', '2026-01-12', 'Vibration endurance test 48 hours - passed', 1),
(3, 3, 'Stress Test', '2026-01-17', 'Thermal cycling -10C to 80C - hairline crack at weld', 0),
(4, 4, 'Stress Test', '2026-01-19', 'Static load test on main frame - passed', 1),
(5, 5, 'Stress Test', '2026-01-24', 'Fatigue test 10,000 cycles - passed', 1),
(6, 6, 'Stress Test', '2026-01-26', 'Torsion test on drive shaft - deformation above limit', 0),
(7, 7, 'Stress Test', '2026-01-31', 'Overload test at 150% - passed with minor flex', 1),
(8, 8, 'Stress Test', '2026-02-02', 'Hydraulic pressure test at 200 bar - passed', 1),
(9, 9, 'Stress Test', '2026-02-07', 'Impact resistance test on housing - passed', 1),
(10, 10, 'Stress Test', '2026-02-09', 'Vibration endurance test 48 hours - bearing overheating', 0),
(11, 11, 'Stress Test', '2026-02-14', 'Load test at 120% rated capacity - passed', 1),
(12, 12, 'Stress Test', '2026-02-16', 'Static load test on boom arm - passed', 1),
(13, 13, 'Stress Test', '2026-02-21', 'Fatigue test 10,000 cycles - passed', 1),
(14, 14, 'Stress Test', '2026-02-23', 'Thermal cycling -10C to 80C - seal leakage detected', 0),
(15, 15, 'Stress Test', '2026-02-28', 'Hydraulic pressure test at 200 bar - passed', 1),
(16, 16, 'Stress Test', '2026-03-02', 'Overload test at 150% - passed', 1),
(17, 17, 'Stress Test', '2026-03-07', 'Impact resistance test on housing - passed', 1),
(18, 18, 'Stress Test', '2026-03-09', 'Torsion test on drive shaft - shaft cracked', 0),
(19, 19, 'Stress Test', '2026-03-14', 'Static load test on main frame - passed', 1),
(20, 20, 'Stress Test', '2026-03-16', 'Vibration endurance test 48 hours - passed', 1),
(21, 1, 'Quality Control', '2026-01-07', 'Surface finish and paint inspection - meets standard', 1),
(22, 2, 'Quality Control', '2026-01-09', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(23, 3, 'Quality Control', '2026-01-14', 'Weld seam visual inspection - passed', 1),
(24, 4, 'Quality Control', '2026-01-16', 'Component labelling and serial number check - passed', 1),
(25, 5, 'Quality Control', '2026-01-21', 'Electrical wiring and insulation check - passed', 1),
(26, 6, 'Quality Control', '2026-01-23', 'Surface finish inspection - paint peeling found', 0),
(27, 7, 'Quality Control', '2026-01-28', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(28, 8, 'Quality Control', '2026-01-30', 'Fastener torque check - passed', 1),
(29, 9, 'Quality Control', '2026-02-04', 'Weld seam visual inspection - passed', 1),
(30, 10, 'Quality Control', '2026-02-06', 'Lubrication system check - passed', 1),
(31, 11, 'Quality Control', '2026-02-11', 'Electrical wiring check - loose terminal found', 0),
(32, 12, 'Quality Control', '2026-02-13', 'Surface finish and paint inspection - meets standard', 1),
(33, 13, 'Quality Control', '2026-02-18', 'Fastener torque check - passed', 1),
(34, 14, 'Quality Control', '2026-02-20', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(35, 15, 'Quality Control', '2026-02-25', 'Safety guard and emergency stop check - passed', 1),
(36, 16, 'Quality Control', '2026-02-27', 'Lubrication system check - passed', 1),
(37, 17, 'Quality Control', '2026-03-04', 'Weld seam visual inspection - porosity found', 0),
(38, 18, 'Quality Control', '2026-03-06', 'Component labelling and serial number check - passed', 1),
(39, 19, 'Quality Control', '2026-03-11', 'Safety guard and emergency stop check - passed', 1),
(40, 20, 'Quality Control', '2026-03-13', 'Electrical wiring and insulation check - passed', 1),
(41, 1, 'Laser Scan', '2026-01-09', '3D laser scan of chassis - within tolerance', 1),
(42, 2, 'Laser Scan', '2026-01-11', 'Laser alignment scan of drive shaft - aligned', 1),
(43, 3, 'Laser Scan', '2026-01-16', '3D laser scan of frame - warping of 1.2 mm detected', 0),
(44, 4, 'Laser Scan', '2026-01-18', '3D laser scan of chassis - within tolerance', 1),
(45, 5, 'Laser Scan', '2026-01-23', 'Laser alignment scan of rollers - aligned', 1),
(46, 6, 'Laser Scan', '2026-01-25', 'Surface flatness scan of base plate - within tolerance', 1),
(47, 7, 'Laser Scan', '2026-01-30', '3D laser scan of housing - within tolerance', 1),
(48, 8, 'Laser Scan', '2026-02-01', 'Laser alignment scan of drive shaft - aligned', 1),
(49, 9, 'Laser Scan', '2026-02-06', 'Surface flatness scan of base plate - within tolerance', 1),
(50, 10, 'Laser Scan', '2026-02-08', '3D laser scan of frame - dent of 2 mm detected', 0),
(51, 11, 'Laser Scan', '2026-02-13', '3D laser scan of chassis - within tolerance', 1),
(52, 12, 'Laser Scan', '2026-02-15', 'Laser alignment scan of rollers - aligned', 1),
(53, 13, 'Laser Scan', '2026-02-20', 'Surface flatness scan of base plate - within tolerance', 1),
(54, 14, 'Laser Scan', '2026-02-22', '3D laser scan of housing - within tolerance', 1),
(55, 15, 'Laser Scan', '2026-02-27', 'Laser alignment scan of drive shaft - misaligned by 0.8 mm', 0),
(56, 16, 'Laser Scan', '2026-03-01', '3D laser scan of chassis - within tolerance', 1),
(57, 17, 'Laser Scan', '2026-03-06', 'Surface flatness scan of base plate - within tolerance', 1),
(58, 18, 'Laser Scan', '2026-03-08', '3D laser scan of frame - within tolerance', 1),
(59, 19, 'Laser Scan', '2026-03-13', 'Laser alignment scan of rollers - aligned', 1),
(60, 20, 'Laser Scan', '2026-03-15', '3D laser scan of housing - within tolerance', 1);

-- =====================================================================
-- MaintenanceRecord
-- =====================================================================
DROP TABLE IF EXISTS MaintenanceRecord;

CREATE TABLE IF NOT EXISTS MaintenanceRecord(
    RecordID INT PRIMARY KEY,
    StaffID INT NOT NULL, -- foreign key to Staff table
    MachineryID INT NOT NULL, -- foreign key to Machinery table
    RecordType VARCHAR(50), -- type of maintenance performed
    CreatedDate DATE,
    DamagePercentage DECIMAL(5,2) CHECK (DamagePercentage >= 0 AND DamagePercentage <= 100), -- record dmg percentage of machinery
    PreviousRecordID INT UNIQUE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID),
    FOREIGN KEY (PreviousRecordID) REFERENCES MaintenanceRecord(RecordID)
);

INSERT INTO MaintenanceRecord (RecordID, StaffID, MachineryID, RecordType, CreatedDate, DamagePercentage, PreviousRecordID)
VALUES
    (1,  1, 1, 'Routine Inspection',  '2026-01-20',  0.00, NULL),
    (2,  2, 2, 'Lubrication',         '2026-01-22',  5.50, NULL),
    (3,  3, 3, 'Component Repair',    '2026-01-27', 25.00, NULL),
    (4,  4, 4, 'Safety Check',        '2026-01-29',  2.00, NULL),
    (5,  5, 5, 'Motor Replacement',   '2026-01-31', 65.00, NULL),
    (6,  1, 2, 'Routine Inspection',  '2026-02-02',  0.00, 2),
    (7,  2, 3, 'Belt Replacement',    '2026-02-05', 18.50, 3),
    (8,  3, 4, 'Electrical Repair',   '2026-02-10', 35.00, 4),
    (9,  4, 5, 'Lubrication',         '2026-02-14',  4.00, 5),
    (10, 5, 1, 'Hydraulic Repair',    '2026-02-18', 42.75, 1),
    (11, 1, 3, 'Safety Check',        '2026-03-01',  1.50, 7),
    (12, 2, 4, 'Component Repair',    '2026-03-05', 28.00, 8),
    (13, 3, 5, 'Routine Inspection',  '2026-03-09',  0.00, 9),
    (14, 4, 1, 'Bearing Replacement', '2026-03-13', 55.25, 10),
    (15, 5, 2, 'Electrical Repair',   '2026-03-18', 32.00, 6),
    (16, 1, 4, 'Lubrication',         '2026-04-02',  3.50, 12),
    (17, 2, 5, 'Motor Replacement',   '2026-04-07', 78.00, 13),
    (18, 3, 1, 'Safety Check',        '2026-04-12',  0.50, 14),
    (19, 4, 2, 'Hydraulic Repair',    '2026-04-17', 46.00, 15),
    (20, 5, 3, 'Routine Inspection',  '2026-04-22',  0.00, 11),
    (21, 4, 7,  'Hydraulic Repair',   '2026-03-10', 38.00, NULL),
    (22, 5, 11, 'Safety Check',       '2026-03-12', 22.50, NULL);

-- =====================================================================
-- TechnicalDocument
-- =====================================================================
DROP TABLE IF EXISTS TechnicalDocument;

CREATE TABLE TechnicalDocument (
    DocumentID INT PRIMARY KEY,
    DocumentTitle VARCHAR(150) NOT NULL,
    DocumentType VARCHAR(50) NOT NULL 
        CHECK (DocumentType IN ('Machinery Manual', 'Structural Blueprint', 'Safety Data Sheet (MSDS)', 'Test Certification', 'Wiring Schematic')),
    ConfidentialityLevel VARCHAR(25) NOT NULL 
        CHECK (ConfidentialityLevel IN ('Internal', 'Confidential', 'Strictly Proprietary')),
    MachineryID INT NULL,
    MaterialID INT NULL,
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID) ON DELETE SET NULL,
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID) ON DELETE SET NULL
);

INSERT INTO TechnicalDocument (DocumentID, DocumentTitle, DocumentType, ConfidentialityLevel, MachineryID, MaterialID)
VALUES
(1, 'Hydraulic Excavator Maintenance Manual', 'Machinery Manual', 'Internal', 1, NULL),
(2, 'Tower Crane Structural & Rigging Blueprint', 'Structural Blueprint', 'Strictly Proprietary', 2, NULL),
(3, 'Concrete Mixer Hydraulic Schematics', 'Wiring Schematic', 'Confidential', 3, NULL),
(4, 'Bulldozer Powertrain Technical Specification', 'Machinery Manual', 'Internal', 4, NULL),
(5, 'Mobile Crane Hydraulic & Electrical Schematic', 'Wiring Schematic', 'Confidential', 5, NULL),
(6, 'Portland Cement Lab Assay & Chemical Analysis', 'Safety Data Sheet (MSDS)', 'Confidential', NULL, 1),
(7, 'High-Tensile Steel Rebar Mill Test Certification', 'Test Certification', 'Internal', NULL, 7),
(8, 'Washed Sand Aggregate Particle Size Report', 'Safety Data Sheet (MSDS)', 'Internal', NULL, 3),
(9, 'Structural Steel Plate Grade Certification', 'Test Certification', 'Confidential', NULL, 4),
(10, 'Crawler Crane Safe Load Indicator Calibration', 'Test Certification', 'Strictly Proprietary', 15, NULL),
(11, 'Apartment Cluster Master Foundation Blueprint', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(12, 'High-Rise Tower Drainage & Pipework Layout', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(13, 'Wheel Loader Operation and Safety Manual', 'Machinery Manual', 'Internal', 6, NULL),
(14, 'Road Roller Operation and Maintenance Manual', 'Machinery Manual', 'Confidential', 7, NULL),
(15, 'Dump Truck Operation and Maintenance Manual', 'Machinery Manual', 'Internal', 8, NULL),
(16, 'Hydrated Lime Material Safety Data Sheet', 'Safety Data Sheet (MSDS)', 'Confidential', NULL, 5),
(17, 'Washed Sand Material Safety Data Sheet', 'Safety Data Sheet (MSDS)', 'Strictly Proprietary', NULL, 6),
(18, 'Steel Frame Construction Blueprint', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(19, 'Forklift Hydraulic System Schematic', 'Wiring Schematic', 'Confidential', 11, NULL),
(20, 'Crushed Granite Aggregate Quality Certificate', 'Test Certification', 'Internal', NULL, 16);

-- =====================================================================
-- DocumentAuditLoan
-- =====================================================================

DROP TABLE IF EXISTS DocumentAuditLoan;

CREATE TABLE DocumentAuditLoan (
    LoanID INT PRIMARY KEY,
    DocumentID INT NOT NULL,
    IssuedBy INT NOT NULL,  -- Compliance Officer or Admin in Staff
    AuditorName VARCHAR(100) NOT NULL,
    AuditorOrganization VARCHAR(100) NOT NULL,
    IssuedDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnedDate DATE NULL, -- NULL indicates document is currently NOT returned
    Status VARCHAR(25) NOT NULL 
        CHECK (Status IN ('Shared', 'Returned', 'Cleared', 'Overdue')),
    FOREIGN KEY (DocumentID) REFERENCES TechnicalDocument(DocumentID) ON DELETE CASCADE,
    FOREIGN KEY (IssuedBy) REFERENCES Staff(StaffID)
);

INSERT INTO DocumentAuditLoan (LoanID, DocumentID, IssuedBy, AuditorName, AuditorOrganization, IssuedDate, DueDate, ReturnedDate, Status)
VALUES
-- Returned on time
(1, 1,  9, 'Marcus Vance',      'Bureau Veritas Audits',          '2026-01-10', '2026-01-20', '2026-01-18', 'Returned'),
(2, 6, 10, 'Dr. Elena Rostova', 'SGS Industrial Inspection',      '2026-01-15', '2026-01-25', '2026-01-24', 'Returned'),
(3, 7, 18, 'Kevin Tan',         'SIRIM Quality Certification',    '2026-02-01', '2026-02-12', NULL, 'Cleared'),
(4, 4,  9, 'Rachel Adams',      'ISO Compliance Body',            '2026-02-05', '2026-02-15', '2026-02-14', 'Returned'),
(5, 9, 10, 'Michael Chang',     'Lloyd''s Register Inspection',   '2026-02-12', '2026-02-22', '2026-02-20', 'Returned'),
(13, 13, 18, 'Thomas Wright',   'Global Equipment Auditors',      '2026-03-01', '2026-03-12', '2026-03-10', 'Returned'),
(14, 14,  9, 'Jessica Miller',  'Technical Safety Consultants',  '2026-03-03', '2026-03-15', '2026-03-14', 'Returned'),
(15, 15, 10, 'Daniel Foster',   'Industrial Compliance Group',    '2026-03-05', '2026-03-18', '2026-03-16', 'Returned'),

-- Currently shared (within active loan window)
(6, 3,  9, 'Sarah Jenkins',     'TUV Rheinland Compliance',       '2026-03-10', '2026-03-25', NULL,         'Shared'),
(7, 8, 18, 'Derek Wong',        'National Building Inspectorate', '2026-03-15', '2026-03-30', NULL,         'Shared'),
(16, 16, 18, 'Olivia Bennett',  'Construction Quality Assurance', '2026-11-10', '2026-11-30', NULL,         'Shared'),
(17, 17,  9, 'Andrew Collins',  'Environmental Safety Inspection','2026-11-12', '2026-12-02', NULL,         'Shared'),
(18, 18, 10, 'Sophia Martinez', 'Structural Engineering Review',  '2026-11-15', '2026-12-05', NULL,         'Shared'),

-- Overdue / unreturned (Directly answers the problem statement!)
(8,  2, 10, 'Robert Stirling',   'Global Construction Safety',     '2026-01-05', '2026-01-22', NULL,         'Overdue'),
(9, 10, 18, 'Arthur Pendelton',  'Heavy Machinery Inspectors',     '2026-01-12', '2026-01-28', NULL,         'Overdue'),
(10, 11, 9, 'David Lee',         'Urban Planning Oversight Board', '2026-02-01', '2026-02-15', NULL,         'Overdue'),
(11, 5, 10, 'Fiona Campbell',    'Apex Engineering Audits',        '2026-02-10', '2026-02-24', NULL,         'Overdue'),
(12, 12, 18, 'Jonathan Brooks',  'Municipal Safety Council',       '2026-02-18', '2026-03-04', NULL,         'Overdue'),
(19, 19,  9, 'William Harris',   'Machinery Inspection Services',  '2026-09-01', '2026-09-15', NULL,         'Overdue'),
(20, 20, 10, 'Emily Parker',     'Materials Testing Authority',    '2026-09-10', '2026-09-25', NULL,         'Overdue');
