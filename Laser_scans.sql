CREATE TABLE Laser_scans(
  LaserID INT PRIMARY KEY,
  LaserDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Laser_scans (LaserID, LaserDate, Description, Status) VALUES
(1,  '2026-01-09', '3D laser scan of chassis - within tolerance', 1),
(2,  '2026-01-11', 'Laser alignment scan of drive shaft - aligned', 1),
(3,  '2026-01-16', '3D laser scan of frame - warping of 1.2 mm detected', 0),
(4,  '2026-01-18', '3D laser scan of chassis - within tolerance', 1),
(5,  '2026-01-23', 'Laser alignment scan of rollers - aligned', 1),
(6,  '2026-01-25', 'Surface flatness scan of base plate - within tolerance', 1),
(7,  '2026-01-30', '3D laser scan of housing - within tolerance', 1),
(8,  '2026-02-01', 'Laser alignment scan of drive shaft - aligned', 1),
(9,  '2026-02-06', 'Surface flatness scan of base plate - within tolerance', 1),
(10, '2026-02-08', '3D laser scan of frame - dent of 2 mm detected', 0),
(11, '2026-02-13', '3D laser scan of chassis - within tolerance', 1),
(12, '2026-02-15', 'Laser alignment scan of rollers - aligned', 1),
(13, '2026-02-20', 'Surface flatness scan of base plate - within tolerance', 1),
(14, '2026-02-22', '3D laser scan of housing - within tolerance', 1),
(15, '2026-02-27', 'Laser alignment scan of drive shaft - misaligned by 0.8 mm', 0),
(16, '2026-03-01', '3D laser scan of chassis - within tolerance', 1),
(17, '2026-03-06', 'Surface flatness scan of base plate - within tolerance', 1),
(18, '2026-03-08', '3D laser scan of frame - within tolerance', 1),
(19, '2026-03-13', 'Laser alignment scan of rollers - aligned', 1),
(20, '2026-03-15', '3D laser scan of housing - within tolerance', 1);