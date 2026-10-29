CREATE TABLE Stress_test(
  StressID INT PRIMARY KEY,
  StressDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Stress_test (StressID, StressDate, Description, Status) VALUES
(1, '2026-01-05','Load test at 120% rated capacity - no deformation', 1),
(2, '2026-01-07','Vibration endurance test 48 hours - passed', 1),
(3, '2026-01-12','Thermal cycling -10C to 80C - hairline crack at weld', 0),
(4, '2026-01-14','Static load test on main frame - passed', 1),
(5, '2026-01-19','Fatigue test 10,000 cycles - passed', 1),
(6, '2026-01-21','Torsion test on drive shaft - deformation above limit', 0),
(7, '2026-01-26','Overload test at 150% - passed with minor flex', 1),
(8, '2026-01-28','Hydraulic pressure test at 200 bar - passed', 1),
(9, '2026-02-02','Impact resistance test on housing - passed', 1),
(10,'2026-02-04','Vibration endurance test 48 hours - bearing overheating', 0),
(11,'2026-02-09','Load test at 120% rated capacity - passed', 1),
(12,'2026-02-11','Static load test on boom arm - passed', 1),
(13,'2026-02-16','Fatigue test 10,000 cycles - passed', 1),
(14,'2026-02-18','Thermal cycling -10C to 80C - seal leakage detected', 0),
(15,'2026-02-23','Hydraulic pressure test at 200 bar - passed', 1),
(16,'2026-02-25','Overload test at 150% - passed', 1),
(17,'2026-03-02','Impact resistance test on housing - passed', 1),
(18,'2026-03-04','Torsion test on drive shaft - shaft cracked', 0),
(19,'2026-03-09','Static load test on main frame - passed', 1),
(20,'2026-03-11','Vibration endurance test 48 hours - passed', 1);