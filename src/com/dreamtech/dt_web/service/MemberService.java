package com.dreamtech.dt_web.service;

import com.dreamtech.dt_web.dao.MemberDao;
import com.dreamtech.dt_web.daomain.Member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class MemberService {
    //获取成员信息
    public HashMap getMember() throws SQLException, ClassNotFoundException {
        MemberDao memberDao = new MemberDao();
        return memberDao.getMember();
    }

    public Member getPersonalMessage(String user) throws SQLException, ClassNotFoundException {
        MemberDao memberDao = new MemberDao();
        return memberDao.getPersonalMessage(user);
    }

    public void editPersonalMessage(Member member) throws SQLException, ClassNotFoundException {
        MemberDao memberDao = new MemberDao();
        memberDao.editPersonalMessage(member);
    }
}
