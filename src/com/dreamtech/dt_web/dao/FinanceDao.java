package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FinanceDao {
    //获取支出信息
    public List<Finance> getFinance() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_finance order by finance_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List financeList = new ArrayList();
            while (rs.next()) {
                Finance finance = new Finance();
                finance.setFinanceId((rs.getInt("finance_id")));
                finance.setFinanceMoney(rs.getString("finance_money"));
                finance.setFinanceProject(rs.getString("finance_project"));
                finance.setFinanceTransactor(rs.getString("finance_transactor"));
                finance.setFinanceMark(rs.getString("finance_mark"));
                finance.setFinanceTime(rs.getString("finance_time"));
                financeList.add(finance);
            }
            return financeList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    public void delFinance(String financeId) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "delete from dt_finance where finance_id="+financeId;
            pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public void addFinance(Finance finance) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "insert into dt_finance(finance_money,finance_project,finance_transactor,finance_mark) values(?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,finance.getFinanceMoney());
            pstmt.setString(2,finance.getFinanceProject());
            pstmt.setString(3,finance.getFinanceTransactor());
            pstmt.setString(4,finance.getFinanceMark());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public void editFinance(Finance finance) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_finance set finance_money=?,finance_project=?,finance_transactor=?,finance_mark=? where finance_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,finance.getFinanceMoney());
            pstmt.setString(2,finance.getFinanceProject());
            pstmt.setString(3,finance.getFinanceTransactor());
            pstmt.setString(4,finance.getFinanceMark());
            pstmt.setInt(5,finance.getFinanceId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
}
