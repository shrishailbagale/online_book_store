
package com.entity;

public class Cart
{
    private int cid;
    private int bid;
    private int uid;
    private String bname;
    private String bauthor;
    private Double bprice;
    private Double totalprice;
    
    public int getCid() {
        return this.cid;
    }
    
    public void setCid(final int cid) {
        this.cid = cid;
    }
    
    public int getBid() {
        return this.bid;
    }
    
    public void setBid(final int bid) {
        this.bid = bid;
    }
    
    public int getUid() {
        return this.uid;
    }
    
    public void setUid(final int uid) {
        this.uid = uid;
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
    
    public Double getBprice() {
        return this.bprice;
    }
    
    public void setBprice(final Double bprice) {
        this.bprice = bprice;
    }
    
    public Double getTotalprice() {
        return this.totalprice;
    }
    
    public void setTotalprice(final Double totalprice) {
        this.totalprice = totalprice;
    }
}