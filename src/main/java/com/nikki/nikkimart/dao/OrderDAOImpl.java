package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.Order;
import com.nikki.nikkimart.model.OrderItem;
import com.nikki.nikkimart.util.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int placeOrder(int buyerId,
                           List<OrderItem> items,
                           BigDecimal totalAmount) {

        String insertOrderSql =
                "INSERT INTO orders (buyer_id, status, total_amount) " +
                "VALUES (?, ?, ?)";

        String insertItemSql =
                "INSERT INTO order_items " +
                "(order_id, product_id, quantity, unit_price) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection()) {

            con.setAutoCommit(false);

            int orderId;

            try (PreparedStatement ps =
                         con.prepareStatement(
                                 insertOrderSql,
                                 Statement.RETURN_GENERATED_KEYS)) {

                ps.setInt(1, buyerId);
                ps.setString(2, "PENDING");
                ps.setBigDecimal(3, totalAmount);

                ps.executeUpdate();

                try (ResultSet keys = ps.getGeneratedKeys()) {

                    if (keys.next()) {
                        orderId = keys.getInt(1);
                    } else {
                        con.rollback();
                        return -1;
                    }
                }
            }

            try (PreparedStatement ps =
                         con.prepareStatement(insertItemSql)) {

                for (OrderItem item : items) {

                    ps.setInt(1, orderId);
                    ps.setInt(2, item.getProductId());
                    ps.setInt(3, item.getQuantity());
                    ps.setBigDecimal(4, item.getUnitPrice());

                    ps.addBatch();
                }

                ps.executeBatch();
            }

            con.commit();

            return orderId;

        } catch (Exception e) {

            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public List<Order> findByBuyer(int buyerId) {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT * FROM orders " +
                "WHERE buyer_id = ? " +
                "ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, buyerId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    orders.add(mapOrder(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<OrderItem> findItemsByOrder(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        String sql =
                "SELECT oi.*, p.name AS product_name " +
                "FROM order_items oi " +
                "JOIN products p ON oi.product_id = p.id " +
                "WHERE oi.order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    OrderItem item = new OrderItem();

                    item.setId(rs.getInt("id"));
                    item.setOrderId(rs.getInt("order_id"));
                    item.setProductId(rs.getInt("product_id"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setUnitPrice(
                            rs.getBigDecimal("unit_price")
                    );

                    items.add(item);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    @Override
    public List<Order> findAll() {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT * FROM orders " +
                "ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Order> findBySeller(int sellerId) {

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT DISTINCT o.* " +
                "FROM orders o " +
                "JOIN order_items oi ON o.id = oi.order_id " +
                "JOIN products p ON oi.product_id = p.id " +
                "WHERE p.seller_id = ? " +
                "ORDER BY o.created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sellerId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    orders.add(mapOrder(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    private Order mapOrder(ResultSet rs) throws Exception {

        Order order = new Order();

        order.setId(rs.getInt("id"));
        order.setBuyerId(rs.getInt("buyer_id"));
        order.setStatus(rs.getString("status"));
        order.setTotalAmount(
                rs.getBigDecimal("total_amount")
        );
        order.setCreatedAt(
                rs.getTimestamp("created_at")
        );

        return order;
    }
}