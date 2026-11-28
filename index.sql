
-- ============================================================
-- index.sql
-- Create indexes for the Construction Database
-- ============================================================

-- Index #1: Material sourcing history (UC1)
CREATE INDEX IF NOT EXISTS idx_pom_materialid
ON PurchaseOrderMaterial(MaterialID);


-- Index #2: Machinery sourcing history (UC2)
CREATE INDEX IF NOT EXISTS idx_pom_machineryid
ON PurchaseOrderMachinery(MachineryID);


-- Index #3: Machinery maintenance history (UC3)
CREATE INDEX IF NOT EXISTS idx_maintenance_machineryid
ON MaintenanceRecord(MachineryID);


-- Index #4: Inspection tests by initial check
CREATE INDEX IF NOT EXISTS idx_inspection_initialcheckid
ON InspectionTest(InitialCheckID);


-- Index #5: Delivery records by purchase order
CREATE INDEX IF NOT EXISTS idx_delivery_orderid
ON Delivery(OrderID);


-- Index #6: Maintenance records by staff
CREATE INDEX IF NOT EXISTS idx_maintenance_staffid
ON MaintenanceRecord(StaffID);


-- Index #7: Purchase orders by supplier
CREATE INDEX IF NOT EXISTS idx_po_supplierid
ON PurchaseOrder(SupplierID);


-- Index #8: Technical documents by machinery
CREATE INDEX IF NOT EXISTS idx_technicaldocument_machineryid
ON TechnicalDocument(MachineryID);


-- Index #9: Technical documents by material
CREATE INDEX IF NOT EXISTS idx_technicaldocument_materialid
ON TechnicalDocument(MaterialID);


-- Index #10: Audit loan records by document
CREATE INDEX IF NOT EXISTS idx_documentauditloan_documentid
ON DocumentAuditLoan(DocumentID);


-- ============================================================
-- Verify that all indexes have been created
-- ============================================================

SELECT
    name AS IndexName,
    tbl_name AS TableName
FROM sqlite_master
WHERE type = 'index'
  AND name LIKE 'idx_%'
ORDER BY name;
