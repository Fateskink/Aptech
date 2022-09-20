package com.aptech.de02;

public class OrderCake extends Cake{
    private float weight;
    public OrderCake(String name, Double rate, float weight) {
        super(name, rate);
        this.weight = weight;
    }

    @Override
    public double calculatePrice() {
        return rate * weight;
    }
}
