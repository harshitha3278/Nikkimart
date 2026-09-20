package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.CartDAOImpl;
import com.nikki.nikkimart.dao.OrderDAOImpl;
import com.nikki.nikkimart.model.Order;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private final OrderService orderService =
            new OrderService(new OrderDAOImpl(), new CartDAOImpl());

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User loggedInUser =
                (User) session.getAttribute("user");

        int userId = loggedInUser.getId();

        String action = request.getParameter("action");

        // =========================
        // BUYER - ORDER HISTORY
        // =========================
        if ("history".equals(action)) {

            List<Order> orders =
                    orderService.getOrderHistory(userId);

            request.setAttribute("orders", orders);

            request.getRequestDispatcher(
                    "/order-history.jsp"
            ).forward(request, response);
        }

        // =========================
        // SELLER - INCOMING ORDERS
        // =========================
        else if ("incoming".equals(action)) {

            String role = loggedInUser.getRole();

            if (!"SELLER".equalsIgnoreCase(role)) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "Access denied"
                );
                return;
            }

            List<Order> orders =
                    orderService.getSellerOrders(userId);

            request.setAttribute("orders", orders);

            request.getRequestDispatcher(
                    "/seller-orders.jsp"
            ).forward(request, response);
        }

        // =========================
        // VIEW ORDER DETAILS
        // =========================
        else if ("view".equals(action)) {

            String orderIdParameter =
                    request.getParameter("orderId");

            if (orderIdParameter == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/order?action=history"
                );
                return;
            }

            try {

                int orderId =
                        Integer.parseInt(orderIdParameter);

                request.setAttribute(
                        "orderItems",
                        orderService.getOrderItems(orderId)
                );

                request.getRequestDispatcher(
                        "/order-details.jsp"
                ).forward(request, response);

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/order?action=history"
                );
            }
        }

        // =========================
        // DEFAULT
        // =========================
        else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/order?action=history"
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User loggedInUser =
                (User) session.getAttribute("user");

        int userId = loggedInUser.getId();

        String action =
                request.getParameter("action");

        // =========================
        // STEP 1 - CHECKOUT
        // =========================
        if ("place".equals(action)) {

            session.setAttribute(
                    "pendingOrder",
                    true
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/mock-payment.jsp"
            );
        }

        // =========================
        // STEP 2 - CONFIRM PAYMENT
        // =========================
        else if ("confirmPayment".equals(action)) {

            Object pendingOrder =
                    session.getAttribute("pendingOrder");

            if (pendingOrder == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/cart?error=invalidpayment"
                );
                return;
            }

            int orderId =
                    orderService.placeOrder(userId);

            session.removeAttribute(
                    "pendingOrder"
            );

            if (orderId != -1) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/order?action=history&placed=1"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                                + "/cart?error=emptycart"
                );
            }
        }

        // =========================
        // DEFAULT POST
        // =========================
        else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/order?action=history"
            );
        }
    }
}