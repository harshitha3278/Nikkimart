package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.UserDAOImpl;
import com.nikki.nikkimart.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService(new UserDAOImpl());
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Required field validation
        if (name == null || name.isBlank() ||
                email == null || email.isBlank() ||
                password == null ||
                confirmPassword == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register.jsp?error=missing"
            );
            return;
        }

        // Password confirmation
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register.jsp?error=password"
            );
            return;
        }

        // Minimum password length
        if (password.length() < 6) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register.jsp?error=short"
            );
            return;
        }

        // Default role
        if (!"BUYER".equals(role) &&
                !"SELLER".equals(role)) {

            role = "BUYER";
        }

        name = name.trim();
        email = email.trim().toLowerCase();

        // Check whether email already exists
        if (new UserDAOImpl().findByEmail(email) != null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register.jsp?error=exists"
            );
            return;
        }

        // Register user
        boolean registered = userService.register(
                name,
                email,
                password,
                role
        );

        if (registered) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp?registered=1"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register.jsp?error=registration"
            );
        }
    }
}