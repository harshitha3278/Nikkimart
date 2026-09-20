package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.UserDAOImpl;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService(new UserDAOImpl());
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp?error=1"
            );
            return;
        }

        // Authenticate user
        User user = userService.login(
                email.trim(),
                password
        );

        if (user != null) {

            // Invalidate old session
            HttpSession oldSession =
                    request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            // Create fresh session
            HttpSession session =
                    request.getSession(true);

            // Store logged-in user
            session.setAttribute(
                    "user",
                    user
            );

            // 30-minute session timeout
            session.setMaxInactiveInterval(
                    30 * 60
            );

            // Get user role
            String role = user.getRole();

            // =========================
            // SELLER
            // =========================

            if ("SELLER".equalsIgnoreCase(role)) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/seller-dashboard.jsp"
                );

            }

            // =========================
            // ADMIN
            // =========================

            else if ("ADMIN".equalsIgnoreCase(role)) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin"
                );

            }

            // =========================
            // BUYER
            // =========================

            else {

                response.sendRedirect(
                        request.getContextPath()
                                + "/product?action=browse"
                );
            }

        } else {

            // Login failed
            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp?error=1"
            );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp"
        );
    }
}