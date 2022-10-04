package com.product;

public abstract class Product {
    protected String prodId;
    protected String prodName;
    protected int year;
    protected float price;
    public Product() {

    }
    public Product(String prodId, String prodName,
                   int year, float price) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.year = year;
        this.price = price;
    }
    public abstract void input();
    public abstract void display();
}
