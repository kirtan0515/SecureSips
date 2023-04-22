package com.securesips.securesips.dao;

import com.securesips.securesips.entity.Product;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class ProductDAO {
    protected static Properties props;
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, category, description, price, quantity, imageUrl) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE products SET name=?, category=?, description=?, price=?, quantity=?, imageUrl=? WHERE id=?";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id=?";
    private static final String GET_PRODUCT_SQL = "SELECT * FROM products WHERE id=?";
    private static final String GET_ALL_PRODUCTS_SQL = "SELECT * FROM products";


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

    public static void insertProduct(Product product) throws SQLException {

        System.out.println("ProductDAO (insertProduct): requested");
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);
        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2, product.getCategory());
        preparedStatement.setString(3, product.getDescription());
        preparedStatement.setDouble(4, product.getPrice());
        preparedStatement.setInt(5, product.getQuantity());
        preparedStatement.setBlob(6, new ByteArrayInputStream(product.getImageUrl()));
        preparedStatement.executeUpdate();
        System.out.println("ProductDAO (insertProduct): product successfully added");
    }

    public static void updateProduct(Product product) throws SQLException {
        System.out.println("ProductDAO (updateProduct): requested");
        Connection connection = getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);
        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2, product.getCategory());
        preparedStatement.setString(3, product.getDescription());
        preparedStatement.setDouble(4, product.getPrice());
        preparedStatement.setInt(5, product.getQuantity());
        preparedStatement.setBlob(6, new ByteArrayInputStream(product.getImageUrl()));
        preparedStatement.setInt(7, product.getId());
        preparedStatement.executeUpdate();
        System.out.println("ProductDAO (updateProduct): product updated successfully");

    }

    public static void deleteProduct(int id) throws SQLException {
        System.out.println("ProductDAO (deleteProduct): requested");
        Connection connection = getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }

    public static List<Product> getAllProducts() throws SQLException {
        System.out.println("ProductDAO (getAllProducts): requested");
        Connection connection = getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_PRODUCTS_SQL);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Product> productList = new ArrayList<>();

        while (resultSet.next()) {
            Product product = new Product();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setCategory(resultSet.getString("category"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getDouble("price"));
            product.setQuantity(resultSet.getInt("quantity"));
            product.setImageUrl(resultSet.getBytes("imageUrl"));
            productList.add(product);
        }
        return productList;
    }

    public static Product getProduct(int id) throws SQLException {
        System.out.println("ProductDAO (getProduct): requested");
        Connection connection = getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_SQL);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            Product product = new Product();

            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setCategory(resultSet.getString("category"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getDouble("price"));
            product.setQuantity(resultSet.getInt("quantity"));
            product.setImageUrl(resultSet.getBytes("imageUrl"));
            return product;
        } else {
            return null;
        }
    }
}