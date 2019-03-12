package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.DonationDao;
import com.dreamtech.dt_web.daomain.Donation;
import com.dreamtech.dt_web.daomain.Finance;

import java.sql.SQLException;
import java.util.List;

public class DonationService {

    //获取捐赠信息
    public List<Donation> getDonation() throws SQLException, ClassNotFoundException {
        DonationDao donationDao = new DonationDao();
        return donationDao.getDonation();
    }

    public void addDonation(Donation donation) throws SQLException, ClassNotFoundException {
        DonationDao donationDao = new DonationDao();
        donationDao.addDonation(donation);
    }

    public void delDonation(String donationId) throws SQLException, ClassNotFoundException {
        DonationDao donationDao = new DonationDao();
        donationDao.delDonation(donationId);
    }

    public void editDonation(Donation donation) throws SQLException, ClassNotFoundException {
        DonationDao donationDao = new DonationDao();
        donationDao.editDonation(donation);
    }
}
