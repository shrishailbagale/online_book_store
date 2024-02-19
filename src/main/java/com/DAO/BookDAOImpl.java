
package com.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import com.entity.BookDtls;
import java.sql.Connection;

public class BookDAOImpl implements BookDAO
{
    private Connection conn;
    
    public BookDAOImpl(final Connection conn) {
        this.conn = conn;
    }
    
    public boolean addBook(final BookDtls b) {
        boolean f = false;
        try {
            final String sql = "insert into book_dtls(bname, bauthor, bprice, bcategory, bstatus, bphoto, email) values(?,?,?,?,?,?,?)";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, b.getBname());
            ps.setString(2, b.getBauthor());
            ps.setString(3, b.getBprice());
            ps.setString(4, b.getBcategory());
            ps.setString(5, b.getBstatus());
            ps.setString(6, b.getBphoto());
            ps.setString(7, b.getEmail());
            final int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<BookDtls> getAllBooks() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public BookDtls getBookById(final int id) {
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    public boolean updateEditBooks(final BookDtls b) {
        boolean f = false;
        try {
            final String sql = "update book_dtls set bname=?,bauthor=?,bprice=?,bstatus=? where bid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, b.getBname());
            ps.setString(2, b.getBauthor());
            ps.setString(3, b.getBprice());
            ps.setString(4, b.getBstatus());
            ps.setInt(5, b.getbId());
            final int i = ps.executeUpdate();
            if (i == 1) {
                f = false;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteBook(final int id) {
        boolean f = false;
        try {
            final String sql = "delete from book_dtls where bid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            final int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<BookDtls> getNewBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bcategory=? and bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            final ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                if (i > 4) {
                    break;
                }
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                ++i;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getRecentBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "Active");
            final ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                if (i > 4) {
                    break;
                }
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                ++i;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getOldBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bcategory=? and bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            final ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                if (i > 4) {
                    break;
                }
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                ++i;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllRecentBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "Active");
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllNewBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bcategory=? and bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllOldBook() {
        final List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            final String sql = "select * from book_dtls where bcategory=? and bstatus=? order by bId DESC";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next()) {
                b = new BookDtls();
                b.setbId(rs.getInt(1));
                b.setBname(rs.getString(2));
                b.setBauthor(rs.getString(3));
                b.setBprice(rs.getString(4));
                b.setBcategory(rs.getString(5));
                b.setBstatus(rs.getString(6));
                b.setBphoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}