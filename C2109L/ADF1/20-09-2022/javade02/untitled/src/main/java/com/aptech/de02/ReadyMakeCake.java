package com.aptech.de02;

public class ReadyMakeCake extends Cake{
    private Integer quantity;

    public ReadyMakeCake(String name, Double rate, Integer quantity) {
        super(name, rate);
        this.quantity = quantity;
    }

    @Override
    public double calculatePrice() {
        return rate * quantity;
    }
}
