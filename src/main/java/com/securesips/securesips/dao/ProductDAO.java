package com.securesips.securesips.dao;

import com.securesips.securesips.entity.Product;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class ProductDAO {
    protected static Properties props;

    protected static Connection getConnection() {
        props = new Properties();
        Connection currentCon = null;

        try {
            props.load(ProductDAO.class.getClassLoader().getResourceAsStream("database.properties"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            currentCon = DriverManager.getConnection(props.getProperty("db.url"), props.getProperty("db.username"), props.getProperty("db.password"));
        } catch (IOException | SQLException | ClassNotFoundException e) {
            System.out.println("Error loading database.properties: " + e);
            throw new RuntimeException(e);
        }
        return currentCon;
    }

    // Create a product
    public void createProduct(Product product) {
        String query = "INSERT INTO products (buyerId, name, description, price, quantity, imageUrl) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, product.getBuyerId());
            pstmt.setString(2, product.getName());
            pstmt.setString(3, product.getDescription());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setInt(5, (int) product.getQuantity());
            pstmt.setString(6, product.getImageUrl());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error creating product: " + e);
            throw new RuntimeException(e);
        }
    }

    // Update product
    public void updateProduct(Product product) {
        String query = "UPDATE products SET buyerId=?, name=?, description=?, price=?, quantity=?, imageUrl=? WHERE id=?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, product.getBuyerId());
            pstmt.setString(2, product.getName());
            pstmt.setString(3, product.getDescription());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setInt(5, (int) product.getQuantity());
            pstmt.setString(6, product.getImageUrl());
            pstmt.setInt(7, product.getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating product: " + e);
            throw new RuntimeException(e);
        }
    }

    // Delete product
    public void deleteProduct(int productId) {
        String query = "DELETE FROM products WHERE id=?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, productId);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting product: " + e);
            throw new RuntimeException(e);
        }
    }

    // Get Product
    public Product getProduct(int productId) {
        String query = "SELECT * FROM products WHERE id=?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                int buyerId = rs.getInt("buyerId");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                double quantity = rs.getDouble("quantity");
                String imageUrl = rs.getString("imageUrl");

                return new Product(id, buyerId, name, description, price, quantity, imageUrl);
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error deleting product: " + e);
            throw new RuntimeException(e);
        }
    }

}