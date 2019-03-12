package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.ApplicationDao;
import com.dreamtech.dt_web.daomain.Application;

import java.sql.SQLException;
import java.util.List;

public class ApplicationService {
    public void addApplication (Application application) throws SQLException, ClassNotFoundException {
        ApplicationDao applicationDao = new ApplicationDao();
        applicationDao.addApplication(application);
    }

    public List<Application> getApplication() throws SQLException, ClassNotFoundException {
        ApplicationDao applicationDao = new ApplicationDao();
        return applicationDao.getApplication();
    }
}
