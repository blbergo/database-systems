CREATE TABLE Trip (
    INT PRIMARY KEY TripNumber,
    TEXT StartLocationName,
    TEXT DestinationName
    );

CREATE TABLE TripOffering (
    INT TripNumber,
    DATETIME Date,
    TIMESTAMP ScheduledStartTime,
    TIMESTAMP SchedueldArrivalTime,
    VARCHAR(255) DriverName,
    INT BusID
)

CREATE TABLE Bus (
    INT PRIMARY KEY BusID,
    VARCHAR(255) Model,
    INT Year,
)

CREATE TABLE Driver (
    VARCHAR(255) PRIMARY KEY DriverName,
    VARCHAR(255) DriverTelephoneNumber
)

CREATE TABLE Stop (
    INT PRIMARY KEY StopNumber,
    TEXT StopAddress
)

CREATE TABLE ActualTripStopInfo (
    INT TripNumber,
    DATE 
)