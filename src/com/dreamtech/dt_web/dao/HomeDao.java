package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.HomeSummary;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.untils.JDBCUntils;
import com.dreamtech.dt_web.daomain.HomeTitle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static org.apache.commons.lang.StringUtils.substringBefore;

public class HomeDao {
    //获取页面上方描述
    public List<HomeTitle> getHomeTitle() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_home_title";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List homeTitleList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                HomeTitle homeTitle = new HomeTitle();
                homeTitle.setHomeTitleId("box"+rs.getString("title_id"));
                homeTitle.setHomeTitleName(rs.getString("title_name"));
                homeTitle.setHomeTitleContent(rs.getString("title_content"));
                homeTitleList.add(homeTitle);
            }
            return homeTitleList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    //获取中间部分描述
    public List<HomeSummary> getHomeSummary() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_home_summary";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List homeSummaryList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                HomeSummary homeSummary = new HomeSummary();
                homeSummary.setHomeSummaryId("c"+rs.getString("Summary_id"));
                homeSummary.setHomeSummaryName(rs.getString("Summary_name"));
                homeSummary.setHomeSummaryContent(rs.getString("Summary_content"));
                homeSummaryList.add(homeSummary);
            }
            return homeSummaryList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    //获取最近的三条新闻
    public List<News> getCurrentNews() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_news order by news_id desc limit 3";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List newsList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                News news = new News();
                news.settarget(rs.getString("news_id"));
                news.settitle(rs.getString("news_name"));
                news.setcontent(substringBefore(rs.getString("news_content"),"</p>")+"</p>");
                news.setsrc(rs.getString("news_images"));
                news.settime(rs.getString("news_time"));
                newsList.add(news);
            }
            return newsList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }

    //获取优秀组员
    public List<Member> getMembers() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "select * from dt_member";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List memberList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                Member member = new Member();
                member.setMemberId(rs.getInt("member_id"));
                member.setMemberYear(rs.getString("member_year"));
                member.setContentName(rs.getString("member_name"));
                member.setMemberPosition(rs.getString("member_position"));
                member.setContentP(rs.getString("member_introduce"));
                member.setSrc(rs.getString("member_image"));
                memberList.add(member);
            }
            return memberList;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
}