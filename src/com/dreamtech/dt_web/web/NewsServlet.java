package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.NewsService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        String currentPage = request.getParameter("currentPage");
        NewsService newsService = new NewsService();
        List<News> newsList = null;
        Integer newsCount = null;
        try {
            newsList = newsService.getNews(currentPage);
            newsCount = newsService.getNewsCount();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Map hashMap = new HashMap();
        hashMap.put("newsData",newsList);
        hashMap.put("newsCount",newsCount);
        PrintWriter printWriter = response.getWriter();
        JSONArray jsonArray = JSONArray.fromObject(hashMap);
        printWriter.print(jsonArray);
        printWriter.flush();
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WebContent/jsp/dt-news.jsp").forward(request,response);
        //获取数据，每一次点击增加一点击量
        String count = request.getParameter("count");
        String target = request.getParameter("id");
        if(count != null && target != null) {
            target = String.valueOf(Integer.parseInt(target.substring(1)) + 1);
            News news = new News();
            //传递数据工具id更改
            news.settarget(target);
            news.setcount(Integer.valueOf(count));
            NewsService newsService = new NewsService();
            try {
                newsService.addCount(news);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}