package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.Achievements;
import com.dreamtech.dt_web.daomain.News;
import com.dreamtech.dt_web.service.AchievementsService;
import com.dreamtech.dt_web.service.NewsService;
import net.coobird.thumbnailator.Thumbnails;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
@MultipartConfig
public class AddAchievementsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        if(request.getParameter("achievements_title")!=null&&request.getParameter("achievements_id").equals("empty")){
            Achievements achievements = new Achievements();
            //获取标题和内容
            achievements.settitle(request.getParameter("achievements_title"));
            achievements.setcontent(request.getParameter("achievements_content"));
            //获取图片
            Part part = request.getPart("achievements_image");
            String headerInfo = part.getHeader("content-disposition");
            //从HTTP头信息中获取文件名fileName=（文件名）
            String fileName = headerInfo.substring(headerInfo.lastIndexOf("=") + 2, headerInfo.length() - 1);
            achievements.setsrc("https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-achievements/"+fileName);//获得项目真实路径
            ServletContext servletContext = this.getServletConfig().getServletContext();
            String path = servletContext.getRealPath("/WebContent/images/dt-achievements/");
            //拼接文件
            String filePath = path + fileName;
            //打开文件
            part.write(filePath);
            //Thumbnails.of(filePath).size(200,133).keepAspectRatio(false).toFile(filePath);
            File file = new File(filePath);
            String endpoint = "http://oss-cn-beijing.aliyuncs.com";
            String accessKeyId = "LTAIjQfluZJt1BE0";
            String accessKeySecret = "DkHqbD4lM9RKMCXsE0NZrkpbCainff";
            OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
            ossClient.putObject("dtweb","dt_web/images/dt-achievements/"+fileName,file);
            ossClient.shutdown();
            AchievementsService achievementsService = new AchievementsService();
            try {
                achievementsService.addAchievements(achievements);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/Admin/Index");
            return;
        }
        if(!request.getParameter("achievements_id").equals("empty")){
            Achievements achievements = new Achievements();
            //获取标题和内容
            achievements.settarget(request.getParameter("achievements_id"));
            achievements.settitle(request.getParameter("achievements_title"));
            achievements.setcontent(request.getParameter("achievements_content"));
            //获取图片
            Part part = request.getPart("achievements_image");
            if(request.getParameter("isEmpty").equals("notEmpty")) {
                String headerInfo = part.getHeader("content-disposition");
                //从HTTP头信息中获取文件名fileName=（文件名）
                String fileName = headerInfo.substring(headerInfo.lastIndexOf("=") + 2, headerInfo.length() - 1);
                achievements.setsrc("https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-achievements/" + fileName);//获得项目真实路径
                ServletContext servletContext = this.getServletConfig().getServletContext();
                String path = servletContext.getRealPath("/WebContent/images/dt-achievements/");
                //拼接文件
                String filePath = path + fileName;
                //打开文件
                part.write(filePath);
                //Thumbnails.of(filePath).size(220,360).keepAspectRatio(false).toFile(filePath);
                File file = new File(filePath);
                String endpoint = "http://oss-cn-beijing.aliyuncs.com";
                String accessKeyId = "LTAIjQfluZJt1BE0";
                String accessKeySecret = "DkHqbD4lM9RKMCXsE0NZrkpbCainff";
                OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
                ossClient.putObject("dtweb", "dt_web/images/dt-achievements/" + fileName, file);
                ossClient.shutdown();
            }else{
                achievements.setsrc(request.getParameter("isEmpty"));
            }
            AchievementsService achievementsService = new AchievementsService();
            try {
                achievementsService.editAchievements(achievements);
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
