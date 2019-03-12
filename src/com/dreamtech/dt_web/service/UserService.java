package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.UserDao;
import com.dreamtech.dt_web.daomain.User;

import java.sql.SQLException;

public class UserService {
    //登陆
    public String userLogin(User user) throws SQLException, ClassNotFoundException {
        UserDao userDao = new UserDao();
        return userDao.userLogin(user);
    }
    //后台登陆
    public String adminLogin(User user) throws SQLException, ClassNotFoundException {
        UserDao userDao = new UserDao();
        return userDao.adminLogin(user);
    }
}
