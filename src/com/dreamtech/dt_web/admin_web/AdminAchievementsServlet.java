package com.dreamtech.dt_web.admin_web;

import com.dreamtech.dt_web.daomain.Achievements;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.AchievementsService;
import com.dreamtech.dt_web.service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminAchievementsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //页面数据
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        AchievementsService achievementsService = new AchievementsService();
        List<Achievements> achievementsList = null;
        try {
            achievementsList = achievementsService.getAllAchievements();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("achievementsList",achievementsList);
        request.getRequestDispatcher("/WebAdmin/achievement.jsp").forward(request,response);
    }
}
