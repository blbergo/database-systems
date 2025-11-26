package com.lab4;

import com.lab4.*;

public class App {
    public static void main(String[] args) {
        Repository repo = new Repository("postgres", "postgres");
        Service service = new Service(repo);
        service.getDriverSchedule("Alice Johnson", "2025-11-25");
    }
}
