<%@ page import="com.securesips.securesips.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/dash.css">
    <link rel="stylesheet" href="./assets/css/shop.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Secure Sips - Our Products</title>
</head>
<body>
<div class="navigation-bar">
    <div id="navigation-container">
        <a href="dash"><img src="./assets/images/aa.png"></a>
        <!-- Add the search bar and button inside the navigation-container div -->
        <div class="search-container">
            <input type="text" id="search-bar" placeholder="Search products...">
            <button id="search-btn"><i class="fa fa-search"></i></button>
        </div>
        <div class="menu-container">
            <div class="hamburger">
                <i class="fa fa-bars"></i>
                <span class="cart-quantity">0</span>
            </div>
            <ul>
                <li><a href="checkout">Shopping Cart</a></li>
                <li><a href="#">My Account</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
        <!-- Add this div to display the order review panel -->
        <div class="order-review-panel">
            <h3>Added Products</h3>
            <ul class="product-list"></ul>
            <h3>Total: <span class="total-price">$0.00</span></h3>
        </div>
    </div>
</div>
    <% List<Product> products = null;
    try {
        products = com.securesips.securesips.dao.ProductDAO.getAllProducts();
    } catch (SQLException e) {
        e.printStackTrace();
    } %>

<%--<h1>Our Products</h1>--%>
<div>
    <div class="product-grid">
            <% for (Product product : products) { %>
        <div class="product-card">
            <div class="product-tumb">
                <img src="data:image/png;base64,<%= product.getBase64Image() %>">
            </div>
            <div class="product-details">
                <span class="product-catagory"><%= product.getCategory() %></span>
                <h4><a href="/products/<%= product.getId() %>"><%= product.getName() %></a></h4>
                <p class="product-description"><%= product.getDescription() %></p>
                <div class="product-bottom-details">
                    <div class="product-price">$<%= product.getPrice() %></div>
                    <button class="add-to-cart" data-product-id="<%= product.getId() %>">Add to Cart</button>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<script src="./assets/js/products.js"></script>
</body>
</html>