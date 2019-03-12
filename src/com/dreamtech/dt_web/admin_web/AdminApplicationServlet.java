package com.dreamtech.dt_web.admin_web;

import com.dreamtech.dt_web.daomain.Application;
import com.dreamtech.dt_web.service.ApplicationService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        ApplicationService applicationService = new ApplicationService();
        List<Application> applicationList = null;
        try {
            applicationList = applicationService.getApplication();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("applicationList",applicationList);
        request.getRequestDispatcher("/WebAdmin/get.jsp").forward(request,response);
    }
}
