package com.nikki.nikkimart.service;

import com.nikki.nikkimart.dao.CartDAO;
import com.nikki.nikkimart.model.CartItem;

import java.util.List;

public class CartService {

    private final CartDAO cartDAO;

    public CartService(CartDAO cartDAO) {
        this.cartDAO = cartDAO;
    }

    public boolean addToCart(int userId, int productId, int quantity) {
        if (quantity <= 0) {
            return false;
        }

        CartItem existing = cartDAO.findExisting(userId, productId);

        if (existing != null) {
            int newQty = existing.getQuantity() + quantity;
            return cartDAO.updateQuantity(existing.getId(), userId, newQty);
        }

        return cartDAO.addItem(userId, productId, quantity);
    }

    public boolean updateQuantity(int cartItemId, int userId, int quantity) {
        if (quantity <= 0) {
            return cartDAO.removeItem(cartItemId, userId);
        }
        return cartDAO.updateQuantity(cartItemId, userId, quantity);
    }

    public boolean removeItem(int cartItemId, int userId) {
        return cartDAO.removeItem(cartItemId, userId);
    }

    public List<CartItem> getCart(int userId) {
        return cartDAO.findByUser(userId);
    }

    public java.math.BigDecimal getCartTotal(int userId) {
        List<CartItem> items = cartDAO.findByUser(userId);
        java.math.BigDecimal total = java.math.BigDecimal.ZERO;
        for (CartItem item : items) {
            total = total.add(item.getSubtotal());
        }
        return total;
    }

    public void clearCart(int userId) {
        cartDAO.clearCart(userId);
    }
}