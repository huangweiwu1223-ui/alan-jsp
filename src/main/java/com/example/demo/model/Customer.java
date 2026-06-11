package com.example.demo.model;

public class Customer {
    private Long id;
    private String name;
    private int age;
    private double premium;
    private String email;
    private String phone;
    private String address;
    private String gender;
    private String birthDate;
    private String occupation;
    private String idNumber;
    private String maritalStatus;

    public Customer() {}

    public Customer(Long id, String name, int age, double premium) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.premium = premium;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public double getPremium() { return premium; }
    public void setPremium(double premium) { this.premium = premium; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getBirthDate() { return birthDate; }
    public void setBirthDate(String birthDate) { this.birthDate = birthDate; }
    public String getOccupation() { return occupation; }
    public void setOccupation(String occupation) { this.occupation = occupation; }
    public String getIdNumber() { return idNumber; }
    public void setIdNumber(String idNumber) { this.idNumber = idNumber; }
    public String getMaritalStatus() { return maritalStatus; }
    public void setMaritalStatus(String maritalStatus) { this.maritalStatus = maritalStatus; }
}
