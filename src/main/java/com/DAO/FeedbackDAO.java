
package com.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import com.entity.Feedback;
import java.sql.Connection;

public class FeedbackDAO
{
    private Connection conn;
    
    public FeedbackDAO(final Connection conn) {
        this.conn = conn;
    }
    
    public boolean addFeedback(final Feedback feed) {
        boolean f = false;
        try {
            final String sql = "insert into feedback(name,email,phone,message,userid) values(?,?,?,?,?)";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, feed.getName());
            ps.setString(2, feed.getEmail());
            ps.setString(3, feed.getPhone());
            ps.setString(4, feed.getMessage());
            ps.setInt(5, feed.getUserId());
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
    
    public List<Feedback> getAllFeedBack() {
        final List<Feedback> list = new ArrayList<Feedback>();
        Feedback f = null;
        try {
            final String sql = "select * from feedback";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(f);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Feedback> getAllFeedBackByUser(final int userid) {
        final List<Feedback> list = new ArrayList<Feedback>();
        Feedback f = null;
        try {
            final String sql = "select * from feedback where userid=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, userid);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(f);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}