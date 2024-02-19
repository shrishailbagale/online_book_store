
package com.DAO;

import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.entity.User;
import java.sql.Connection;

public class UserDAOImpl implements UserDAO
{
    private Connection conn;
    
    public UserDAOImpl(final Connection conn) {
        this.conn = conn;
    }
    
    public boolean userRegister(final User us) {
        boolean f = false;
        try {
            final String sql = "insert into user(name, email,phone,password, address, city,state, pincode) values(?,?,?,?,?,?,?,?)";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());
            ps.setString(5, us.getAddress());
            ps.setString(6, us.getCity());
            ps.setString(7, us.getState());
            ps.setString(8, us.getPincode());
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
    
    public User login(final String email, final String password) {
        User us = null;
        try {
            final String sql = "select * from user where email=? and password=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setCity(rs.getString(7));
                us.setState(rs.getString(8));
                us.setPincode(rs.getString(9));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }
    
    public boolean checkPassword(final int id, final String ps) {
        boolean f = false;
        try {
            final String sql = "select * from user where id =? and password=?";
            final PreparedStatement pst = this.conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, ps);
            final ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                f = true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean updateProfile(final User us) {
        boolean f = false;
        try {
            final String sql = "update user set name=?,email=? , phone=? ,address=?, city=?,state=?,pincode=? where id=?";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(8, us.getPassword());
            ps.setString(4, us.getAddress());
            ps.setString(5, us.getCity());
            ps.setString(6, us.getState());
            ps.setString(7, us.getPincode());
            ps.setInt(1, us.getId());
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
    
    public List<User> getAllUser() {
        final List<User> list = new ArrayList<User>();
        User us = null;
        try {
            final String sql = "select * from user";
            final PreparedStatement ps = this.conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setCity(rs.getString(7));
                us.setState(rs.getString(8));
                us.setPincode(rs.getString(9));
                list.add(us);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}