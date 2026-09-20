package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.CartDAOImpl;
import com.nikki.nikkimart.dao.OrderDAOImpl;
import com.nikki.nikkimart.dao.ProductDAOImpl;
import com.nikki.nikkimart.dao.UserDAOImpl;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private final UserDAOImpl userDAO =
            new UserDAOImpl();

    private final ProductDAOImpl productDAO =
            new ProductDAOImpl();

    private final OrderService orderService =
            new OrderService(
                    new OrderDAOImpl(),
                    new CartDAOImpl()
            );

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check login
        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );
            return;
        }

        User loggedInUser =
                (User) session.getAttribute("user");

        // Admin only
        if (!"ADMIN".equalsIgnoreCase(
                loggedInUser.getRole())) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access denied"
            );
            return;
        }

        // Load dashboard data
        request.setAttribute(
                "users",
                userDAO.findAll()
        );

        request.setAttribute(
                "orders",
                orderService.getAllOrders()
        );

        request.setAttribute(
                "products",
                productDAO.findAll()
        );

        request.getRequestDispatcher(
                "/admin.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check login
        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp"
            );
            return;
        }

        User loggedInUser =
                (User) session.getAttribute("user");

        // Admin only
        if (!"ADMIN".equalsIgnoreCase(
                loggedInUser.getRole())) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access denied"
            );
            return;
        }

        String action =
                request.getParameter("action");

        // =========================
        // DELETE PRODUCT
        // =========================

        if ("deleteProduct".equals(action)) {

            String productIdParam =
                    request.getParameter("productId");

            if (productIdParam != null &&
                    !productIdParam.isBlank()) {

                try {

                    int productId =
                            Integer.parseInt(
                                    productIdParam
                            );

                    productDAO.deleteProductByAdmin(
                            productId
                    );

                } catch (NumberFormatException e) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid product ID"
                    );
                    return;
                }
            }

            // Refresh admin dashboard
            response.sendRedirect(
                    request.getContextPath()
                            + "/admin"
            );

            return;
        }

        // Unknown action
        response.sendRedirect(
                request.getContextPath()
                        + "/admin"
        );
    }
}