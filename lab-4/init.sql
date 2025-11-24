CREATE TABLE Trip (
    INT TripNumber PRIMARY KEY,
    TEXT StartLocationName,
    TEXT DestinationName
    );

CREATE TABLE TripOffering (
    INT TripNumber REFERENCES Trip (TripNumber),
    DATE Date NOT NULL,
    TIMESTAMP ScheduledStartTime NOT NULL,
    TIMESTAMP SchedueldArrivalTime NOT NULL,
    VARCHAR(255) DriverName,
    INT BusID REFERENCES Bus (BusID),
    PRIMARY KEY (TripNumber, Date, ScheduledStartTime)
);

CREATE TABLE Bus (
    INT BusID PRIMARY KEY,
    VARCHAR(255) Model,
    INT Year,
);

CREATE TABLE Driver (
    VARCHAR(255) DriverName PRIMARY KEY,
    VARCHAR(255) DriverTelephoneNumber
);

CREATE TABLE Stop (
    INT StopNumber PRIMARY KEY,
    TEXT StopAddress
);

CREATE TABLE ActualTripStopInfo (
    INT TripNumber REFERENCES Trip (TripNumber),
    DATETIME Date REFERENCES TripOffering (Date),
    TIMESTAMP ScheduledStartTime REFERENCES TripOffering (ScheduledStartTime),
    INT StopNumber REFERENCES Stop (StopNumber),
    TIMESTAMP REFERENCES TripOffering (SchedueldArrivalTime),
    TIMESTAMP ActualStartTime,
    TIMESTAMP ActualArrivalTime,
    INT NumberOfPassengersIn,
    INT NumberOfPassengersOut,
    PRIMARY KEY (TripNumber, Date, ScheduledStartTime, StopNumber)
);

CREATE TABLE TripStopInfo (
    INT TripNumber,
    INT StopNumber,
    INT SequenceNumber,
    TIMESTAMP DrivingTime
    PRIMARY KEY (Tripnumber, StopNumber)
);