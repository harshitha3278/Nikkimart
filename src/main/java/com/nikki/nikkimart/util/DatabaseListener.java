package com.nikki.nikkimart.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.Statement;

@WebListener
public class DatabaseListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {

        try (Connection con = DBConnection.getConnection()) {

            runSqlFile(con, "schema.sql");
            runSqlFile(con, "seed.sql");

            System.out.println(
                    "Database schema and seed data initialized successfully."
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void runSqlFile(Connection con, String fileName)
            throws Exception {

        InputStream input =
                getClass().getClassLoader()
                        .getResourceAsStream(fileName);

        if (input == null) {
            throw new RuntimeException(
                    fileName + " not found in classpath"
            );
        }

        StringBuilder sql = new StringBuilder();

        try (BufferedReader reader =
                     new BufferedReader(
                             new InputStreamReader(
                                     input,
                                     StandardCharsets.UTF_8))) {

            String line;

            while ((line = reader.readLine()) != null) {
                sql.append(line).append("\n");
            }
        }

        String[] statements = sql.toString().split(";");

        try (Statement stmt = con.createStatement()) {

            for (String statement : statements) {

                if (!statement.trim().isEmpty()) {
                    stmt.execute(statement);
                }
            }
        }
    }
}