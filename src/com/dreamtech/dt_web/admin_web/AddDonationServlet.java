package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.Donation;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.DonationService;
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

public class AddDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("donation_name")!=null&&request.getParameter("donation_id").equals("empty")){
            Donation donation = new Donation();
            //获取标题和内容
            donation.setDonationMember(request.getParameter("donation_name"));
            donation.setDonationMoney(request.getParameter("donation_money"));
            donation.setDonationMark(request.getParameter("donation_mark"));
            DonationService donationService = new DonationService();
            try {
                donationService.addDonation(donation);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/Admin/Index");
            return;
        }
        if(!request.getParameter("donation_id").equals("empty")){
            Donation donation = new Donation();
            //获取标题和内容
            donation.setDonationId(Integer.valueOf(request.getParameter("donation_id")));
            donation.setDonationMoney(request.getParameter("donation_money"));
            donation.setDonationMember(request.getParameter("donation_name"));
            donation.setDonationMark(request.getParameter("donation_mark"));
            DonationService donationService = new DonationService();
            try {
                donationService.editDonation(donation);
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
