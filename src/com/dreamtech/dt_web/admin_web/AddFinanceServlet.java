package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.FinanceService;
import com.dreamtech.dt_web.service.NewsService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

public class AddFinanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("finance_money")!=null&&request.getParameter("finance_id").equals("empty")){
            Finance finance = new Finance();
            //获取标题和内容
            finance.setFinanceMoney(request.getParameter("finance_money"));
            finance.setFinanceProject(request.getParameter("finance_project"));
            finance.setFinanceTransactor(request.getParameter("finance_transactor"));
            finance.setFinanceMark(request.getParameter("finance_mark"));
            FinanceService financeService = new FinanceService();
            try {
                financeService.addFinance(finance);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/Admin/Index");
            return;
        }
        if(!request.getParameter("finance_id").equals("empty")){
            Finance finance = new Finance();
            //获取标题和内容
            finance.setFinanceId(Integer.valueOf(request.getParameter("finance_id")));
            finance.setFinanceMoney(request.getParameter("finance_money"));
            finance.setFinanceProject(request.getParameter("finance_project"));
            finance.setFinanceTransactor(request.getParameter("finance_transactor"));
            finance.setFinanceMark(request.getParameter("finance_mark"));
            FinanceService financeService = new FinanceService();
            try {
                financeService.editFinance(finance);
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
