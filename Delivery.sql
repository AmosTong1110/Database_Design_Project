CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT NOT NULL, -- Foreign key referencing OrderID in PurchaseOrder table
    ReceivedBy INT, -- Foreign key referencing StaffID in Staff table
    ReceivedDate DATE,
    Remarks TEXT,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (ReceivedBy) REFERENCES Staff(StaffID)
);