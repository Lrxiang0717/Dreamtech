package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.HomeDao;
import com.dreamtech.dt_web.daomain.HomeSummary;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.daomain.HomeTitle;

import java.sql.SQLException;
import java.util.List;

public class HomeService {
    //获取页面上方信息
    public List<HomeTitle> getHomeTitle() throws SQLException, ClassNotFoundException {
        HomeDao homeDao = new HomeDao();
        List<HomeTitle> homeTitleList = homeDao.getHomeTitle();
        return homeTitleList;
    }
    //获取简介
    public List<HomeSummary> getHomeSummary() throws SQLException, ClassNotFoundException {
        HomeDao homeDao = new HomeDao();
        List<HomeSummary> homeSummaryList = homeDao.getHomeSummary();
        return homeSummaryList;
    }
    //获取最近的三条新闻
    public List<News> getCurrentNews() throws SQLException, ClassNotFoundException {
        HomeDao homeDao = new HomeDao();
        List<News> newsList = homeDao.getCurrentNews();
        return newsList;
    }
    //获取优秀组员
    public List<Member> getMembers() throws SQLException, ClassNotFoundException {
        HomeDao homeDao = new HomeDao();
        List<Member> memberList = homeDao.getMembers();
        return memberList;
    }
}
