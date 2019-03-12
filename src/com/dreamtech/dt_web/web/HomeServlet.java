package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.HomeSummary;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.daomain.HomeTitle;
import com.dreamtech.dt_web.service.HomeService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class HomeServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        HomeService homeService = new HomeService();
        //获得上端标题和简介
        List<HomeTitle> homeTitleList = null;
        //获得培养理念等描述内容
        List<HomeSummary> homeSummaryList = null;
        //获得最近的三条新闻
        List<News> newsList = null;
        //获取优秀组员
        List<Member> memberList = null;
        try {
            homeTitleList = homeService.getHomeTitle();
            homeSummaryList = homeService.getHomeSummary();
            newsList = homeService.getCurrentNews();
            memberList = homeService.getMembers();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //传入前端
        request.setAttribute("homeTitleList",homeTitleList);
        request.setAttribute("homeSummaryList",homeSummaryList);
        request.setAttribute("newsList",newsList);
        //拿出第一个和第四个组员分别传入
        if(memberList.get(4)!=null){
            request.setAttribute("firstMember",memberList.get(0));
            request.setAttribute("lastMember",memberList.get(4));
            memberList.remove(4);
            memberList.remove(0);
        }
        request.setAttribute("memberList",memberList);
        request.getRequestDispatcher("/WebContent/jsp/dt.jsp").forward(request,response);
    }
}
