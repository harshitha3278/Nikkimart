package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.ProductDAOImpl;
import com.nikki.nikkimart.dao.ReviewDAOImpl;
import com.nikki.nikkimart.model.Product;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.ProductService;
import com.nikki.nikkimart.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private ProductService productService;
    private ReviewService reviewService;

    @Override
    public void init() {

        productService =
                new ProductService(new ProductDAOImpl());

        reviewService =
                new ReviewService(new ReviewDAOImpl());
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        if ("browse".equals(action) ||
                action == null) {

            String keyword =
                    request.getParameter("keyword");

            String category =
                    request.getParameter("category");

            List<Product> products;

            if ((keyword != null &&
                    !keyword.isBlank()) ||
                (category != null &&
                    !category.isBlank())) {

                products =
                        productService.searchProducts(
                                keyword,
                                category
                        );

            } else {

                products =
                        productService.getAllProducts();
            }

            request.setAttribute(
                    "products",
                    products
            );

            request.getRequestDispatcher(
                    "browse-products.jsp"
            ).forward(request, response);

            return;
        }

        if ("view".equals(action)) {

            String idParam =
                    request.getParameter("id");

            try {

                int productId =
                        Integer.parseInt(idParam);

                Product product =
                        productService.getProduct(productId);

                if (product == null) {

                    response.sendRedirect(
                            request.getContextPath() +
                                    "/product?action=browse"
                    );

                    return;
                }

                request.setAttribute(
                        "product",
                        product
                );

                request.setAttribute(
                        "reviews",
                        reviewService.getReviews(productId)
                );

                request.setAttribute(
                        "avgRating",
                        reviewService.getAverageRating(productId)
                );

                HttpSession session =
                        request.getSession(false);

                boolean alreadyReviewed = false;
                boolean canReview = false;

                if (session != null &&
                        session.getAttribute("user") != null) {

                    User user =
                            (User) session.getAttribute("user");

                    alreadyReviewed =
                            reviewService.hasUserReviewed(
                                    productId,
                                    user.getId()
                            );

                    canReview =
                            reviewService.canReview(
                                    productId,
                                    user.getId()
                            );
                }

                request.setAttribute(
                        "alreadyReviewed",
                        alreadyReviewed
                );

                request.setAttribute(
                        "canReview",
                        canReview
                );

                request.getRequestDispatcher(
                        "product-detail.jsp"
                ).forward(request, response);

                return;

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath() +
                                "/product?action=browse"
                );

                return;
            }
        }

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() +
                            "/login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        if ("myProducts".equals(action)) {

            List<Product> products =
                    productService.getProductsBySeller(
                            user.getId()
                    );

            request.setAttribute(
                    "products",
                    products
            );

            request.getRequestDispatcher(
                    "my-products.jsp"
            ).forward(request, response);

            return;
        }

        if ("edit".equals(action)) {

            int productId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Product product =
                    productService.getProduct(productId);

            if (product == null ||
                    product.getSellerId() != user.getId()) {

                response.sendRedirect(
                        "product?action=myProducts"
                );

                return;
            }

            request.setAttribute(
                    "product",
                    product
            );

            request.getRequestDispatcher(
                    "edit-product.jsp"
            ).forward(request, response);

            return;
        }

        request.getRequestDispatcher(
                "add-product.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    "login.jsp"
            );

            return;
        }

        User user =
                (User) session.getAttribute("user");

        String action =
                request.getParameter("action");

        if ("delete".equals(action)) {

            int productId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            productService.deleteProduct(
                    productId,
                    user.getId()
            );

            response.sendRedirect(
                    "product?action=myProducts"
            );

            return;
        }

        if ("update".equals(action)) {

            int productId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            String name =
                    request.getParameter("name");

            String description =
                    request.getParameter("description");

            BigDecimal price =
                    parsePrice(
                            request.getParameter("price")
                    );

            int stockQty =
                    parseInt(
                            request.getParameter("stockQty")
                    );

            String category =
                    request.getParameter("category");

            String imageUrl =
                    request.getParameter("imageUrl");

            boolean updated =
                    productService.updateProduct(
                            productId,
                            user.getId(),
                            name,
                            description,
                            price,
                            stockQty,
                            category,
                            imageUrl
                    );

            if (updated) {

                response.sendRedirect(
                        "product?action=myProducts"
                );

            } else {

                response.sendRedirect(
                        "product?action=edit&id=" +
                                productId +
                                "&error=1"
                );
            }

            return;
        }

        String name =
                request.getParameter("name");

        String description =
                request.getParameter("description");

        BigDecimal price =
                parsePrice(
                        request.getParameter("price")
                );

        int stockQty =
                parseInt(
                        request.getParameter("stockQty")
                );

        String category =
                request.getParameter("category");

        String imageUrl =
                request.getParameter("imageUrl");

        boolean created =
                productService.createProduct(
                        user.getId(),
                        name,
                        description,
                        price,
                        stockQty,
                        category,
                        imageUrl
                );

        if (created) {

            response.sendRedirect(
                    "product?action=myProducts"
            );

        } else {

            response.sendRedirect(
                    "product?action=addForm&error=1"
            );
        }
    }

    private BigDecimal parsePrice(String value) {

        try {
            return new BigDecimal(value);

        } catch (Exception e) {

            return null;
        }
    }

    private int parseInt(String value) {

        try {
            return Integer.parseInt(value);

        } catch (Exception e) {

            return -1;
        }
    }
}