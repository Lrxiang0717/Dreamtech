package com.dreamtech.dt_web.service;
import com.dreamtech.dt_web.dao.FinanceDao;
import com.dreamtech.dt_web.daomain.Finance;

import java.sql.SQLException;
import java.util.List;

public class FinanceService {
    //获取支出信息
    public List<Finance> getFinance() throws SQLException, ClassNotFoundException {
        FinanceDao financeDao = new FinanceDao();
        return financeDao.getFinance();
    }

    public void addFinance(Finance finance) throws SQLException, ClassNotFoundException {
        FinanceDao financeDao = new FinanceDao();
        financeDao.addFinance(finance);
    }

    public void delFinance(String donation_id) throws SQLException, ClassNotFoundException {
        FinanceDao financeDao = new FinanceDao();
        financeDao.delFinance(donation_id);
    }

    public void editFinance(Finance finance) throws SQLException, ClassNotFoundException {
        FinanceDao financeDao = new FinanceDao();
        financeDao.editFinance(finance);
    }
}
