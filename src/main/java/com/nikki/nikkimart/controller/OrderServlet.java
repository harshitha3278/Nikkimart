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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User loggedInUser = (User) session.getAttribute("user");
        int userId = loggedInUser.getId();

        String action = request.getParameter("action");

        if ("history".equals(action)) {
            List<Order> orders = orderService.getOrderHistory(userId);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/order-history.jsp").forward(request, response);

        } else if ("view".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            request.setAttribute("orderItems", orderService.getOrderItems(orderId));
            request.getRequestDispatcher("/order-details.jsp").forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/order?action=history");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User loggedInUser = (User) session.getAttribute("user");
        int userId = loggedInUser.getId();

        String action = request.getParameter("action");

        if ("place".equals(action)) {
            int orderId = orderService.placeOrder(userId);

            if (orderId != -1) {
                response.sendRedirect(request.getContextPath() + "/order?action=history&placed=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart?error=emptycart");
            }
        }
    }
}