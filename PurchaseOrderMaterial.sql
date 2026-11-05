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
(21, 1, 150, 15.00),
(22, 2, 350, 15.00),
(23, 3, 500, 9.80),
(24, 4, 200, 45.00),
(25, 5, 450, 6.20),
(26, 6, 450, 8.75),
(27, 7, 250, 22.40),
(28, 8, 400, 31.00),
(29, 9, 350, 18.60),
(30, 10, 180, 27.30),
(31, 11, 280, 6.50),
(32, 12, 360, 45.00),
(33, 13, 520, 12.00),
(34, 14, 200, 12.00),
(35, 15, 650, 15.50),
(36, 16, 300, 20.00),
(37, 17, 570, 20.00),
(38, 18, 390, 10.00),
(39, 19, 275, 20.00),
(40, 20, 610, 23.00);
