package com.securesips.securesips.api;

import com.securesips.securesips.entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import com.google.gson.Gson;

@WebServlet(name = "productForm", value = "/add-product") // Changed value to "/add-product" to match fetch request
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Example list of products. Replace this with your own implementation to fetch products from the database or another data source.
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Example Category", "Example Product", "This is an example product description.", 9.99, "example-image.jpg"));

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
        // get form data
        String category = request.getParameter("product-category");
        String name = request.getParameter("product-name");
        String description = request.getParameter("product-description");
        String price = request.getParameter("product-price");
        Part image = request.getPart("product-image");

        // do something with the data
        // ...

        // return a response
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"status\": \"success\", \"message\": \"Product form submitted successfully!\"}");
    }
}
