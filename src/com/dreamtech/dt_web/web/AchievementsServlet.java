package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.Achievements;
import com.dreamtech.dt_web.service.AchievementsService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AchievementsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        String currentPage = request.getParameter("currentPage");
        AchievementsService achievmentsService = new AchievementsService();
        List<Achievements> achievementsList = null;
        Integer achievementsCount = null;
        try {
            achievementsList = achievmentsService.getAchievements(currentPage);
            achievementsCount = achievmentsService.getAchievementsCount();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Map hashMap = new HashMap();
        hashMap.put("achievementsData",achievementsList);
        hashMap.put("achievementsCount",achievementsCount);
        PrintWriter printWriter = response.getWriter();
        JSONArray jsonArray = JSONArray.fromObject(hashMap);
        printWriter.print(jsonArray);
        printWriter.flush();
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WebContent/jsp/dt-achievements.jsp").forward(request,response);
        //获取数据，每一次点击增加一点击量
        String count = request.getParameter("count");
        String target = request.getParameter("id");
        if(count != null && target != null) {
            target = String.valueOf(Integer.parseInt(target.substring(1)) + 1);
            Achievements Achievements = new Achievements();
            //传递数据工具id更改
            Achievements.settarget(target);
            Achievements.setcount(Integer.valueOf(count));
            AchievementsService AchievementsService = new AchievementsService();
            try {
                AchievementsService.addCount(Achievements);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}
