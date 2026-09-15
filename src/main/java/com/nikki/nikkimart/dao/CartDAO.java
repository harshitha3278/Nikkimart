package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.CartItem;
import java.util.List;

public interface CartDAO {

    boolean addItem(int userId, int productId, int quantity);

    boolean updateQuantity(int cartItemId, int userId, int quantity);

    boolean removeItem(int cartItemId, int userId);

    List<CartItem> findByUser(int userId);

    CartItem findExisting(int userId, int productId);

    void clearCart(int userId);
}