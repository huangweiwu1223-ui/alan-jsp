package com.example.demo.model;

public class Customer {
    private String name;
    private int age;
    private double premium;

    public Customer(String name, int age, double premium) {
        this.name = name;
        this.age = age;
        this.premium = premium;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public double getPremium() {
        return premium;
    }
}
