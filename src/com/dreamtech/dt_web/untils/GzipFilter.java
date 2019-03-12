package com.dreamtech.dt_web.untils;

import com.aliyun.oss.OSSClient;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Date;
import java.util.zip.GZIPOutputStream;

public class GzipFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        // 判断是否包含了 Accept-Encoding 请求头部
        HttpServletRequest s = (HttpServletRequest) request;
        String header = s.getHeader("Accept-Encoding");
        if (header != null && header.toLowerCase().contains("gzip")) {
            HttpServletResponse resp = (HttpServletResponse) response;
            final ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            HttpServletResponseWrapper hsrw = new HttpServletResponseWrapper(resp) {
                @Override
                public PrintWriter getWriter() throws IOException {
                    return new PrintWriter(new OutputStreamWriter(buffer, getCharacterEncoding()));
                }

                @Override
                public ServletOutputStream getOutputStream() throws IOException {
                    return new ServletOutputStream() {
                        @Override
                        public void write(int b) throws IOException {
                            buffer.write(b);
                        }
                    };
                }
            };

            chain.doFilter(request, hsrw);
            byte[] gzipData = gzip(buffer.toByteArray());
            resp.addHeader("Content-Encoding", "gzip");
            resp.setContentLength(gzipData.length);
            ServletOutputStream output = response.getOutputStream();
            output.write(gzipData);
            output.flush();
        }
        else {
            chain.doFilter(request, response);
        }
    }

    // 用 GZIP 压缩字节数组
    private byte[] gzip(byte[] data) {
        ByteArrayOutputStream byteOutput = new ByteArrayOutputStream(10240);
        GZIPOutputStream output = null;
        try {
            output = new GZIPOutputStream(byteOutput);
            output.write(data);
        }
        catch (IOException e) {
        }
        finally {
            try {
                output.close();
            }
            catch (IOException e) {
            }
        }
        return byteOutput.toByteArray();
    }

    public void init(FilterConfig config) throws ServletException {

    }
    public static void main(String args[]){
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAIjQfluZJt1BE0";
        String accessKeySecret = "DkHqbD4lM9RKMCXsE0NZrkpbCainff";
        String bucketName = "dtweb";
        Date expiration = new Date(new Date().getTime() + 3600 * 1000);// 生成URL
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
        URL url = ossClient.generatePresignedUrl(bucketName, accessKeyId, expiration);
        System.out.println(url);
    }
}
