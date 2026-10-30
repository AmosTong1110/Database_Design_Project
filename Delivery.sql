CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT NOT NULL, -- Foreign key referencing OrderID in PurchaseOrder table
    ReceivedBy INT, -- Foreign key referencing StaffID in Staff table
    ReceivedDate DATE,
    Remarks TEXT,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (ReceivedBy) REFERENCES Staff(StaffID)
);

INSERT INTO Delivery (DeliveryID, OrderID, ReceivedBy, ReceivedDate, Remarks)
VALUES
(1,  1,  4, '2026-01-02', 'Delivered on schedule, no visible damage'),
(2,  2,  5, '2026-01-05', 'Delivered on schedule'),
(3,  3, 15, '2026-01-09', 'Delivered on schedule'),
(4,  4, 16, '2026-01-12', 'Delivered on schedule'),
(5,  5, 19, '2026-01-17', 'Delivered 1 day late'),
(6,  6,  4, '2026-01-19', 'Partial delivery 1 of 3'),
(7,  6,  5, '2026-01-23', 'Partial delivery 2 of 3'),
(8,  6, 15, '2026-01-26', 'Partial delivery 3 of 3'),
(9,  7, 16, '2026-01-30', 'Minor packaging damage, machine unaffected'),
(10, 8, 19, '2026-02-02', 'Delivered on schedule'),
(11, 9,  4, '2026-01-05', 'Partial delivery 1 of 2'),
(12, 9,  5, '2026-01-25', 'Partial delivery 2 of 2'),
(13, 10, 15, '2026-01-08', 'Partial delivery 1 of 2'),
(14, 10, 16, '2026-02-02', 'Partial delivery 2 of 2'),
(15, 11, 19, '2026-01-12', 'Partial delivery 1 of 2'),
(16, 11,  4, '2026-02-06', 'Partial delivery 2 of 2'),
(17, 12,  5, '2026-01-15', 'Partial delivery 1 of 2'),
(18, 12, 15, '2026-02-10', 'Partial delivery 2 of 2'),
(19, 13, 16, '2026-01-20', 'Partial delivery 1 of 2'),
(20, 13, 19, '2026-02-14', 'Partial delivery 2 of 2');