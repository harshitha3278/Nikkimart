package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.CartDAOImpl;
import com.nikki.nikkimart.dao.OrderDAOImpl;
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

    private final UserDAOImpl userDAO = new UserDAOImpl();
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

        if (!"ADMIN".equals(loggedInUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        request.setAttribute("users", userDAO.findAll());
        request.setAttribute("orders", orderService.getAllOrders());

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
