package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.Donation;
import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DonationDao {
    //获取捐赠信息
    public List<Donation> getDonation() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_donation order by donation_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List donationList = new ArrayList();
            while (rs.next()) {
                Donation donation = new Donation();
                donation.setDonationId(rs.getInt("donation_id"));
                donation.setDonationMoney(rs.getString("donation_money"));
                donation.setDonationMember(rs.getString("donation_member"));
                donation.setDonationMark(rs.getString("donation_mark"));
                donation.setDonationTime(rs.getString("donation_time"));
                donationList.add(donation);
            }
            return donationList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    public void delDonation(String donationId) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "delete from dt_donation where donation_id="+donationId;
            pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public void addDonation(Donation donation) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "insert into dt_donation(donation_money,donation_member,donation_mark) values(?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,donation.getDonationMoney());
            pstmt.setString(2,donation.getDonationMember());
            pstmt.setString(3,donation.getDonationMark());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public void editDonation(Donation donation) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_donation set donation_money=?,donation_member=?,donation_mark=? where donation_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,donation.getDonationMoney());
            pstmt.setString(2,donation.getDonationMember());
            pstmt.setString(3,donation.getDonationMark());
            pstmt.setInt(4,donation.getDonationId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
}
