package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.AchievementsDao;
import com.dreamtech.dt_web.dao.NewsDao;
import com.dreamtech.dt_web.daomain.Achievements;

import java.sql.SQLException;
import java.util.List;

public class AchievementsService {
    //获取学术成果
    public List<Achievements> getAchievements(String current) throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        List<Achievements> achievementsList = achievementsDao.getAchievements(current);
        return achievementsList;
    }
    //获取学术成果总数
    public Integer getAchievementsCount() throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        return achievementsDao.getAchievementsCount();
    }
    //增加点击数
    public void addCount(Achievements achievements) throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        achievementsDao.addCount(achievements);
    }

    public void addAchievements(Achievements achievements) throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        achievementsDao.addAchievements(achievements);
    }

    public List<Achievements> getAllAchievements() throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        return achievementsDao.getAllAchievements();
    }

    public void delAchievements(String achievements_id) throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        achievementsDao.delAchievements(achievements_id);
    }

    public void editAchievements(Achievements achievements) throws SQLException, ClassNotFoundException {
        AchievementsDao achievementsDao = new AchievementsDao();
        achievementsDao.editAchievements(achievements);
    }
}
