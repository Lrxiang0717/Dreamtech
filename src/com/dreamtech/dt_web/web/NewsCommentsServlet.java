package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.NewsService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.ObjectView;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class NewsCommentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        NewsService newsService = new NewsService();
        String currentPage = request.getParameter("currentPage");
        Object[] newsComments = null;
        try {
            newsComments = newsService.getNewsCommentsArray(currentPage);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        PrintWriter printWriter = response.getWriter();
        JSONArray jsonArray = JSONArray.fromObject(newsComments);
        printWriter.print(jsonArray);
        printWriter.flush();
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
