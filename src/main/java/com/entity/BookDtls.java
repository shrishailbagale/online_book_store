
package com.entity;

public class BookDtls
{
    private int bId;
    private String bname;
    private String bauthor;
    private String bprice;
    private String bcategory;
    private String bstatus;
    private String bphoto;
    private String email;
    
    public BookDtls() {
    }
    
    public BookDtls(final String bname, final String bauthor, final String bprice, final String bcategory, final String bstatus, final String bphoto, final String email) {
        this.bname = bname;
        this.bauthor = bauthor;
        this.bprice = bprice;
        this.bcategory = bcategory;
        this.bstatus = bstatus;
        this.bphoto = bphoto;
        this.email = email;
    }
    
    public int getbId() {
        return this.bId;
    }
    
    public void setbId(final int bId) {
        this.bId = bId;
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
    
    public String getBcategory() {
        return this.bcategory;
    }
    
    public void setBcategory(final String bcategory) {
        this.bcategory = bcategory;
    }
    
    public String getBstatus() {
        return this.bstatus;
    }
    
    public void setBstatus(final String bstatus) {
        this.bstatus = bstatus;
    }
    
    public String getBphoto() {
        return this.bphoto;
    }
    
    public void setBphoto(final String bphoto) {
        this.bphoto = bphoto;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(final String email) {
        this.email = email;
    }
    
    @Override
    public String toString() {
        return "BookDtls [bId=" + this.bId + ", bname=" + this.bname + ", bauthor=" + this.bauthor + ", bprice=" + this.bprice + ", bcategory=" + this.bcategory + ", bstatus=" + this.bstatus + ", bphoto=" + this.bphoto + ", email=" + this.email + "]";
    }
}