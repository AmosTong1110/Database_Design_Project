CREATE TABLE Machinery(
  MachineryID INT PRIMARY KEY,
  SupplierID INT,
  MachineryName VARCHAR(100),
  Specifications VARCHAR(255),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
