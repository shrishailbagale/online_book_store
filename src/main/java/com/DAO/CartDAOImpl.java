
package com.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import com.entity.Cart;
import java.sql.Connection;

public class CartDAOImpl implements CartDAO
{
    private Connection conn;
    
    public CartDAOImpl(final Connection conn) {
        this.conn = conn;
    }
    
    public boolean addCart(final Cart c) {
        boolean f = false;
        try {
            final String sql = "insert into cart(bid, uid,bname, bauthor, bprice, totalprice) value(?,?,?,?,?,?)";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUid());
            ps.setString(3, c.getBname());
            ps.setString(4, c.getBauthor());
            ps.setDouble(5, c.getBprice());
            ps.setDouble(6, c.getTotalprice());
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
    
    public List<Cart> getBookByUser(final int uid) {
        final List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        double totalPrice = 0.0;
        try {
            final String sql = "select * from cart where uid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, uid);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUid(rs.getInt(3));
                c.setBname(rs.getString(4));
                c.setBauthor(rs.getString(5));
                c.setBprice(Double.valueOf(rs.getDouble(6)));
                totalPrice += rs.getDouble(7);
                c.setTotalprice(Double.valueOf(totalPrice));
                list.add(c);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean deleteBook(final int bid, final int uid , final int cid) {
        boolean f = false;
        try {
            final String sql = "delete from cart where bid=? and uid=? and cid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);
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

	public boolean deleteBook(int p0, int p1) {
		// TODO Auto-generated method stub
		return false;
	}
}