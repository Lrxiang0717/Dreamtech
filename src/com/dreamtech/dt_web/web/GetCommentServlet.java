package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.NewsComment;
import com.dreamtech.dt_web.service.NewsService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class GetCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(request.getSession().getAttribute("user")==null){
            PrintWriter printWriter = response.getWriter();
            printWriter.print("error");
            printWriter.flush();
            printWriter.close();
        }else{
            PrintWriter printWriter = response.getWriter();
            printWriter.print(request.getSession().getAttribute("user").toString());
            printWriter.flush();
            printWriter.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        String comment = request.getParameter("comment");
        System.out.println(comment);
        Integer newsId = Integer.valueOf(request.getParameter("id"));
        System.out.println(newsId);
        String user = (String) request.getSession().getAttribute("user");
        NewsComment newsComment = new NewsComment();
        newsComment.setContent(comment);
        newsComment.setNewsId(newsId);
        newsComment.setIp(user);
        NewsService newsService = new NewsService();
        try {
            newsService.addComment(newsComment);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
