CREATE TABLE IF NOT EXISTS Staff(
    [StaffID] INT PRIMARY KEY,
    [EngineerName] VARCHAR(100)
);

INSERT OR REPLACE INTO Staff (StaffID, EngineerName) 
VALUES
(1, 'John Smith'),
(2, 'Emily Johnson'),
(3, 'Michael Brown'),
(4, 'Sarah Davis'),
(5, 'David Wilson'),
(6, 'Jessica Martinez'),
(7, 'Daniel Anderson'),
(8, 'Olivia Thomas'),
(9, 'James Taylor'),
(10, 'Sophia Moore');