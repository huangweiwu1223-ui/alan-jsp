package com.example.demo.model;

public class Policy {
    private String policyNumber;
    private String type;
    private int sumInsured;

    public Policy(String policyNumber, String type, int sumInsured) {
        this.policyNumber = policyNumber;
        this.type = type;
        this.sumInsured = sumInsured;
    }

    public String getPolicyNumber() {
        return policyNumber;
    }

    public String getType() {
        return type;
    }

    public int getSumInsured() {
        return sumInsured;
    }
}
