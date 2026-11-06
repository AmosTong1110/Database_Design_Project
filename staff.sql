CREATE TABLE Staff(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Role VARCHAR(50) NOT NULL
        CHECK (Role IN ('Engineer', 'Technical Staff', 'Procurement Officer', 'Compliance Officer', 'Admin'))
);

INSERT INTO Staff (StaffID, StaffName, Role) 
VALUES
(1, 'John Smith', 'Engineer'),
(2, 'Emily Johnson', 'Engineer'),
(3, 'Michael Brown', 'Engineer'),
(4, 'Sarah Davis', 'Technical Staff'),
(5, 'David Wilson', 'Technical Staff'),
(6, 'Jessica Martinez', 'Procurement Officer'),
(7, 'Daniel Anderson', 'Procurement Officer'),
(8, 'Olivia Thomas', 'Procurement Officer'),
(9, 'James Taylor', 'Compliance Officer'),
(10, 'Sophia Moore', 'Compliance Officer'),
(11, 'Liam Jackson', 'Admin'),
(12, 'William Jackson', 'Admin'),
(13, 'Ava White', 'Engineer'),
(14, 'Alexander Harris', 'Engineer'),
(15, 'Mia Clark', 'Technical Staff'),
(16, 'Benjamin Lewis', 'Technical Staff'),
(17, 'Charlotte Robinson', 'Procurement Officer'),
(18, 'Ethan Walker', 'Compliance Officer'),
(19, 'Amelia Hall', 'Technical Staff'),
(20, 'Lucas Allen', 'Admin');