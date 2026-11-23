DROP TABLE IF EXISTS DocumentAuditLoan;

CREATE TABLE DocumentAuditLoan (
    LoanID INT PRIMARY KEY,
    DocumentID INT NOT NULL,
    IssuedBy INT NOT NULL,  -- Compliance Officer or Admin in Staff
    AuditorName VARCHAR(100) NOT NULL,
    AuditorOrganization VARCHAR(100) NOT NULL,
    IssuedDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnedDate DATE NULL, -- NULL indicates document is currently NOT returned
    Status VARCHAR(25) NOT NULL 
        CHECK (Status IN ('Shared', 'Returned', 'Overdue')),
    FOREIGN KEY (DocumentID) REFERENCES TechnicalDocument(DocumentID) ON DELETE CASCADE,
    FOREIGN KEY (IssuedBy) REFERENCES Staff(StaffID)
);

INSERT INTO DocumentAuditLoan (LoanID, DocumentID, IssuedBy, AuditorName, AuditorOrganization, IssuedDate, DueDate, ReturnedDate, Status)
VALUES
-- Returned on time
(1, 1,  9, 'Marcus Vance',      'Bureau Veritas Audits',          '2026-01-10', '2026-01-20', '2026-01-18', 'Returned'),
(2, 6, 10, 'Dr. Elena Rostova', 'SGS Industrial Inspection',      '2026-01-15', '2026-01-25', '2026-01-24', 'Returned'),
(3, 7, 18, 'Kevin Tan',         'SIRIM Quality Certification',    '2026-02-01', '2026-02-12', '2026-02-10', 'Returned'),
(4, 4,  9, 'Rachel Adams',      'ISO Compliance Body',            '2026-02-05', '2026-02-15', '2026-02-14', 'Returned'),
(5, 9, 10, 'Michael Chang',     'Lloyd''s Register Inspection',   '2026-02-12', '2026-02-22', '2026-02-20', 'Returned'),

-- Currently shared (within active loan window)
(6, 3,  9, 'Sarah Jenkins',     'TUV Rheinland Compliance',       '2026-03-10', '2026-03-25', NULL,         'Shared'),
(7, 8, 18, 'Derek Wong',        'National Building Inspectorate', '2026-03-15', '2026-03-30', NULL,         'Shared'),

-- Overdue / unreturned (Directly answers the problem statement!)
(8,  2, 10, 'Robert Stirling',   'Global Construction Safety',     '2026-01-05', '2026-01-22', NULL,         'Overdue'),
(9, 10, 18, 'Arthur Pendelton',  'Heavy Machinery Inspectors',     '2026-01-12', '2026-01-28', NULL,         'Overdue'),
(10, 11, 9, 'David Lee',         'Urban Planning Oversight Board', '2026-02-01', '2026-02-15', NULL,         'Overdue'),
(11, 5, 10, 'Fiona Campbell',    'Apex Engineering Audits',        '2026-02-10', '2026-02-24', NULL,         'Overdue'),
(12, 12, 18, 'Jonathan Brooks',  'Municipal Safety Council',       '2026-02-18', '2026-03-04', NULL,         'Overdue');
