package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.daomain.User;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    //登陆
    public String userLogin(User user) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_user where user_name=? and user_password=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,user.getUserName());
            pstmt.setString(2,user.getUserPassword());
            rs = pstmt.executeQuery();
            if(rs.next()){
                return user.getUserName();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    //后台登陆
    public String adminLogin(User user) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_user where user_id=1 and user_name=? and user_password=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,user.getUserName());
            pstmt.setString(2,user.getUserPassword());
            rs = pstmt.executeQuery();
            if(rs.next()){
                return user.getUserName();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
}
