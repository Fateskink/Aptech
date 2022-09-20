package com.aptech.de02;

public abstract class Cake {
    protected String name;
    protected Double rate;

    public Cake(String name, Double rate) {
        this.name = name;
        this.rate = rate;
    }
    public abstract double calculatePrice();

    @Override
    public String toString() {
        return "name: "+name+
                "rate: "+rate;
    }
}
