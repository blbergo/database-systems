package com.lab4;

import java.util.ArrayList;
import java.util.Scanner;

import com.lab4.*;

public class App {
    public static Scanner scan = new Scanner(System.in);
    private static Repository repo = new Repository("postgres", "postgres");
    private static Service service = new Service(repo);

    public static void main(String[] args) {

        String basePrompt = """
            Please select one of the following options:
            [1] Retrieve all schedules for a start and end destination.
            [2] Edit the schedule of a trip.
            [3] Retrieve stops for a trip.
            [4] Display the weekly schedule of a driver.
            [5] Add a driver.
            [6] Add a bus.
            [7] Delete a bus.
            [8] Record trip info.
            [9] Quit.
            """; 

     
        int menuChoice = 10;
        
        do {
        System.out.println(basePrompt);
            menuChoice = Integer.parseInt(scan.nextLine());

            switch(menuChoice) {
                case 1:
                    getTripSchedules();   
                    break;
                case 3:
                    getTripStops();
                    break;    
                case 4:
                    getWeeklyScheduleForDriver();
                    break;       
                case 5:
                    addDriver();
                    break;      
            }

        } while(menuChoice != 9);
    
        scan.close();
    }

    private static void getTripSchedules() {
        String tripSchedulePrompt = "> Enter the startLocationName, destinationName and date separated by a comma:";
        System.out.println(tripSchedulePrompt);
        String response = scan.nextLine();
        
        String[] args = response.split(",");

        service.getTripSchedules(args[0], args[1], args[2]);
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }

    private static void getTripStops() {
        String tripStopsPrompt = "> Enter the trip number:";
        System.out.println(tripStopsPrompt);
        String response = scan.nextLine();
        
        String[] args = response.split(",");

        service.getTripStopInfo(Integer.parseInt(args[0]));
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }

    private static void getWeeklyScheduleForDriver() {
        String tripStopsPrompt = "> Enter the driver name and start date separated by a comma:";
        System.out.println(tripStopsPrompt);
        String response = scan.nextLine();
        
        String[] args = response.split(",");

        service.getDriverSchedule(args[0], args[1]);
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }

    private static void addDriver() {
        String newDriverPrompt = "> Enter the driver name and telephone number separated by a comma:";
        System.out.println(newDriverPrompt);
        String response = scan.nextLine();
        
        String[] args = response.split(",");

        service.createDriver(args[0], args[1]);
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }
}
