
package com.entity;

public class User
{
    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String area;
    private String city;
    private String state;
    private String pincode;
    
    public int getId() {
        return this.id;
    }
    
    public void setId(final int id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(final String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(final String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(final String password) {
        this.password = password;
    }
    
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(final String phone) {
        this.phone = phone;
    }
    
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(final String address) {
        this.address = address;
    }
    
    public String getArea() {
        return this.area;
    }
    
    public void setArea(final String area) {
        this.area = area;
    }
    
    public String getCity() {
        return this.city;
    }
    
    public void setCity(final String city) {
        this.city = city;
    }
    
    public String getState() {
        return this.state;
    }
    
    public void setState(final String state) {
        this.state = state;
    }
    
    public String getPincode() {
        return this.pincode;
    }
    
    public void setPincode(final String pincode) {
        this.pincode = pincode;
    }
    
    @Override
    public String toString() {
        return "User [id=" + this.id + ", name=" + this.name + ", email=" + this.email + ", password=" + this.password + ", phone=" + this.phone + ", address=" + this.address + ", area=" + this.area + ", city=" + this.city + ", state=" + this.state + ", pincode=" + this.pincode + "]";
    }
}