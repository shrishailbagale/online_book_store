
package com.entity;

public class Orders
{
    private int id;
    private String date;
    private String orderId;
    private int bookId;
    private int userId;
    private int quantity;
    private String totalAmount;
    private String paymentType;
    private String status;
    
    public Orders(final String date, final String orderId, final int bookId, final int userId, final int quantity, final String totalAmount, final String paymentType, final String status) {
        this.date = date;
        this.orderId = orderId;
        this.bookId = bookId;
        this.userId = userId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.paymentType = paymentType;
        this.status = status;
    }
    
    public Orders() {
    }
    
    public String getDate() {
        return this.date;
    }
    
    public void setDate(final String date) {
        this.date = date;
    }
    
    public int getId() {
        return this.id;
    }
    
    public void setId(final int id) {
        this.id = id;
    }
    
    public String getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(final String orderId) {
        this.orderId = orderId;
    }
    
    public int getBookId() {
        return this.bookId;
    }
    
    public void setBookId(final int bookId) {
        this.bookId = bookId;
    }
    
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(final int userId) {
        this.userId = userId;
    }
    
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(final int quantity) {
        this.quantity = quantity;
    }
    
    public String getTotalAmount() {
        return this.totalAmount;
    }
    
    public void setTotalAmount(final String totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public String getPaymentType() {
        return this.paymentType;
    }
    
    public void setPaymentType(final String paymentType) {
        this.paymentType = paymentType;
    }
    
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(final String status) {
        this.status = status;
    }
}