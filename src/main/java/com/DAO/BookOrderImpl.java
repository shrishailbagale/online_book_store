
package com.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.PreparedStatement;
import java.util.List;
import com.entity.Book_Order;
import java.sql.Connection;

public class BookOrderImpl implements BookOrderDAO
{
    private Connection conn;
    private Book_Order[] blist;
    
    public BookOrderImpl(final Connection conn) {
        this.conn = conn;
    }
    
    public boolean saveOrder(final List<Book_Order> blist) {
        boolean f = false;
        try {
            final String sql = "insert into book_order(order_date, orderid, username, email, phone, address, bname, bauthor,bprice,paymentType) value(?,?,?,?,?,?,?,?,?,?)";
            this.conn.setAutoCommit(false);
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            for (final Book_Order b : blist) {
                ps.setString(1, b.getOrder_date());
                ps.setString(2, b.getOrderid());
                ps.setString(3, b.getUsername());
                ps.setString(4, b.getEmail());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getFullAdd());
                ps.setString(7, b.getBname());
                ps.setString(8, b.getBauthor());
                ps.setString(9, b.getBprice());
                ps.setString(10, b.getPaymentType());
                ps.addBatch();
            }
            final int[] count = ps.executeBatch();
            this.conn.commit();
            f = true;
            this.conn.setAutoCommit(true);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Book_Order> getBook(final String email) {
        final List<Book_Order> list = new ArrayList<Book_Order>();
        Book_Order o = null;
        try {
            final String sql = "select * from book_order where email=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, email);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setOrderid(rs.getString(3));
                o.setUsername(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setFullAdd(rs.getString(7));
                o.setBname(rs.getString(8));
                o.setBauthor(rs.getString(9));
                o.setBprice(rs.getString(10));
                o.setPaymentType(rs.getString(11));
                list.add(o);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Book_Order> getAllOrder() {
        final List<Book_Order> list = new ArrayList<Book_Order>();
        Book_Order o = null;
        try {
            final String sql = "select * from book_order";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setOrderid(rs.getString(3));
                o.setUsername(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setFullAdd(rs.getString(7));
                o.setBname(rs.getString(8));
                o.setBauthor(rs.getString(9));
                o.setBprice(rs.getString(10));
                o.setPaymentType(rs.getString(11));
                list.add(o);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}