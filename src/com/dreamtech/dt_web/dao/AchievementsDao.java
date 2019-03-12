package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.Achievements;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AchievementsDao {
    public Integer getAchievementsCount() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            //sql语句
            sql = "select count(*) total from dt_achievements where achievements_is_del=0";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt("total");
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    public List<Achievements> getAchievements(String currentPage) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            //sql语句
            if(currentPage == null){
                sql = "select * from dt_achievements where achievements_is_del=0 order by achievements_id desc limit 5";
            }else{
                Integer total = (Integer.parseInt(currentPage)-1)*5;
                sql = "select * from dt_achievements where achievements_is_del=0 order by achievements_id desc limit "+total+",5";
            }
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List achievementsList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                Achievements achievements = new Achievements();
                achievements.settarget("."+(rs.getInt("achievements_id")-1));
                achievements.settitle(rs.getString("achievements_name"));
                achievements.setcontent(rs.getString("achievements_content"));
                achievements.setsrc(rs.getString("achievements_images"));
                achievements.setcount(rs.getInt("achievements_clicks"));
                achievements.settime(rs.getString("achievements_time"));
                achievementsList.add(achievements);
            }
            return achievementsList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    public void addCount(Achievements achievements) throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "update dt_achievements set achievements_clicks=? where achievements_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,achievements.getcount());
            pstmt.setString(2,achievements.gettarget());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public List<Achievements> getAllAchievements() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "select * from dt_achievements where achievements_is_del=0 order by achievements_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<Achievements> achievementsList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                Achievements achievements = new Achievements();
                achievements.settarget(rs.getString("achievements_id"));
                achievements.settitle(rs.getString("achievements_name"));
                achievements.setcontent(rs.getString("achievements_content"));
                achievements.setsrc(rs.getString("achievements_images"));
                achievements.setcount(rs.getInt("achievements_clicks"));
                achievements.settime(rs.getString("achievements_time"));
                achievementsList.add(achievements);
            }
            return achievementsList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    public void addAchievements(Achievements achievements) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "insert into dt_achievements(achievements_name,achievements_content,achievements_images) values(?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,achievements.gettitle());
            pstmt.setString(2,achievements.getcontent());
            pstmt.setString(3,achievements.getsrc());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    public void delAchievements(String achievements_id) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_achievements set achievements_is_del=1 where achievements_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(achievements_id));
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    public void editAchievements(Achievements achievements) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_achievements set achievements_name=?,achievements_content=?,achievements_images=? where achievements_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,achievements.gettitle());
            pstmt.setString(2,achievements.getcontent());
            pstmt.setString(3,achievements.getsrc());
            pstmt.setString(4,achievements.gettarget());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
}
