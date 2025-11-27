-- ============================
-- 1. CREATE TABLES
-- ============================

CREATE TABLE Trip (
    TripNumber INT PRIMARY KEY,
    StartLocationName TEXT,
    DestinationName TEXT
);

CREATE TABLE Driver (
    DriverName VARCHAR(255) PRIMARY KEY,
    DriverTelephoneNumber VARCHAR(255)
);

CREATE TABLE Bus (
    BusID INT PRIMARY KEY,
    Model VARCHAR(255),
    Year INT
);

CREATE TABLE TripOffering (
    TripNumber INT REFERENCES Trip (TripNumber),
    Date DATE NOT NULL,
    ScheduledStartTime TIME WITHOUT TIME ZONE NOT NULL,
    ScheduledArrivalTime TIME WITHOUT TIME ZONE NOT NULL,
    DriverName VARCHAR(255) REFERENCES Driver (DriverName) ON DELETE CASCADE,
    BusID INT REFERENCES Bus (BusID) ON DELETE CASCADE,
    
    PRIMARY KEY (TripNumber, Date, ScheduledStartTime)
);

CREATE TABLE Stop (
    StopNumber INT PRIMARY KEY,
    StopAddress TEXT
);

CREATE TABLE TripStopInfo (
    TripNumber INT REFERENCES Trip (TripNumber) ON DELETE CASCADE,
    StopNumber INT REFERENCES Stop (StopNumber) ON DELETE CASCADE,
    SequenceNumber INT,
    DrivingTime INTERVAL, -- Using INTERVAL for duration
    
    PRIMARY KEY (TripNumber, StopNumber)
);

CREATE TABLE ActualTripStopInfo (
    TripNumber INT,
    Date DATE,
    ScheduledStartTime TIME WITHOUT TIME ZONE,
    StopNumber INT REFERENCES Stop (StopNumber),
    
    -- This column name now matches the INSERT statement below
    ScheduledStopArrivalTime TIME WITHOUT TIME ZONE, 
    
    ActualStartTime TIMESTAMP,
    ActualArrivalTime TIMESTAMP,
    NumberOfPassengersIn INT,
    NumberOfPassengersOut INT,
    
    PRIMARY KEY (TripNumber, Date, ScheduledStartTime, StopNumber),
    
    -- Composite Foreign Key referencing TripOffering
    FOREIGN KEY (TripNumber, Date, ScheduledStartTime) 
        REFERENCES TripOffering (TripNumber, Date, ScheduledStartTime) ON DELETE CASCADE
);

-- ============================
-- 2. SEED DATA
-- ============================

-- DRIVER DATA
INSERT INTO Driver (DriverName, DriverTelephoneNumber) VALUES
( 'Alice Johnson', '555-0101' ),
( 'Bob Smith', '555-0102' ),
( 'Charlie Brown', '555-0103' );

-- BUS DATA
INSERT INTO Bus (BusID, Model, Year) VALUES
( 101, 'Volvo 9700', 2022 ),
( 102, 'Prevost X3-45', 2023 ),
( 103, 'Setra S 417 TC', 2021 );

-- TRIP DATA
INSERT INTO Trip (TripNumber, StartLocationName, DestinationName) VALUES
( 1, 'Phoenix Downtown', 'Flagstaff Central' ),
( 2, 'Flagstaff Central', 'Phoenix Downtown' ),
( 3, 'Tucson University', 'Phoenix Downtown' );

-- STOP DATA
INSERT INTO Stop (StopNumber, StopAddress) VALUES
( 10, 'Sky Harbor Transit Center, AZ' ),
( 20, 'Sedona Vista Stop, AZ' ),
( 30, 'Flagstaff East Mall, AZ' ),
( 40, 'Tucson Downtown Terminal, AZ' );

-- TRIPSTOPINFO DATA 
-- Trip 1: Phoenix (10) -> Sedona (20) -> Flagstaff (30)
INSERT INTO TripStopInfo (TripNumber, StopNumber, SequenceNumber, DrivingTime) VALUES
( 1, 10, 1, '01:30:00' ),
( 1, 20, 2, '01:00:00' ),
( 1, 30, 3, '00:00:00' ); 

-- Trip 2: Flagstaff (30) -> Sedona (20) -> Phoenix (10)
INSERT INTO TripStopInfo (TripNumber, StopNumber, SequenceNumber, DrivingTime) VALUES
( 2, 30, 1, '01:00:00' ),
( 2, 20, 2, '01:30:00' ),
( 2, 10, 3, '00:00:00' );

-- TRIPOFFERING DATA
-- Fixed Typo: Changed SchedueldArrivalTime to ScheduledArrivalTime
INSERT INTO TripOffering (TripNumber, Date, ScheduledStartTime, ScheduledArrivalTime, DriverName, BusID) VALUES
-- Trip 1 offerings for 2025-11-25
( 1, '2025-11-25', '08:00:00', '10:30:00', 'Alice Johnson', 101 ),
( 1, '2025-11-25', '14:00:00', '16:30:00', 'Bob Smith', 102 ),
-- Trip 2 offerings for 2025-11-25
( 2, '2025-11-25', '11:00:00', '13:30:00', 'Charlie Brown', 103 ),
-- Trip 2 offerings for 2025-11-26 and 2025-11-27
( 2, '2025-11-26', '12:00:00', '14:30:00', 'Alice Johnson', 101 ),
( 2, '2025-11-27', '09:00:00', '11:30:00', 'Alice Johnson', 102 ),
-- Trip 3 offering
( 3, '2025-11-26', '18:00:00', '20:00:00', 'Bob Smith', 103 );

-- ACTUALTRIPSTOPINFO DATA
-- Fixed Typo: Changed SchedueldArrivalTime to ScheduledStopArrivalTime (to match table definition)
INSERT INTO ActualTripStopInfo (TripNumber, Date, ScheduledStartTime, StopNumber, ScheduledStopArrivalTime, ActualStartTime, ActualArrivalTime, NumberOfPassengersIn, NumberOfPassengersOut) VALUES
-- Stop 1: Phoenix Downtown (Departure)
( 1, '2025-11-25', '08:00:00', 10, '08:00:00', '2025-11-25 08:00:00', NULL, 15, 0 ), 
-- Stop 2: Sedona Vista Stop (Intermediate)
( 1, '2025-11-25', '08:00:00', 20, '09:30:00', '2025-11-25 09:35:00', '2025-11-25 09:40:00', 5, 2 ), 
-- Stop 3: Flagstaff Central (Final Destination)
( 1, '2025-11-25', '08:00:00', 30, '10:30:00', '2025-11-25 10:45:00', '2025-11-25 10:45:00', 0, 18 );