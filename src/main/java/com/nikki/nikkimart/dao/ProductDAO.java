package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.Product;
import java.util.List;

public interface ProductDAO {

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean deleteProduct(int productId, int sellerId);

    Product findById(int productId);

    List<Product> findAll();

    List<Product> findBySeller(int sellerId);

    List<Product> search(String keyword, String category);
}