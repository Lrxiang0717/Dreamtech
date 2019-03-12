package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.dao.ApplicationDao;
import com.dreamtech.dt_web.daomain.Application;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("name")!=null){
            Application application = new Application();
            application.setApplicationName(request.getParameter("name"));
            application.setApplicationSex(request.getParameter("sex"));
            application.setApplicationClass(request.getParameter("class"));
            application.setApplicationPhone(request.getParameter("phone"));
            application.setApplicationIntention(request.getParameter("intention"));
            application.setApplicationIntroduce(request.getParameter("introduce"));
            ApplicationDao applicationDao = new ApplicationDao();
            try {
                applicationDao.addApplication(application);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/");
            return;
        }
        request.getRequestDispatcher("/WebContent/jsp/dt-get.jsp").forward(request,response);
    }
}
