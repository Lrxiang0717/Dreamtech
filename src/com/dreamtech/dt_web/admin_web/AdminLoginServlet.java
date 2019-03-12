package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.User;
import com.dreamtech.dt_web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Date;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("user_name")!=null){
            try {
                UserService userService = new UserService();
                User user = new User();
                user.setUserName(request.getParameter("user_name"));
                user.setUserPassword(request.getParameter("user_password"));
                String loginUser = userService.adminLogin(user);
                if(loginUser != null) {
                    HttpSession session =  request.getSession(true);
                    session.setAttribute("adminUser",loginUser);
                    session.setMaxInactiveInterval(30*60*24);
                    response.sendRedirect("/Admin/Index");
                    return;
                }else{
                    response.sendRedirect("/Admin?msg=error");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/WebAdmin/login.jsp").forward(request,response);
    }
}
