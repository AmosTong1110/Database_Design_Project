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
(1, 2, 150, 15.00),
(2, 3, 500, 9.80),
(3, 4, 200, 45.00),
(4, 5, 450, 6.20),
(5, 7, 250, 22.40),
(6, 8, 400, 31.00),
(7, 9, 350, 18.60),
(8, 10, 180, 27.30),
(9,  6,  450,  8.75),
(10, 2,  350, 15.00),
(11, 8,  550, 31.00),
(12, 4,  280, 45.00),
(13, 10, 250, 27.30),
(14, 3, 250, 10.00),
(15, 2, 300, 15.50),
(16, 5, 520, 6.50),
(17, 7, 200, 23.00),
(18, 4, 180, 46.00),
(19, 6, 600, 9.00),
(20, 10, 220, 28.00);
