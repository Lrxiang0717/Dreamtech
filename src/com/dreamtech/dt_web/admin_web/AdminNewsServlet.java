package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.NewsService;
import net.coobird.thumbnailator.Thumbnails;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //页面数据
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        NewsService newsService = new NewsService();
        List<News> newsList = null;
        try {
            newsList = newsService.getAllNews();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("newsList",newsList);
        request.getRequestDispatcher("/WebAdmin/news.jsp").forward(request,response);
    }
}
