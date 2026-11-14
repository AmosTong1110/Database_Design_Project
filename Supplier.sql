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
