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
(1,  1, 48500.00),
(2,  2, 125000.00),
(3,  3, 89000.00),
(4,  4, 76500.00),
(5,  5, 112000.00),
(6,  6, 18900.00),
(7,  7, 54000.00),
(8,  8, 38500.00),
(9,  9, 9800.00),
(10, 10, 14500.00),
(11, 11, 18900.00),
(12, 12, 250000.00),
(13, 13, 180000.00),
(14, 14, 5400.00),
(15, 15, 540000.00),
(16, 16, 385000.00),
(17, 17, 128000.00),
(18, 18, 38500.00),
(19, 19, 9800.00),
(20, 20, 125000.00);
