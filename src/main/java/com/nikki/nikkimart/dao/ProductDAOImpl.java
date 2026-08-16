package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.Product;
import com.nikki.nikkimart.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products " +
                "(seller_id, name, description, price, stock_qty, category, image_url) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, product.getSellerId());
            ps.setString(2, product.getName());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(4, product.getPrice());
            ps.setInt(5, product.getStockQty());
            ps.setString(6, product.getCategory());
            ps.setString(7, product.getImageUrl());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, " +
                "stock_qty = ?, category = ?, image_url = ? " +
                "WHERE id = ? AND seller_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setBigDecimal(3, product.getPrice());
            ps.setInt(4, product.getStockQty());
            ps.setString(5, product.getCategory());
            ps.setString(6, product.getImageUrl());
            ps.setInt(7, product.getId());
            ps.setInt(8, product.getSellerId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int productId, int sellerId) {
        String sql = "DELETE FROM products WHERE id = ? AND seller_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setInt(2, sellerId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Product findById(int productId) {
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> findBySeller(int sellerId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE seller_id = ? ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                products.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> search(String keyword, String category) {
        List<Product> products = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE 1=1");

        if (keyword != null && !keyword.isBlank()) {
            sql.append(" AND LOWER(name) LIKE ?");
        }
        if (category != null && !category.isBlank()) {
            sql.append(" AND category = ?");
        }
        sql.append(" ORDER BY created_at DESC");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int idx = 1;
            if (keyword != null && !keyword.isBlank()) {
                ps.setString(idx++, "%" + keyword.toLowerCase() + "%");
            }
            if (category != null && !category.isBlank()) {
                ps.setString(idx++, category);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    private Product mapRow(ResultSet rs) throws Exception {
        Product p = new Product();
        p.setId(rs.getInt("id"));
        p.setSellerId(rs.getInt("seller_id"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getBigDecimal("price"));
        p.setStockQty(rs.getInt("stock_qty"));
        p.setCategory(rs.getString("category"));
        p.setImageUrl(rs.getString("image_url"));
        return p;
    }
}
