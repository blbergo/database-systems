package com.lab4;

import java.sql.*;
import java.util.Optional;


public class Service {
    private Repository repo;

    public Service(Repository repository) {
        repo = repository;
    }
    
    public void getTripSchedules(String startLocationName, String destName, String date) {
        String query = """
            SELECT Trip.StartLocationName, Trip.DestinationName, Offering.Date, Offering.ScheduledStartTime, Offering.ScheduledArrivalTime, Offering.DriverName, Offering.BusID FROM Trip
            JOIN TripOffering AS Offering ON Trip.TripNumber = Offering.TripNumber
            WHERE StartLocationName = '%s' AND DestinationName = '%s' AND Date = '%s';
        """;
        query = String.format(query, startLocationName, destName, date);

        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void deleteTripOffering(int TripNumber, String Date, String ScheduledStartTime) {
        String query = """
            DELETE FROM TABLE TripOffering 
            WHERE TripNumber = %s AND Date = %s AND ScheduledStartTime = %s;
            """;

        query = String.format(query, TripNumber, Date, ScheduledStartTime);

        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void createTripOffering(int TripNumber, String Date, String ScheduledStartTime, String ScheduledArrivalTime, String DriverName, int BusID) {
        String query = """
            INSERT INTO TripOffering (TripNumber, Date, ScheduledStartTime, ScheduledArrivalTime, DriverName, BusID) VALUES
            (%s, %s, %s, %s, %s, %s);    
            """;
        query = String.format(query, TripNumber, Date, ScheduledStartTime, ScheduledArrivalTime, DriverName, BusID);

        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void swapBusForTrip(int TripNumber, int newBusId) {
        String query = """
            UPDATE TABLE TripOffering
            WHERE TripNumber = %s
            SET BusId = %s;    
            """;

        query = String.format(query, TripNumber, newBusId);

        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void getTripStopInfo(int TripNumber) {
        String query = """
            SELECT TripStopInfo.TripNumber, TripStopInfo.StopNumber, TripStopInfo.SequenceNumber, TripStopInfo.DrivingTime FROM TripStopInfo
            JOIN Trip ON Trip.TripNumber = TripStopInfo.TripNumber
            WHERE Trip.TripNumber = %s;
            """;

        query = String.format(query, TripNumber);
        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void getDriverSchedule(String DriverName, String Date) {
        String query = """
            SELECT * FROM TripOffering
            WHERE DriverName = '%s' AND Date >= '%s' and Date <= date('%s') + INTERVAL '7 days';
            """;

        query = String.format(query, DriverName, Date, Date);
        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }

    public void createDriver(String DriverName, String TelephoneNumber) {
        String query = """
            INSERT INTO Driver (DriverName, TelephoneNumber) VALUES
            ('%s', '%s');    
            """;
        query = String.format(query, DriverName, TelephoneNumber);
        Optional<ResultSet> result = repo.executeQuery(query);
        repo.printResults(result);
    }
}
