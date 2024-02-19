
package com.entity;

public class Book_Order
{
    private int id;
    private String order_date;
    private String orderid;
    private String username;
    private String email;
    private String phone;
    private String fullAdd;
    private String bname;
    private String bauthor;
    private String bprice;
    private String paymentType;
    
    public int getId() {
        return this.id;
    }
    
    public void setId(final int id) {
        this.id = id;
    }
    
    public String getOrder_date() {
        return this.order_date;
    }
    
    public void setOrder_date(final String order_date) {
        this.order_date = order_date;
    }
    
    public String getOrderid() {
        return this.orderid;
    }
    
    public void setOrderid(final String orderid) {
        this.orderid = orderid;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(final String username) {
        this.username = username;
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
    
    public String getFullAdd() {
        return this.fullAdd;
    }
    
    public void setFullAdd(final String fullAdd) {
        this.fullAdd = fullAdd;
    }
    
    public String getBname() {
        return this.bname;
    }
    
    public void setBname(final String bname) {
        this.bname = bname;
    }
    
    public String getBauthor() {
        return this.bauthor;
    }
    
    public void setBauthor(final String bauthor) {
        this.bauthor = bauthor;
    }
    
    public String getBprice() {
        return this.bprice;
    }
    
    public void setBprice(final String bprice) {
        this.bprice = bprice;
    }
    
    public String getPaymentType() {
        return this.paymentType;
    }
    
    public void setPaymentType(final String paymentType) {
        this.paymentType = paymentType;
    }
    
    @Override
    public String toString() {
        return "Book_Order [id=" + this.id + ", order_date=" + this.order_date + ", orderid=" + this.orderid + ", username=" + this.username + ", email=" + this.email + ", phone=" + this.phone + ", fullAdd=" + this.fullAdd + ", bname=" + this.bname + ", bauthor=" + this.bauthor + ", bprice=" + this.bprice + ", paymentType=" + this.paymentType + "]";
    }
}