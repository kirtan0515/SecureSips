package com.securesips.securesips.api;

import com.google.gson.Gson;
import com.securesips.securesips.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
// Changed value to "/add-product" to match fetch request
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Example list of products. Replace this with your own implementation to fetch products from the database or another data source.
        List<Product> products = new ArrayList<>();
//        products.add(new Product(1, "Example Category", "Example Product", "This is an example product description.", 9.99, "example-image.jpg"));

        // Convert the products to a JSON string
        Gson gson = new Gson();
        String productsJson = gson.toJson(products);

        // Set the response content type and write the JSON string
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(productsJson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
