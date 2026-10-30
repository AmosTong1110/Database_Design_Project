CREATE TABLE PurchaseOrderMaterial (
    OrderID INT,
    MaterialID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    PRIMARY KEY (OrderID, MaterialID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);