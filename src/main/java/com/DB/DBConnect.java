
package com.DB;

import java.sql.DriverManager;
import java.sql.Connection;

public class DBConnect
{
    private static Connection conn;
    
    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DBConnect.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return DBConnect.conn;
    }
}