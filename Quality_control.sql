CREATE TABLE Quality_control(
  QualityID INT PRIMARY KEY,
  QualityDate DATE,
  Description TEXT,
  Status Boolean
);

INSERT INTO Quality_control (QualityID, QualityDate, Description, Status) VALUES
(1,'2026-01-07', 'Surface finish and paint inspection - meets standard', 1),
(2,'2026-01-09', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(3,'2026-01-14', 'Weld seam visual inspection - passed', 1),
(4,'2026-01-16', 'Component labelling and serial number check - passed', 1),
(5,'2026-01-21', 'Electrical wiring and insulation check - passed', 1),
(6,'2026-01-23', 'Surface finish inspection - paint peeling found', 0),
(7,'2026-01-28', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(8,'2026-01-30', 'Fastener torque check - passed', 1),
(9,'2026-02-04', 'Weld seam visual inspection - passed', 1),
(10,'2026-02-06', 'Lubrication system check - passed', 1),
(11,'2026-02-11', 'Electrical wiring check - loose terminal found', 0),
(12,'2026-02-13', 'Surface finish and paint inspection - meets standard', 1),
(13,'2026-02-18', 'Fastener torque check - passed', 1),
(14,'2026-02-20', 'Dimension tolerance check +/-0.1 mm - passed', 1),
(15,'2026-02-25', 'Safety guard and emergency stop check - passed', 1),
(16,'2026-02-27', 'Lubrication system check - passed', 1),
(17,'2026-03-04', 'Weld seam visual inspection - porosity found', 0),
(18,'2026-03-06', 'Component labelling and serial number check - passed', 1),
(19,'2026-03-11', 'Safety guard and emergency stop check - passed', 1),
(20,'2026-03-13', 'Electrical wiring and insulation check - passed', 1);