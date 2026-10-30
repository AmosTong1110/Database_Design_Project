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
(6, 7, 54000.00),
(6, 8, 38500.00),
(7, 9, 9800.00),
(8, 10, 14500.00);