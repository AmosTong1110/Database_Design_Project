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

INSERT INTO PurchaseOrder
(OrderID, SupplierID, RequestBy, ApprovedBy, OrderDate, ExpectedDeliveryDate, Status)
VALUES
-- Machinery purchase orders (1–20)
(1,  1,  6, 11, '2025-12-15', '2026-01-02', 'Delivered'),
(2,  2,  7, 12, '2025-12-18', '2026-01-05', 'Delivered'),
(3,  3,  8, 11, '2025-12-22', '2026-01-09', 'Delivered'),
(4,  4, 17, 12, '2025-12-26', '2026-01-12', 'Delivered'),
(5,  5,  6, 20, '2025-12-30', '2026-01-16', 'Delivered'),
(6,  6,  7, 11, '2026-01-02', '2026-01-19', 'Delivered'),
(7,  6,  6, 11, '2026-01-02', '2026-01-23', 'Delivered'),
(8,  6,  7, 12, '2026-01-02', '2026-01-26', 'Delivered'),
(9,  9,  8, 20, '2025-12-28', '2026-01-05', 'Delivered'),
(10, 10, 17, 11, '2026-01-02', '2026-01-08', 'Delivered'),
(11, 11,  6, 12, '2026-01-06', '2026-01-12', 'Delivered'),
(12, 12,  7, 20, '2026-01-09', '2026-01-15', 'Delivered'),
(13, 13,  8, 11, '2026-01-14', '2026-01-20', 'Delivered'),
(14, 14, 17, 12, '2026-01-16', '2026-01-22', 'Delivered'),
(15, 15,  6, 20, '2026-01-18', '2026-01-25', 'Delivered'),
(16, 16,  7, 11, '2026-01-20', '2026-01-27', 'Delivered'),
(17, 17,  8, 12, '2026-01-22', '2026-01-29', 'Delivered'),
(18, 18,  6, 20, '2026-01-25', '2026-02-01', 'Delivered'),
(19, 19, 17, 11, '2026-01-28', '2026-02-04', 'Delivered'),
(20, 20,  7, 12, '2026-01-30', '2026-02-06', 'Delivered'),

-- Material purchase orders (21–40)
(21,  1,  6, 11, '2025-12-29', '2026-01-05', 'Delivered'),
(22,  2,  7, 12, '2025-12-31', '2026-01-08', 'Delivered'),
(23,  3,  8, 11, '2026-01-04', '2026-01-12', 'Delivered'),
(24,  4, 17, 12, '2026-01-07', '2026-01-15', 'Delivered'),
(25,  5,  6, 20, '2026-01-12', '2026-01-20', 'Delivered'),
(26,  1,  7, 11, '2026-01-17', '2026-01-25', 'Delivered'),
(27,  2,  8, 12, '2026-01-25', '2026-02-02', 'Delivered'),
(28,  3,  6, 20, '2026-01-29', '2026-02-06', 'Delivered'),
(29,  4,  7, 11, '2026-02-02', '2026-02-10', 'Delivered'),
(30,  5,  8, 12, '2026-02-06', '2026-02-14', 'Delivered'),
(31,  1, 17, 20, '2026-02-10', '2026-02-18', 'Delivered'),
(32,  2,  6, 11, '2026-02-14', '2026-02-22', 'Delivered'),
(33,  3,  7, 12, '2026-02-21', '2026-03-01', 'Delivered'),
(34,  4,  8, 20, '2026-02-25', '2026-03-05', 'Delivered'),
(35,  5, 17, 11, '2026-03-02', '2026-03-09', 'Delivered'),
(36,  1,  6, 12, '2026-03-06', '2026-03-13', 'Delivered'),
(37,  2,  7, 20, '2026-03-10', '2026-03-17', 'Delivered'),
(38,  3,  8, 11, '2026-03-14', '2026-03-21', 'Delivered'),
(39,  4, 17, 12, '2026-03-18', '2026-03-25', 'Delivered'),
(40,  5,  6, 20, '2026-03-22', '2026-03-29', 'Delivered'),

-- Restock orders still waiting for delivery (41-42)
(41,  3,  6, 11, '2026-04-06', '2026-04-14', 'Pending'),
(42,  5,  7, 12, '2026-04-10', '2026-04-18', 'Pending');

