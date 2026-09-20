# 🛒 NikkiMart

NikkiMart is a multi-seller e-commerce marketplace developed using Java Servlets and JSP. It allows buyers to browse and purchase products, sellers to manage products and orders, and administrators to manage users, orders, and product listings.

## ✨ Features

### F1 – User Registration & Login
- Buyer and Seller registration
- Secure login using BCrypt password hashing
- Admin access through seed account
- Session-based authentication

### F2 – Seller Product Management
- Add products
- Edit products
- Delete products
- Manage price, stock, category and description

### F3 – Product Browsing
- Browse available products
- Search products
- Filter by category
- View product details

### F4 – Shopping Cart
- Add products to cart
- Update quantity
- Remove products
- Calculate cart total

### F5 – Checkout & Payment
- Mock checkout/order placement
- Order total calculation
- Order creation after checkout

### F6 – Order Management
- Buyers can view order history
- Buyers can view order details and status
- Sellers can view incoming orders

### F7 – Admin Management
- View registered users
- View orders
- View product listings
- Product moderation

### F8 – Reviews & Ratings
- Buyers can submit ratings and reviews
- Reviews are associated with purchased products
- Average product rating is displayed

## 🛠️ Technologies Used

- Java 17
- Java Servlets
- JSP
- Apache Tomcat 9
- Maven
- H2 Database
- BCrypt
- HTML5
- CSS3
- JavaScript

## 🏗️ Architecture

The application follows a layered MVC-based architecture:

- Model
- View (JSP)
- Controller (Servlets)
- Service Layer
- DAO Layer
- Database Layer

## 🗄️ Database

H2 Database is used for storing:

- Users
- Products
- Cart Items
- Orders
- Order Items
- Reviews

## 🚀 How to Run

### 1. Build the project

```bash
mvn clean package