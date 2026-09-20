package com.nikki.nikkimart.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebListener
public class DatabaseListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {

        try (Connection con = DBConnection.getConnection()) {

            // Create tables
            runSqlFile(con, "schema.sql");

            // Insert seed users and products
            runSqlFile(con, "seed.sql");

            // Fix old TEMP_HASH accounts already present in Render
            fixSeedPasswords(con);

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
                getClass()
                        .getClassLoader()
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

        String[] statements =
                sql.toString().split(";");

        try (Statement stmt =
                     con.createStatement()) {

            for (String statement : statements) {

                if (!statement.trim().isEmpty()) {
                    stmt.execute(statement);
                }
            }
        }
    }

    private void fixSeedPasswords(Connection con)
            throws Exception {

        String sql =
                "UPDATE users " +
                "SET password_hash = ? " +
                "WHERE email = ? " +
                "AND password_hash = 'TEMP_HASH'";

        try (PreparedStatement ps =
                     con.prepareStatement(sql)) {

            // Admin
            ps.setString(
                    1,
                    "$2a$10$kiD8/iwu9rx7giMwjMaTf.3VhzCU1nwn55DQIOImK/wMHUIV1oa6O"
            );

            ps.setString(
                    2,
                    "admin@nikkimart.com"
            );

            ps.executeUpdate();


            // Seller
            ps.setString(
                    1,
                    "$2a$10$NwlzQ59aidij195vMQQzl.SK9ZhpZoja.DXXmj3PEHphKHtRlg/Wq"
            );

            ps.setString(
                    2,
                    "seller@nikkimart.com"
            );

            ps.executeUpdate();


            // Buyer
            ps.setString(
                    1,
                    "$2a$10$Fr1.6E.5iFDA6oL7hTbvu.09GscLyDOlPKmkAmC.DwOgPUwYGwr6q"
            );

            ps.setString(
                    2,
                    "buyer@nikkimart.com"
            );

            ps.executeUpdate();

            System.out.println(
                    "Seed user passwords verified."
            );
        }
    }
}