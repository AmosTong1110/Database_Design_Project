CREATE TABLE Material (
  [MaterialID] INT PRIMARY KEY,
  [SupplierID] INT,
  [MaterialDate] DATE,
  [Composition] FLOAT,
  [Stock] INT,
  FOREIGN KEY ([SupplierID]) REFERENCES Supplier ([SupplierID])
  );
  
