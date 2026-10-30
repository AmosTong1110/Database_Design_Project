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
(9,  1,  500, 12.50),
(9,  6,  450,  8.75),
(10, 2,  350, 15.00),
(10, 7,  320, 22.40),
(11, 3,  420,  9.80),
(11, 8,  550, 31.00),
(12, 4,  280, 45.00),
(12, 9,  400, 18.60),
(13, 5,  600,  6.20),
(13, 10, 250, 27.30);