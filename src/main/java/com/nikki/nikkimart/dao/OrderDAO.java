package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.Order;
import com.nikki.nikkimart.model.OrderItem;

import java.util.List;

public interface OrderDAO {

    int placeOrder(int buyerId, List<OrderItem> items, java.math.BigDecimal totalAmount);

    List<Order> findByBuyer(int buyerId);

    List<OrderItem> findItemsByOrder(int orderId);

    List<Order> findAll();
}
