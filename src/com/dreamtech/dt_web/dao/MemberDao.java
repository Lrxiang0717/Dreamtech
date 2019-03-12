package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.HomeSummary;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MemberDao {
    //获得所有成员
    public  HashMap getMember() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet yearResult = null;
        ResultSet memberResult = null;
        try {
            //sql语句
            String sql = "select member_year from dt_member group by member_year order by member_year desc";
            pstmt = con.prepareStatement(sql);
            yearResult = pstmt.executeQuery();
            sql = "select * from dt_member";
            pstmt = con.prepareStatement(sql);
            memberResult = pstmt.executeQuery();
            HashMap memberHashMap = new HashMap();
            while (yearResult.next()) {
                List memberList = new ArrayList();
                //封装到list中
                while(memberResult.next()){
                    if(yearResult.getString("member_year").equals(memberResult.getString("member_year"))){
                        Member member = new Member();
                        member.setMemberId(memberResult.getInt("member_id"));
                        member.setMemberYear(memberResult.getString("member_year"));
                        member.setContentName(memberResult.getString("member_name"));
                        member.setContentP(memberResult.getString("member_introduce"));
                        member.setSrc(memberResult.getString("member_image"));
                        memberList.add(member);
                    }
                }
                memberResult.first();
                memberResult.previous();
                memberHashMap.put(yearResult.getString("member_year"),memberList);
            }
            return memberHashMap;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(memberResult,pstmt,con);
        }
        return null;
    }

    public Member getPersonalMessage(String user) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_member where member_name=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,user);
            rs = pstmt.executeQuery();
            if(rs.next()){
                Member member = new Member();
                member.setMemberId(rs.getInt("member_id"));
                member.setMemberYear(rs.getString("member_year"));
                member.setContentName(rs.getString("member_name"));
                member.setContentP(rs.getString("member_introduce"));
                member.setMemberPosition(rs.getString("member_position"));
                member.setSrc(rs.getString("member_image"));
                return member;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    public void editPersonalMessage(Member member) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql;
            if(member.getMemberId()!=null){
                sql = "update dt_member set member_year=?, member_name=?, member_position=?, member_introduce=?, member_image=? where member_id=?";
                pstmt = con.prepareStatement(sql);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,member.getMemberYear());
                pstmt.setString(2,member.getContentName());
                pstmt.setString(3,member.getMemberPosition());
                pstmt.setString(4,member.getContentP());
                pstmt.setString(5,member.getSrc());
                pstmt.setInt(6,member.getMemberId());
                pstmt.executeUpdate();
            }else{
                sql = "insert into dt_member (member_year,member_name,member_position,member_introduce,member_image) values(?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,member.getMemberYear());
                pstmt.setString(2,member.getContentName());
                pstmt.setString(3,member.getMemberPosition());
                pstmt.setString(4,member.getContentP());
                pstmt.setString(5,member.getSrc());
                pstmt.executeUpdate();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
}
