CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
    RequestBy INT, -- Foreign key referencing StaffID in Staff table
    ApprovedBy INT CHECK (ApprovedBy <> RequestBy), -- Foreign key referencing StaffID in Staff table
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status VARCHAR(25),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (RequestBy) REFERENCES Staff(StaffID),
    FOREIGN KEY (ApprovedBy) REFERENCES Staff(StaffID)
);