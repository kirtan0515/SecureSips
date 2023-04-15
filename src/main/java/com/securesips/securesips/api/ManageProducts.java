package com.securesips.securesips.api;

import com.securesips.securesips.dao.ProductDAO;
import com.securesips.securesips.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "ManageProducts", value = "/ManageProducts")
public class ManageProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all products from the database
        List<Product> products = null;
        try {
            products = ProductDAO.getAllProducts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Set the products as a request attribute
        request.setAttribute("products", products);

        // Forward the request to productList.jsp
        request.getRequestDispatcher("productForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get form data
        String category = request.getParameter("product-category");
        String name = request.getParameter("product-name");
        String description = request.getParameter("product-description");
        double price = Double.parseDouble(request.getParameter("product-price"));
        int quantity = Integer.parseInt(request.getParameter("product-quantity"));

        System.out.println("Request Revieved: ");
        System.out.println("Category: " + category);
        System.out.println("Name: " + name);
        System.out.println("Description: " + description);
        System.out.println("Price: " + price);
        System.out.println("Quantity: " + quantity);
        // read the image file as a byte array
        Part imagePart = request.getPart("product-image");
        InputStream imageStream = imagePart.getInputStream();
        byte[] imageData = imageStream.readAllBytes();

        Product new_product = new Product(category, name, description, price, quantity, imageData);
        try {
            ProductDAO.insertProduct(new_product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("status", "success");
        request.setAttribute("message", name + " has been added!");
        request.getRequestDispatcher("productForm.jsp").include(request, response);
    }
}
