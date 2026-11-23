DROP TABLE IF EXISTS TechnicalDocument;

CREATE TABLE TechnicalDocument (
    DocumentID INT PRIMARY KEY,
    DocumentTitle VARCHAR(150) NOT NULL,
    DocumentType VARCHAR(50) NOT NULL 
        CHECK (DocumentType IN ('Machinery Manual', 'Structural Blueprint', 'Safety Data Sheet (MSDS)', 'Test Certification', 'Wiring Schematic')),
    ConfidentialityLevel VARCHAR(25) NOT NULL 
        CHECK (ConfidentialityLevel IN ('Internal', 'Confidential', 'Strictly Proprietary')),
    MachineryID INT NULL,
    MaterialID INT NULL,
    FOREIGN KEY (MachineryID) REFERENCES Machinery(MachineryID) ON DELETE SET NULL,
    FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID) ON DELETE SET NULL
);

INSERT INTO TechnicalDocument (DocumentID, DocumentTitle, DocumentType, ConfidentialityLevel, MachineryID, MaterialID) 
VALUES
(1, 'Hydraulic Excavator Maintenance Manual', 'Machinery Manual', 'Internal', 1, NULL),
(2, 'Tower Crane Structural & Rigging Blueprint', 'Structural Blueprint', 'Strictly Proprietary', 2, NULL),
(3, 'Concrete Mixer Hydraulic Schematics', 'Wiring Schematic', 'Confidential', 3, NULL),
(4, 'Bulldozer Powertrain Technical Specification', 'Machinery Manual', 'Internal', 4, NULL),
(5, 'Mobile Crane Hydraulic & Electrical Schematic', 'Wiring Schematic', 'Confidential', 5, NULL),
(6, 'Portland Cement Lab Assay & Chemical Analysis', 'Safety Data Sheet (MSDS)', 'Confidential', NULL, 1),
(7, 'High-Tensile Steel Rebar Mill Test Certification', 'Test Certification', 'Internal', NULL, 7),
(8, 'Washed Sand Aggregate Particle Size Report', 'Safety Data Sheet (MSDS)', 'Internal', NULL, 3),
(9, 'Structural Steel Plate Grade Certification', 'Test Certification', 'Confidential', NULL, 4),
(10, 'Crawler Crane Safe Load Indicator Calibration', 'Test Certification', 'Strictly Proprietary', 15, NULL),
(11, 'Apartment Cluster Master Foundation Blueprint', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(12, 'High-Rise Tower Drainage & Pipework Layout', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(13, 'Wheel Loader Operation and Safety Manual', 'Machinery Manual', 'Internal', 6, NULL),
(14, 'Asphalt Paver Electrical Wiring Diagram', 'Wiring Schematic', 'Confidential', 7, NULL),
(15, 'Industrial Generator Maintenance Guide', 'Machinery Manual', 'Internal', 8, NULL),
(16, 'Reinforced Concrete Strength Test Report', 'Test Certification', 'Confidential', NULL, 5),
(17, 'Protective Coating Chemical Safety Report', 'Safety Data Sheet (MSDS)', 'Strictly Proprietary', NULL, 6),
(18, 'Steel Frame Construction Blueprint', 'Structural Blueprint', 'Strictly Proprietary', NULL, NULL),
(19, 'Forklift Hydraulic System Schematic', 'Wiring Schematic', 'Confidential', 9, NULL),
(20, 'Crushed Granite Aggregate Quality Certificate', 'Test Certification', 'Internal', NULL, 8);
