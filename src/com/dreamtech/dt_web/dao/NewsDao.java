package com.dreamtech.dt_web.dao;

import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.daomain.NewsComment;
import com.dreamtech.dt_web.untils.JDBCUntils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDao {
    public Integer getNewsCount() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            //sql语句
            sql = "select count(*) total from dt_news where news_is_del=0";
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
    //获取新闻
    public List<News> getNews(String currentPage) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            //sql语句
            if(currentPage == null){
                sql = "select * from dt_news where news_is_del=0 order by news_id desc limit 5";
            }else{
                Integer total = (Integer.parseInt(currentPage)-1)*5;
                sql = "select * from dt_news where news_is_del=0 order by news_id desc limit "+total+",5";
            }
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<News> newsList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                News news = new News();
                news.settarget("."+(rs.getInt("news_id")-1));
                news.settitle(rs.getString("news_name"));
                news.setcontent(rs.getString("news_content"));
                news.setsrc(rs.getString("news_images"));
                news.setcount(rs.getInt("news_clicks"));
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
    //获取新闻评论
    public List<NewsComment> getNewsComments(int news_id) throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            Integer news_big_id = news_id+5;
            String sql = "select * from dt_news_comment where news_id >="+news_id+" and news_id<"+news_big_id;
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<NewsComment> newsComments = new ArrayList<>();
            while (rs.next()) {
                //封装到list中
                NewsComment newsComment = new NewsComment();
                newsComment.setNewsId(rs.getInt("news_comment_id"));
                newsComment.setContent(rs.getString("news_comment"));
                newsComment.setIp(rs.getString("news_comment_user"));
                newsComment.setNewsId(rs.getInt("news_id"));
                newsComments.add(newsComment);
            }
            return newsComments;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    //封装新闻评论
    public Object[] getNewsCommentsArray(String currentPage) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;
        try {
            //sql语句
            if(currentPage == null){
                sql = "select news_id from dt_news where news_is_del=0 order by news_id desc limit 5";
            }else{
                Integer total = (Integer.parseInt(currentPage)-1)*5;
                sql = "select news_id from dt_news where news_is_del=0 order by news_id desc limit "+total+",5";
            }
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.last();
            List<NewsComment> newsCommentList = getNewsComments(rs.getInt("news_id"));
            NewsDao newsDao = new NewsDao();
            Object[] newsCommentsArray = new Object[newsDao.getNewsCount()+1];
            rs.beforeFirst();
            while (rs.next()) {
                List<NewsComment> newsComments = new ArrayList<>();
                for (int i = 0; i < newsCommentList.size(); i++){
                    if(rs.getInt("news_id") == newsCommentList.get(i).getNewsId()){
                        //如果是属于这一条新闻的评论则封装
                        newsComments.add(newsCommentList.get(i));
                    }
                }
                newsCommentsArray[rs.getInt("news_id")-1] = newsComments;
            }
            return newsCommentsArray;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
        return null;
    }
    //增加点击数
    public void addCount(News news) throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "update dt_news set news_clicks=? where news_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,news.getcount());
            pstmt.setString(2,news.gettarget());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    //增加新闻评论
    public void addComment(NewsComment newsComment) throws SQLException, ClassNotFoundException {
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //sql语句
            String sql = "insert into dt_news_comment (news_comment,news_comment_user,news_id) values(?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,newsComment.getContent());
            pstmt.setString(2,newsComment.getIp());
            pstmt.setInt(3,newsComment.getNewsId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
    public List<News> getAllNews() throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "select * from dt_news where news_is_del=0 order by news_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<News> newsList = new ArrayList();
            while (rs.next()) {
                //封装到list中
                News news = new News();
                news.settarget(rs.getString("news_id"));
                news.settitle(rs.getString("news_name"));
                news.setcontent(rs.getString("news_content"));
                news.setsrc(rs.getString("news_images"));
                news.setcount(rs.getInt("news_clicks"));
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
    //删除新闻
    public void delNews(String news_id) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_news set news_is_del=1 where news_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(news_id));
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    public void addNews(News news) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "insert into dt_news(news_name,news_content,news_images) values(?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,news.gettitle());
            pstmt.setString(2,news.getcontent());
            pstmt.setString(3,news.getsrc());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }

    public void editNews(News news) throws SQLException, ClassNotFoundException {
        //获得连接
        Connection con = JDBCUntils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            sql = "update dt_news set news_name=?,news_content=?,news_images=? where news_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,news.gettitle());
            pstmt.setString(2,news.getcontent());
            pstmt.setString(3,news.getsrc());
            pstmt.setString(4,news.gettarget());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            //依次关闭
            JDBCUntils.close(rs,pstmt,con);
        }
    }
}
