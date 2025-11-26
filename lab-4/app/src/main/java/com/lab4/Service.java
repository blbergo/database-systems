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
}
