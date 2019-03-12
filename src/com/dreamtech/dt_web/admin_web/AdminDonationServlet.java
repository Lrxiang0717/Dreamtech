package com.dreamtech.dt_web.admin_web;

import com.dreamtech.dt_web.daomain.Donation;
import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.service.DonationService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        DonationService donationService = new DonationService();
        List<Donation> donationList = null;
        try {
            donationList = donationService.getDonation();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("donationList",donationList);
        request.getRequestDispatcher("/WebAdmin/donation.jsp").forward(request,response);
    }
}
