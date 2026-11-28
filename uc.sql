
-- ============================================================
-- USE CASE 1: Retrieve Material Sourcing History
-- ============================================================

SELECT
    M.MaterialID,
    M.MaterialName,
    PO.SupplierID,
    S.SupplierName,
    PO.OrderID,
    PO.OrderDate,
    POM.Quantity,
    POM.UnitPrice,
    PO.Status
FROM Material M
JOIN PurchaseOrderMaterial POM
    ON M.MaterialID = POM.MaterialID
JOIN PurchaseOrder PO
    ON POM.OrderID = PO.OrderID
JOIN Supplier S
    ON PO.SupplierID = S.SupplierID
WHERE M.MaterialID = 1
ORDER BY PO.OrderDate DESC;


-- ============================================================
-- USE CASE 2: Retrieve Machinery Sourcing History
-- ============================================================

SELECT
    M.MachineryID,
    M.MachineryName,
    PO.SupplierID,
    S.SupplierName,
    PO.OrderID,
    PO.OrderDate,
    POM.Quantity,
    POM.UnitPrice,
    PO.Status
FROM Machinery M
JOIN PurchaseOrderMachinery POM
    ON M.MachineryID = POM.MachineryID
JOIN PurchaseOrder PO
    ON POM.OrderID = PO.OrderID
JOIN Supplier S
    ON PO.SupplierID = S.SupplierID
WHERE M.MachineryID = 1
ORDER BY PO.OrderDate DESC;


-- ============================================================
-- USE CASE 3: Retrieve Machinery Maintenance History
-- ============================================================

SELECT
    MR.RecordID,
    M.MachineryID,
    M.MachineryName,
    MR.RecordType,
    MR.CreatedDate,
    MR.DamagePercentage,
    S.StaffID,
    S.StaffName,
    MR.PreviousRecordID
FROM MaintenanceRecord MR
JOIN Machinery M
    ON MR.MachineryID = M.MachineryID
JOIN Staff S
    ON MR.StaffID = S.StaffID
WHERE MR.MachineryID = 1
ORDER BY MR.CreatedDate DESC;


-- ============================================================
-- USE CASE 4: Record Machinery Inspection Test Results
-- ============================================================

INSERT INTO InspectionTest (
    TestID,
    InitialCheckID,
    TestType,
    TestDate,
    Description,
    Passed
)
VALUES (
    61,
    1,
    'Stress Test',
    CURRENT_DATE,
    'Stress test conducted to evaluate machinery performance.',
    1
);

-- Retrieve the newly recorded inspection test.

SELECT
    IT.TestID,
    IT.InitialCheckID,
    M.MachineryID,
    M.MachineryName,
    IT.TestType,
    IT.TestDate,
    IT.Description,
    IT.Passed
FROM InspectionTest IT
JOIN Initial_check IC
    ON IT.InitialCheckID = IC.InitialCheckID
JOIN Machinery M
    ON IC.MachineryID = M.MachineryID
WHERE IT.TestID = 61;


-- ============================================================
-- USE CASE 5: Retrieve Failed Inspection Tests
-- ============================================================

SELECT
    IT.TestID,
    IC.InitialCheckID,
    M.MachineryID,
    M.MachineryName,
    IT.TestType,
    IT.TestDate,
    IT.Description,
    IT.Passed
FROM InspectionTest IT
JOIN Initial_check IC
    ON IT.InitialCheckID = IC.InitialCheckID
JOIN Machinery M
    ON IC.MachineryID = M.MachineryID
WHERE IT.Passed = 0
ORDER BY IT.TestDate DESC;


-- ============================================================
-- USE CASE 6: Update Existing Technical Document Information
-- ============================================================

START TRANSACTION;

UPDATE TechnicalDocument
SET
    DocumentTitle = 'Updated Machinery Inspection Report',
    FileLocation = 'documents/machinery_inspection_updated.pdf',
    ConfidentialityLevel = 'Internal'
WHERE DocumentID = 1;

COMMIT;

-- Retrieve the updated document information.

SELECT
    DocumentID,
    DocumentTitle,
    DocumentType,
    FileLocation,
    ConfidentialityLevel,
    CreatedDate
FROM TechnicalDocument
WHERE DocumentID = 1;


-- ============================================================
-- USE CASE 7: Retrieve Material Chemical Composition
-- ============================================================

SELECT
    M.MaterialID,
    M.MaterialName,
    S.SupplierName,
    MC.ElementName,
    MC.Percentage
FROM Material M
JOIN Supplier S
    ON M.SupplierID = S.SupplierID
JOIN MaterialComposition MC
    ON M.MaterialID = MC.MaterialID
WHERE M.MaterialID = 1
ORDER BY MC.ElementName;


-- ============================================================
-- USE CASE 8: Track Technical Document Audit Loans
-- ============================================================

-- Record a document issued to an external auditor.

START TRANSACTION;

INSERT INTO DocumentAuditLoan (
    LoanID,
    DocumentID,
    IssuedBy,
    AuditorName,
    AuditorOrganization,
    IssuedDate,
    DueDate,
    ReturnedDate,
    Status
)
VALUES (
    21,
    1,
    9,
    'External Auditor',
    'Compliance Audit Organisation',
    CURRENT_DATE,
    DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY),
    NULL,
    'Shared'
);

COMMIT;


-- Retrieve document audit loan information.

SELECT
    DAL.LoanID,
    TD.DocumentID,
    TD.DocumentTitle,
    M.MachineryName,
    MT.MaterialName,
    S.StaffName AS IssuedBy,
    DAL.AuditorName,
    DAL.AuditorOrganization,
    DAL.IssuedDate,
    DAL.DueDate,
    DAL.ReturnedDate,
    DAL.Status
FROM DocumentAuditLoan DAL
JOIN TechnicalDocument TD
    ON DAL.DocumentID = TD.DocumentID
JOIN Staff S
    ON DAL.IssuedBy = S.StaffID
LEFT JOIN Machinery M
    ON TD.MachineryID = M.MachineryID
LEFT JOIN Material MT
    ON TD.MaterialID = MT.MaterialID
WHERE DAL.LoanID = 21;


-- Record the document as returned.

START TRANSACTION;

UPDATE DocumentAuditLoan
SET
    ReturnedDate = CURRENT_DATE,
    Status = 'Returned'
WHERE LoanID = 21
  AND Status = 'Shared';

COMMIT;


-- Retrieve the updated loan record.

SELECT
    LoanID,
    DocumentID,
    IssuedBy,
    IssuedDate,
    DueDate,
    ReturnedDate,
    Status
FROM DocumentAuditLoan
WHERE LoanID = 21;
