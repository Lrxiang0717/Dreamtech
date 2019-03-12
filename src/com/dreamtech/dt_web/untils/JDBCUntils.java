package com.dreamtech.dt_web.untils;

import java.sql.*;
import java.util.*;

public class JDBCUntils {
     static ResourceBundle bundle = ResourceBundle.getBundle("jdbc");
     // 四大金刚
     static String driver = bundle.getString("driver") ;// 驱动名称
     static String url = bundle.getString("url") ;// 连接字符串
     static String username = bundle.getString("username") ;// 用户名
     static String password = bundle.getString("password") ;// 密码
     // 三剑客
     static Connection con = null ;// 连接对象
     static PreparedStatement pstmt = null ;// 语句对象
     static ResultSet rs = null ;// 结果集对象
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driver);
        con = DriverManager.getConnection(url,username,password);
        return con;
    }
    public static void close(ResultSet rs, PreparedStatement pstmt, Connection con){
        try {
            if(rs!=null){
                rs.close();
            }
            if(pstmt!=null){
                pstmt.close();
            }
            if(con!=null){
                con.close();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
