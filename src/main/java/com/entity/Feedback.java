
package com.entity;

public class Feedback
{
    private int id;
    private String name;
    private String email;
    private String phone;
    private String message;
    private int userId;
    
    public Feedback(final String name, final String email, final String phone, final String message, final int userId) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.message = message;
        this.userId = userId;
    }
    
    public Feedback(final int id, final String name, final String email, final String phone, final String message, final int userId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.message = message;
        this.userId = userId;
    }
    
    public Feedback() {
    }
    
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(final int userId) {
        this.userId = userId;
    }
    
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
    
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(final String phone) {
        this.phone = phone;
    }
    
    public String getMessage() {
        return this.message;
    }
    
    public void setMessage(final String message) {
        this.message = message;
    }
}