package com.securesips.securesips.entity;

public class Product {
    private int id;
    private int buyerId;
    private String name;
    private String description;
    private double price;
    private double quantity;
    private String imageUrl;

    public Product(int id, int buyerId, String name, String description, double price, double quantity, String imageUrl) {
        this.id = id;
        this.buyerId = buyerId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }

    public Product(int buyerId, String name, String description, String price, double quantity, String imageUrl) {
        this.buyerId = buyerId;
        this.name = name;
        this.description = description;
        this.price = Double.parseDouble(price);
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
