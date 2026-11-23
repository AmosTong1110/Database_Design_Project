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
        CHECK (Status IN ('Shared', 'Returned', 'Cleared', 'Overdue')),
    FOREIGN KEY (DocumentID) REFERENCES TechnicalDocument(DocumentID) ON DELETE CASCADE,
    FOREIGN KEY (IssuedBy) REFERENCES Staff(StaffID)
);

INSERT INTO DocumentAuditLoan (LoanID, DocumentID, IssuedBy, AuditorName, AuditorOrganization, IssuedDate, DueDate, ReturnedDate, Status)
VALUES
-- Returned on time
(1, 1,  9, 'Marcus Vance',      'Bureau Veritas Audits',          '2026-01-10', '2026-01-20', '2026-01-18', 'Returned'),
(2, 6, 10, 'Dr. Elena Rostova', 'SGS Industrial Inspection',      '2026-01-15', '2026-01-25', '2026-01-24', 'Returned'),
(3, 7, 18, 'Kevin Tan',         'SIRIM Quality Certification',    '2026-02-01', '2026-02-12', '2026-02-10', 'Cleared'),
(4, 4,  9, 'Rachel Adams',      'ISO Compliance Body',            '2026-02-05', '2026-02-15', '2026-02-14', 'Returned'),
(5, 9, 10, 'Michael Chang',     'Lloyd''s Register Inspection',   '2026-02-12', '2026-02-22', '2026-02-20', 'Returned'),
(13, 13, 18, 'Thomas Wright',   'Global Equipment Auditors',      '2026-03-01', '2026-03-12', '2026-03-10', 'Returned'),
(14, 14,  9, 'Jessica Miller',  'Technical Safety Consultants',  '2026-03-03', '2026-03-15', '2026-03-14', 'Returned'),
(15, 15, 10, 'Daniel Foster',   'Industrial Compliance Group',    '2026-03-05', '2026-03-18', '2026-03-16', 'Returned'),

-- Currently shared (within active loan window)
(6, 3,  9, 'Sarah Jenkins',     'TUV Rheinland Compliance',       '2026-03-10', '2026-03-25', NULL,         'Shared'),
(7, 8, 18, 'Derek Wong',        'National Building Inspectorate', '2026-03-15', '2026-03-30', NULL,         'Shared'),
(16, 16, 18, 'Olivia Bennett',  'Construction Quality Assurance', '2026-11-10', '2026-11-30', NULL,         'Shared'),
(17, 17,  9, 'Andrew Collins',  'Environmental Safety Inspection','2026-11-12', '2026-12-02', NULL,         'Shared'),
(18, 18, 10, 'Sophia Martinez', 'Structural Engineering Review',  '2026-11-15', '2026-12-05', NULL,         'Shared'),

-- Overdue / unreturned (Directly answers the problem statement!)
(8,  2, 10, 'Robert Stirling',   'Global Construction Safety',     '2026-01-05', '2026-01-22', NULL,         'Overdue'),
(9, 10, 18, 'Arthur Pendelton',  'Heavy Machinery Inspectors',     '2026-01-12', '2026-01-28', NULL,         'Overdue'),
(10, 11, 9, 'David Lee',         'Urban Planning Oversight Board', '2026-02-01', '2026-02-15', NULL,         'Overdue'),
(11, 5, 10, 'Fiona Campbell',    'Apex Engineering Audits',        '2026-02-10', '2026-02-24', NULL,         'Overdue'),
(12, 12, 18, 'Jonathan Brooks',  'Municipal Safety Council',       '2026-02-18', '2026-03-04', NULL,         'Overdue'),
(19, 19,  9, 'William Harris',   'Machinery Inspection Services',  '2026-09-01', '2026-09-15', NULL,         'Overdue'),
(20, 20, 10, 'Emily Parker',     'Materials Testing Authority',    '2026-09-10', '2026-09-25', NULL,         'Overdue');
