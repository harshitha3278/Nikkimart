package com.nikki.nikkimart.service;

import com.nikki.nikkimart.dao.ProductDAO;
import com.nikki.nikkimart.model.Product;

import java.math.BigDecimal;
import java.util.List;

public class ProductService {

    private final ProductDAO productDAO;

    public ProductService(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    public boolean createProduct(int sellerId, String name, String description,
                                  BigDecimal price, int stockQty, String category,
                                  String imageUrl) {

        if (name == null || name.isBlank()) {
            return false;
        }
        if (price == null || price.compareTo(BigDecimal.ZERO) <= 0) {
            return false;
        }
        if (stockQty < 0) {
            return false;
        }

        Product product = new Product();
        product.setSellerId(sellerId);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStockQty(stockQty);
        product.setCategory(category);
        product.setImageUrl(imageUrl);

        return productDAO.addProduct(product);
    }

    public boolean updateProduct(int productId, int sellerId, String name,
                                  String description, BigDecimal price, int stockQty,
                                  String category, String imageUrl) {

        if (name == null || name.isBlank()) {
            return false;
        }
        if (price == null || price.compareTo(BigDecimal.ZERO) <= 0) {
            return false;
        }
        if (stockQty < 0) {
            return false;
        }

        Product product = new Product();
        product.setId(productId);
        product.setSellerId(sellerId);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStockQty(stockQty);
        product.setCategory(category);
        product.setImageUrl(imageUrl);

        return productDAO.updateProduct(product);
    }

    public boolean deleteProduct(int productId, int sellerId) {
        return productDAO.deleteProduct(productId, sellerId);
    }

    public Product getProduct(int productId) {
        return productDAO.findById(productId);
    }

    public List<Product> getAllProducts() {
        return productDAO.findAll();
    }

    public List<Product> getProductsBySeller(int sellerId) {
        return productDAO.findBySeller(sellerId);
    }

    public List<Product> searchProducts(String keyword, String category) {
        return productDAO.search(keyword, category);
    }
}
