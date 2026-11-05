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
(9, 3, 89500.00),
(10, 2, 125000.00),
(11, 4, 76500.00),
(11, 5, 112000.00),
(12, 6, 18900.00),
(13, 7, 54000.00),
(14, 8, 38500.00),
(15, 9, 9800.00),
(15, 10, 14500.00),
(16, 1, 48500.00),
(17, 2, 128000.00),
(18, 3, 90000.00),
(18, 6, 19200.00),
(19, 4, 77000.00),
(20, 5, 115000.00);
