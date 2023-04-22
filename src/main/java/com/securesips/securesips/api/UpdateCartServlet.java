package com.securesips.securesips.api;

import com.securesips.securesips.entity.CartItem;
import com.securesips.securesips.dao.ProductDAO;
import com.securesips.securesips.entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet(name = "UpdateCartServlet", value = "/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.println("Received: productId=" + productId + ", quantity=" + quantity); // Added this line
        System.out.println("ProductId: " + productId); // Debug print statement
        System.out.println("Quantity: " + quantity); // Debug print statement
        CartItem cartItem = cart.get(productId);
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setQuantity(quantity);
            Product product = null;
            try {
                product = ProductDAO.getProduct(productId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            System.out.println("Product: " + product); // Debug print statement
            cartItem.setProduct(product); // Get the product details from the database
            cart.put(productId, cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        }

        PrintWriter out = response.getWriter();
        out.print("{\"success\": true}");
        out.flush();
        System.out.println("Updated cart: " + cart); // Added this line
    }
}
