-- =====================================================================
-- Views.sql  -  month sorting / reporting (run AFTER all tables are loaded)
-- =====================================================================

-- 1. Helper: one row per order with its total value
CREATE OR REPLACE VIEW v_order_totals AS
SELECT OrderID, SUM(LineTotal) AS OrderTotal
FROM (
    SELECT OrderID, UnitPrice AS LineTotal
    FROM PurchaseOrderMachinery
    UNION ALL
    SELECT OrderID, Quantity * UnitPrice
    FROM PurchaseOrderMaterial
) AS order_lines
GROUP BY OrderID;

-- 2. Purchases per month: number of orders and total spend
CREATE OR REPLACE VIEW v_monthly_purchase_summary AS
SELECT DATE_FORMAT(po.OrderDate, '%Y-%m') AS OrderMonth,
       DATE_FORMAT(po.OrderDate, '%M %Y') AS MonthName,
       COUNT(*) AS TotalOrders,
       COALESCE(SUM(ot.OrderTotal), 0) AS TotalSpend
FROM PurchaseOrder po
LEFT JOIN v_order_totals ot ON ot.OrderID = po.OrderID
GROUP BY DATE_FORMAT(po.OrderDate, '%Y-%m'), DATE_FORMAT(po.OrderDate, '%M %Y')
ORDER BY OrderMonth;

-- 3. Every dated record in the database in one list
CREATE OR REPLACE VIEW v_records_by_month AS
SELECT 'Purchase Order' AS RecordType, po.OrderID AS RecordID, po.OrderDate AS RecordDate,
       CONCAT(s.SupplierName, ' - ', po.Status) AS Details
FROM PurchaseOrder po
JOIN Supplier s ON s.SupplierID = po.SupplierID
UNION ALL
SELECT 'Delivery', d.DeliveryID, d.ReceivedDate,
       CONCAT('Order ', d.OrderID, ': ', d.Remarks)
FROM Delivery d
UNION ALL
SELECT 'Maintenance', mr.RecordID, mr.CreatedDate,
       CONCAT(mc.MachineryName, ' - ', mr.RecordType, ' (', mr.DamagePercentage, '% damage)')
FROM MaintenanceRecord mr
JOIN Machinery mc ON mc.MachineryID = mr.MachineryID
UNION ALL
SELECT 'Initial Check', ic.InitialCheckID, ic.RecordDate, mc.MachineryName
FROM Initial_check ic
JOIN Machinery mc ON mc.MachineryID = ic.MachineryID
UNION ALL
SELECT 'Stress Test', StressID, StressDate,
       CONCAT(IF(Status, 'Pass', 'FAIL'), ' - ', Description)
FROM Stress_test
UNION ALL
SELECT 'Quality Control', QualityID, QualityDate,
       CONCAT(IF(Status, 'Pass', 'FAIL'), ' - ', Description)
FROM Quality_control
UNION ALL
SELECT 'Laser Scan', LaserID, LaserDate,
       CONCAT(IF(Status, 'Pass', 'FAIL'), ' - ', Description)
FROM Laser_scans
UNION ALL
SELECT 'Material', m.MaterialID, m.MaterialDate,
       CONCAT(m.MaterialName, ' - ', s.SupplierName, ' (stock ', m.Stock, ')')
FROM Material m
JOIN Supplier s ON s.SupplierID = m.SupplierID;

-- 4. The sorting function
--    p_year      : e.g. 2026, or NULL for all years
--    p_month     : 1-12, or 0 / NULL for the whole year
--    p_type      : 'All' / NULL, or one of: Purchase Order, Delivery, Maintenance,
--                  Initial Check, Stress Test, Quality Control, Laser Scan, Material
--    p_direction : 'ASC' (oldest first) or 'DESC' (newest first)
DROP PROCEDURE IF EXISTS sp_records_by_month;
DELIMITER //
CREATE PROCEDURE sp_records_by_month(
    IN p_year INT,
    IN p_month INT,
    IN p_type VARCHAR(30),
    IN p_direction VARCHAR(4)
)
BEGIN
    DECLARE v_from DATE;
    DECLARE v_to DATE;
    DECLARE v_dir VARCHAR(4);

    IF p_month IS NOT NULL AND p_month <> 0 AND (p_month < 1 OR p_month > 12) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Month must be a number from 1 to 12 (or 0 for the whole year)';
    END IF;
    IF p_year IS NULL AND p_month IS NOT NULL AND p_month <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Please give a year when you choose a month';
    END IF;

    IF p_year IS NULL THEN
        SET v_from = '1900-01-01';
        SET v_to   = '2999-12-31';
    ELSEIF p_month IS NULL OR p_month = 0 THEN
        SET v_from = MAKEDATE(p_year, 1);
        SET v_to   = v_from + INTERVAL 1 YEAR;
    ELSE
        SET v_from = MAKEDATE(p_year, 1) + INTERVAL (p_month - 1) MONTH;
        SET v_to   = v_from + INTERVAL 1 MONTH;
    END IF;

    SET v_dir = IF(UPPER(COALESCE(p_direction, 'ASC')) = 'DESC', 'DESC', 'ASC');

    SELECT DATE_FORMAT(RecordDate, '%Y-%m') AS RecordMonth,
           RecordType, RecordID, RecordDate, Details
    FROM v_records_by_month
    WHERE RecordDate >= v_from
      AND RecordDate <  v_to
      AND (p_type IS NULL OR p_type = '' OR p_type = 'All' OR RecordType = p_type)
    ORDER BY
        CASE WHEN v_dir = 'DESC' THEN RecordDate END DESC,
        CASE WHEN v_dir = 'ASC'  THEN RecordDate END ASC,
        RecordType, RecordID;
END //
DELIMITER ;