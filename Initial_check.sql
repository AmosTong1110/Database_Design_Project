CREATE TABLE Initial_check (
    [InitialCheckID] INT PRIMARY KEY,
    [MachineryID] INT ,   
    [RecordDate] DATE,
    [StressID] INT,   
    [QualityID] INT,   
    [LaserID] INT,  
    FOREIGN KEY (MachineryID) REFERENCES  Machinery (MachineryID),
    FOREIGN KEY (StressID)    REFERENCES  Stress_test (StressID),
    FOREIGN KEY (QualityID)   REFERENCES  Quality_control (QualityID),
    FOREIGN KEY (LaserID)     REFERENCES  Laser_scans (LaserID)
);
