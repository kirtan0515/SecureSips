package com.securesips.securesips.api;
import com.securesips.securesips.entity.CartItem;


import com.securesips.securesips.dao.ProductDAO;
import com.securesips.securesips.entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet(name = "checkout", value = "/checkout")
public class checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        int productId = Integer.parseInt(request.getParameter("productId"));
        CartItem cartItem = cart.get(productId);
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setQuantity(1);
            Product product = null;
            try {
                product = ProductDAO.getProduct(productId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            cartItem.setProduct(product); // Get the product details from the database
            cart.put(productId, cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
        response.sendRedirect("checkout.jsp");
    }
}
