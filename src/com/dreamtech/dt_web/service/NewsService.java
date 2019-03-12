package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.NewsDao;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.daomain.NewsComment;

import java.sql.SQLException;
import java.util.List;

public class NewsService {
    //获取新闻
    public List<News> getNews(String currentPage) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        return newsDao.getNews(currentPage);
    }
    //获取新闻评论
    public Object[] getNewsCommentsArray(String currentPage) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        return newsDao.getNewsCommentsArray(currentPage);
    }
    //增加点击量
    public void addCount(News news) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        newsDao.addCount(news);
    }
    //添加新闻评论
    public void addComment(NewsComment newsComment) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        newsDao.addComment(newsComment);
    }
    //获取新闻总数
    public Integer getNewsCount() throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        return newsDao.getNewsCount();
    }

    public List<News> getAllNews() throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        return newsDao.getAllNews();
    }

    public void delNews(String news_id) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        newsDao.delNews(news_id);
    }

    public void addNews(News news) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        newsDao.addNews(news);
    }

    public void editNews(News news) throws SQLException, ClassNotFoundException {
        NewsDao newsDao = new NewsDao();
        newsDao.editNews(news);
    }
}
