package com.dreamtech.dt_web.admin_web;

import com.aliyun.oss.OSSClient;
import com.dreamtech.dt_web.daomain.News;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class NewsImageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;UTF-8");
        response.setCharacterEncoding("UTF-8");
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");
        Part part = request.getPart("file");
        String headerInfo = part.getHeader("content-disposition");
        //从HTTP头信息中获取文件名fileName=（文件名）
        String fileName = headerInfo.substring(headerInfo.lastIndexOf("=") + 2, headerInfo.length() - 1);
        ServletContext servletContext = this.getServletConfig().getServletContext();
        String path = servletContext.getRealPath("/WebContent/images/dt-news/");
        //拼接文件
        String filePath = path + fileName;
        //打开文件
        part.write(filePath);
        File file = new File(filePath);
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAIjQfluZJt1BE0";
        String accessKeySecret = "DkHqbD4lM9RKMCXsE0NZrkpbCainff";
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
        ossClient.putObject("dtweb", "dt_web/images/dt-news/" + fileName, file);
        ossClient.shutdown();
        String location = "{\"location\":\"https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-news/"+fileName+"\"}";
        PrintWriter printWriter = response.getWriter();
        JSONObject jsonArray = JSONObject.fromObject(location);
        printWriter.print(jsonArray);
        printWriter.flush();
        printWriter.close();
    }
}
