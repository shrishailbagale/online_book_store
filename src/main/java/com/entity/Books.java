
package com.entity;

public class Books
{
    private int id;
    private String bookName;
    private String author;
    private Double price;
    private String category;
    private String bookStatus;
    private String imgBookName;
    
    public Books() {
    }
    
    public Books(final String bookName, final String author, final Double price, final String category, final String bookStatus, final String imgBookName) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.category = category;
        this.bookStatus = bookStatus;
        this.imgBookName = imgBookName;
    }
    
    public Books(final int id, final String bookName, final String author, final Double price, final String category, final String bookStatus, final String imgBookName) {
        this.id = id;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.category = category;
        this.bookStatus = bookStatus;
        this.imgBookName = imgBookName;
    }
    
    public int getId() {
        return this.id;
    }
    
    public void setId(final int id) {
        this.id = id;
    }
    
    public String getBookName() {
        return this.bookName;
    }
    
    public void setBookName(final String bookName) {
        this.bookName = bookName;
    }
    
    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(final String author) {
        this.author = author;
    }
    
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(final Double price) {
        this.price = price;
    }
    
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(final String category) {
        this.category = category;
    }
    
    public String getBookStatus() {
        return this.bookStatus;
    }
    
    public void setBookStatus(final String bookStatus) {
        this.bookStatus = bookStatus;
    }
    
    public String getImgBookName() {
        return this.imgBookName;
    }
    
    public void setImgBookName(final String imgBookName) {
        this.imgBookName = imgBookName;
    }
    
    @Override
    public String toString() {
        return "Books [id=" + this.id + ", bookName=" + this.bookName + ", author=" + this.author + ", price=" + this.price + ", category=" + this.category + ", bookStatus=" + this.bookStatus + ", imgBookName=" + this.imgBookName + "]";
    }
}