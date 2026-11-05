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
(4, 6, 300, 8.75),
(5, 7, 250, 22.40),
(6, 8, 400, 31.00),
(7, 9, 350, 18.60),
(8, 10, 180, 27.30),
(9,  6,  450,  8.75),
(10, 2,  350, 15.00),
(10, 7,  320, 22.40),
(11, 3,  420,  9.80),
(11, 8,  550, 31.00),
(12, 4,  280, 45.00),
(12, 9,  400, 18.60),
(13, 5,  600,  6.20),
(13, 10, 250, 27.30);
