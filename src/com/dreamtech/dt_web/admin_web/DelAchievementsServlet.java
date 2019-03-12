package com.dreamtech.dt_web.admin_web;

import com.dreamtech.dt_web.service.AchievementsService;
import com.dreamtech.dt_web.service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DelAchievementsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("achievements_id")!=null){
            AchievementsService achievementsService = new AchievementsService();
            try {
                achievementsService.delAchievements(request.getParameter("achievements_id"));
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/Admin/Index");
            return;
        }
    }
}
