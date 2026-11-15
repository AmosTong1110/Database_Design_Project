DROP TABLE IF EXISTS PurchaseOrderMaterial;

CREATE TABLE PurchaseOrderMaterial (
    OrderID INT,
    MaterialID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (OrderID, MaterialID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

INSERT INTO PurchaseOrderMaterial (OrderID, MaterialID, UnitPrice, Quantity)
VALUES
(21, 1,15.00, 500),
(22, 2, 15.00, 350),
(23, 3, 9.80, 500),
(24, 4, 45.00, 280),
(25, 5, 6.20, 600),
(26, 6, 8.75, 450),
(27, 7, 22.40, 320),
(28, 8, 31.00, 550),
(29, 9, 18.60, 400),
(30, 10, 27.30, 250),
(31, 11, 6.50, 280),
(32, 12, 45.00, 360),
(33, 13, 12.00, 520),
(34, 14, 12.00, 200),
(35, 15, 15.50, 650),
(36, 16, 20.00, 300),
(37, 17, 20.00, 570),
(38, 18, 10.00, 390),
(39, 19, 20.00, 275),
(40, 20, 23.00, 610),
(41, 3, 9.80, 300),
(41, 8, 31.00, 200),
(42, 5, 6.20, 250);
