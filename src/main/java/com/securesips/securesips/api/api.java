package com.securesips.securesips.api;

import com.google.gson.Gson;
import com.securesips.securesips.dao.ProductDAO;
import com.securesips.securesips.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "api", value = "/api/*")
public class api extends HttpServlet {
    @Override
    public void init(){
        System.out.println("API (init): Servlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String apiKey = request.getParameter("apiKey");
        PrintWriter out = response.getWriter();


        if(apiKey == null || pathInfo == null){
            out.println("Missing API Key / Path");
            out.flush();
            return;
        }
        if (!apiKey.equals("secret_key")){
            out.println("Invalid API Key");
            out.flush();
            return;
        }
        String[] parts = pathInfo.split("/");
        if ("get_products".equalsIgnoreCase(parts[parts.length - 1]))
        {
            List<Product> productList = null;
            try {
                productList = ProductDAO.getAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            out.print(gson.toJson(productList));
            out.flush();
            return;
        }
        out.println("Invalid Path");
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
