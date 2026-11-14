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
