package com.dreamtech.dt_web.daomain;

public class NewsComment {
    //新闻评论
    private Integer newsCommentId;
    private String content;
    private String ip;
    private Integer newsId;

    public Integer getNewsCommentId() {
        return newsCommentId;
    }

    public void setNewsCommentId(Integer newsCommentId) {
        this.newsCommentId = newsCommentId;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
