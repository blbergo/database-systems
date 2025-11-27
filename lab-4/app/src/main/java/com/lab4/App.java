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

            switch (menuChoice) {
                case 1:
                    getTripSchedules();
                    break;
                case 2:
                    editTripInfo();
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
                case 6:
                    addBus();
                    break;
                case 7:
                    deleteBus();
                    break;
            }

        } while (menuChoice != 9);

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

    private static void editTripInfo()
    { 
        String editTripPrompt = """
            Please select one of the following options:
            [1] Delete a trip offering.
            [2] Create a trip offering.
            [3] Change the driver for a trip offering.
            [4] Change the bus for a trip offering.    
            """;
        System.out.println(editTripPrompt);
        int menuChoice = scan.nextInt();
        scan.nextLine();

        switch(menuChoice) {
            case 1:
                System.out.println("> Enter the trip number, date and scheduled start time:");
                String[] args = scan.nextLine().split(",");
                service.deleteTripOffering(Integer.parseInt(args[0]), args[1], args[2]);
                break;
            case 2:
                System.out.println("> Enter the trip number, date, scheduled start time, scheduled arrival time, driver name and bus ID seprated by a comma:");
                String[] args2 = scan.nextLine().split(",");
                service.createTripOffering(Integer.parseInt(args2[0]), args2[1], args2[2], args2[3], args2[4], Integer.parseInt(args2[5]));
                break;
            case 3:
                System.out.println("> Enter the trip number, date, scheduled start time, and new driver name separated by a comma:");
                String[] args3 = scan.nextLine().split(",");
                service.swapDriverFortrip(Integer.parseInt(args3[0]), args3[1], args3[2], args3[3]);
                break;
            case 4:
                System.out.println("> Enter the trip number, date, scheduled start time, and new bus ID separated by a comma:");
                String[] args4 = scan.nextLine().split(",");
                service.swapBusForTrip(Integer.parseInt(args4[0]), args4[1], args4[2], Integer.parseInt(args4[3]));
                break;
        }
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

    private static void addBus() {
        String newBusPrompt = "> Enter the bus ID, model and year separated by a comma:";
        System.out.println(newBusPrompt);
        String response = scan.nextLine();

        String[] args = response.split(",");

        service.createBus(Integer.parseInt(args[0]), args[1], Integer.parseInt(args[2]));
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }

    private static void deleteBus() {
        String newBusPrompt = "> Enter the bus ID:";
        System.out.println(newBusPrompt);
        String response = scan.nextLine();

        String[] args = response.split(",");

        service.deleteBus(Integer.parseInt(args[0]));
        System.out.println("> Press any key to return to the menu.");
        scan.nextLine();
    }
}
