package com.dreamtech.dt_web.web;

import com.dreamtech.dt_web.daomain.Donation;
import com.dreamtech.dt_web.daomain.Finance;
import com.dreamtech.dt_web.service.DonationService;
import com.dreamtech.dt_web.service.FinanceService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class DonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        DonationService donationService = new DonationService();
        FinanceService financeService = new FinanceService();
        List<Donation> donationList = null;
        List<Finance> financeList = null;
        try {
            donationList = donationService.getDonation();
            financeList = financeService.getFinance();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        JSONArray donationJson = JSONArray.fromObject(donationList);
        JSONArray financeJson = JSONArray.fromObject(financeList);
        request.setAttribute("donationList",donationList);
        request.setAttribute("financeList",financeList);
        request.setAttribute("donationJson",donationJson);
        request.setAttribute("financeJson",financeJson);
        request.getRequestDispatcher("/WebContent/jsp/dt-donation.jsp").forward(request,response);
    }
}
