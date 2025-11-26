package com.lab4;

import java.sql.*;
import java.util.Properties;
import java.util.Optional;

public class Repository {
    private Connection conn;

    public Repository(String username, String password) {
        Properties props = new Properties();
        props.setProperty("user", username);
        props.setProperty("password", password);

        String url = "jdbc:postgresql://localhost/postgres";
        try {
            conn = DriverManager.getConnection(url, props);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Optional<ResultSet> executeQuery(String query) {
        Optional<ResultSet> results = Optional.empty();

        try {
            Statement st = conn.createStatement();
            results = Optional.of(st.executeQuery(query));
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return results;
    }

    public void printResults(Optional<ResultSet> results) {
        if (results.isPresent()) {
            try {
                ResultSet rs = results.get();

                ResultSetMetaData columns = rs.getMetaData();
                String headerRow = "";
                
                for(int i = 1; i <= columns.getColumnCount(); i++) {
                    headerRow += "| " + columns.getColumnLabel(i) + " ";
                }
                headerRow += " ";

                System.out.println(headerRow);

                while (rs.next()) {
                    String row = "";

                    for(int i = 1; i < columns.getColumnCount(); i++) {
                        row += "| " + rs.getString(i);
                    }
                    row += " |";
                    System.out.println(row);
                }

                rs.close();
            } catch (SQLException exception) {
                System.out.println(exception.getMessage());
            }
        }
    }
}
