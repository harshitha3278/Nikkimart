package com.nikki.nikkimart.service;

import com.nikki.nikkimart.dao.CartDAO;
import com.nikki.nikkimart.dao.OrderDAO;
import com.nikki.nikkimart.model.CartItem;
import com.nikki.nikkimart.model.Order;
import com.nikki.nikkimart.model.OrderItem;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    private final OrderDAO orderDAO;
    private final CartDAO cartDAO;

    public OrderService(OrderDAO orderDAO, CartDAO cartDAO) {
        this.orderDAO = orderDAO;
        this.cartDAO = cartDAO;
    }

    public int placeOrder(int userId) {

        List<CartItem> cartItems =
                cartDAO.findByUser(userId);

        if (cartItems.isEmpty()) {
            return -1;
        }

        BigDecimal total = BigDecimal.ZERO;

        List<OrderItem> orderItems =
                new ArrayList<>();

        for (CartItem cartItem : cartItems) {

            OrderItem orderItem =
                    new OrderItem();

            orderItem.setProductId(
                    cartItem.getProductId()
            );

            orderItem.setQuantity(
                    cartItem.getQuantity()
            );

            orderItem.setUnitPrice(
                    cartItem.getProductPrice()
            );

            orderItems.add(orderItem);

            total = total.add(
                    cartItem.getSubtotal()
            );
        }

        int orderId =
                orderDAO.placeOrder(
                        userId,
                        orderItems,
                        total
                );

        if (orderId != -1) {
            cartDAO.clearCart(userId);
        }

        return orderId;
    }

    public List<Order> getOrderHistory(int userId) {
        return orderDAO.findByBuyer(userId);
    }

    public List<OrderItem> getOrderItems(int orderId) {
        return orderDAO.findItemsByOrder(orderId);
    }

    public List<Order> getAllOrders() {
        return orderDAO.findAll();
    }

    public List<Order> getSellerOrders(int sellerId) {
        return orderDAO.findBySeller(sellerId);
    }
}