CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL, -- Foreign key referencing SupplierID in Supplier table
    RequestBy INT, -- Foreign key referencing StaffID in Staff table
    ApprovedBy INT, -- Foreign key referencing StaffID in Staff table
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status VARCHAR(25),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (RequestBy) REFERENCES Staff(StaffID),
    FOREIGN KEY (ApprovedBy) REFERENCES Staff(StaffID),
    CHECK (ApprovedBy <> RequestBy)
);

INSERT INTO PurchaseOrder (OrderID, SupplierID, RequestBy, ApprovedBy, OrderDate, ExpectedDeliveryDate, Status) 
VALUES
(1,  1,  6, 11, '2025-12-15', '2026-01-02', 'Delivered'),
(2,  2,  7, 12, '2025-12-18', '2026-01-05', 'Delivered'),
(3,  3,  8, 11, '2025-12-22', '2026-01-09', 'Delivered'),
(4,  4, 17, 12, '2025-12-26', '2026-01-12', 'Delivered'),
(5,  5,  6, 20, '2025-12-30', '2026-01-16', 'Delivered'),
(6,  6,  7, 11, '2026-01-02', '2026-01-19', 'Delivered'),
(7,  9,  6, 11, '2026-01-10', '2026-01-30', 'Delivered'),
(8, 10, 7, 12, '2026-01-12', '2026-02-02', 'Delivered'),
(9, 1,  8, 20, '2025-12-28', '2026-01-05', 'Delivered'),
(10, 2, 17, 11, '2026-01-02', '2026-01-08', 'Delivered'),
(11, 3,  6, 12, '2026-01-06', '2026-01-12', 'Delivered'),
(12, 4,  7, 20, '2026-01-09', '2026-01-15', 'Delivered'),
(13, 5,  8, 11, '2026-01-14', '2026-01-20', 'Delivered'),
(14, 6, 17, 12, '2026-01-16', '2026-01-22', 'Delivered'),
(15, 7,  6, 20, '2026-01-18', '2026-01-25', 'Delivered'),
(16, 8,  7, 11, '2026-01-20', '2026-01-27', 'Delivered'),
(17, 9,  8, 12, '2026-01-22', '2026-01-29', 'Pending'),
(18, 10, 6, 20, '2026-01-25', '2026-02-01', 'Pending'),
(19, 1, 17, 11, '2026-01-28', '2026-02-04', 'Pending'),
(20, 2,  7, 12, '2026-01-30', '2026-02-06', 'Pending');
