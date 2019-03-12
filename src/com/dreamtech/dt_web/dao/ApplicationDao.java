package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.Application;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDao {
    public void addApplication(Application application) throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "insert into dt_application (application_name,application_sex,application_class,application_phone,application_intention,application_introduce) values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,application.getApplicationName());
            pstmt.setString(2,application.getApplicationSex());
            pstmt.setString(3,application.getApplicationClass());
            pstmt.setString(4,application.getApplicationPhone());
            pstmt.setString(5,application.getApplicationIntention());
            pstmt.setString(6,application.getApplicationIntroduce());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    public List<Application> getApplication() throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_application order by application_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<Application> applicationList = new ArrayList<>();
            while (rs.next()){
                Application application = new Application();
                application.setApplicationId(rs.getInt("application_id"));
                application.setApplicationName(rs.getString("application_name"));
                application.setApplicationSex(rs.getString("application_sex"));
                application.setApplicationClass(rs.getString("application_class"));
                application.setApplicationPhone(rs.getString("application_phone"));
                application.setApplicationIntention(rs.getString("application_intention"));
                application.setApplicationIntroduce(rs.getString("application_introduce"));
                applicationList.add(application);
            }
            return applicationList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
}
