package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.User;
import com.dreamtech.dt_web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.HttpCookie;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
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
                String loginUser = userService.userLogin(user);
                if(loginUser != null) {
                    HttpSession session =  request.getSession(true);
                    session.setMaxInactiveInterval(30*60*12);
                    session.setAttribute("user",loginUser);
                    response.sendRedirect("/");
                    return;
                }else{
                    response.sendRedirect("/Login?msg=error");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/WebContent/jsp/dt-login.jsp").forward(request,response);
    }
}
