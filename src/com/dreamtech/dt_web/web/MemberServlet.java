package com.dreamtech.dt_web.web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.Member;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.MemberService;
import com.dreamtech.dt_web.service.NewsService;
import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONArray;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
@MultipartConfig
public class MemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("utf-8");
        MemberService memberService = new MemberService();
        //上传个人信息
        if(request.getParameter("name")!=null) {
            Member member = new Member();
            if(request.getParameter("member_id")!=null&&!request.getParameter("member_id").equals("")){
                member.setMemberId(Integer.valueOf(request.getParameter("member_id")));
            }else{
                member.setMemberId(null);
            }
            member.setContentName(request.getParameter("name"));
            member.setMemberYear(request.getParameter("year"));
            member.setMemberPosition(request.getParameter("position"));
            member.setContentP(request.getParameter("introduce"));
            Part part = request.getPart("image");
            if(request.getParameter("isEmpty").equals("notEmpty")){
                String headerInfo = part.getHeader("content-disposition");
                //从HTTP头信息中获取文件名fileName=（文件名）
                String fileName = headerInfo.substring(headerInfo.lastIndexOf("=") + 2, headerInfo.length() - 1);
                member.setSrc("https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/member/"+fileName);
                //获得项目真实路径
                ServletContext servletContext = this.getServletConfig().getServletContext();
                String path = servletContext.getRealPath("/WebContent/images/member/");
                //拼接文件
                String filePath = path + fileName;
                //打开文件
                part.write(filePath);
                Thumbnails.of(filePath).size(220,360).keepAspectRatio(false).toFile(filePath);
                File file = new File(filePath);
                String endpoint = "http://oss-cn-beijing.aliyuncs.com";
                String accessKeyId = "LTAIjQfluZJt1BE0";
                String accessKeySecret = "DkHqbD4lM9RKMCXsE0NZrkpbCainff";
                OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
                ossClient.putObject("dtweb","dt_web/images/member/"+fileName,file);
                ossClient.shutdown();
            }else{
                member.setSrc(request.getParameter("isEmpty"));
            }
            try {
                memberService.editPersonalMessage(member);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/Member");
            return;
        }
        HashMap memberHashMap = null;
        try {
            memberHashMap = memberService.getMember();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        PrintWriter printWriter = response.getWriter();
        JSONArray memberData = JSONArray.fromObject(memberHashMap);
        printWriter.print(memberData);
        printWriter.flush();
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        if(user != null){
            MemberService memberService = new MemberService();
            try {
                Member member = memberService.getPersonalMessage(user);
                request.setAttribute("member",member);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/WebContent/jsp/dt-member.jsp").forward(request,response);
    }
}
