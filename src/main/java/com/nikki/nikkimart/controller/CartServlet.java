package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.CartDAOImpl;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final CartService cartService = new CartService(new CartDAOImpl());

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

        request.setAttribute("items", cartService.getCart(userId));
        request.setAttribute("total", cartService.getCartTotal(userId));

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
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

        try {
            if ("add".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = parseQuantityOrDefault(request.getParameter("quantity"), 1);
                cartService.addToCart(userId, productId, quantity);
            } else if ("update".equals(action)) {
                int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                int quantity = parseQuantityOrDefault(request.getParameter("quantity"), 1);
                cartService.updateQuantity(cartItemId, userId, quantity);
            } else if ("remove".equals(action)) {
                int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                cartService.removeItem(cartItemId, userId);
            } else if ("clear".equals(action)) {
                cartService.clearCart(userId);
            }
        } catch (NumberFormatException e) {
            System.out.println("Bad input received on cart action");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private int parseQuantityOrDefault(String rawValue, int defaultValue) {
        if (rawValue == null || rawValue.isBlank()) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(rawValue);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}