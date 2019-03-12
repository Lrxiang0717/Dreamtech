package com.dreamtech.dt_web.daomain;

public class Achievements {
    //新闻事件
    private String target;
    private String title;
    private String content;
    private String src;
    private Integer count;
    private String time;

    public String gettarget() {
        return target;
    }

    public void settarget(String target) {
        this.target = target;
    }

    public String gettitle() {
        return title;
    }

    public void settitle(String title) {
        this.title = title;
    }

    public String getcontent() {
        return content;
    }

    public void setcontent(String content) {
        this.content = content;
    }

    public Integer getcount() {
        return count;
    }

    public void setcount(Integer count) {
        this.count = count;
    }

    public String getsrc() {
        return src;
    }

    public void setsrc(String src) {
        this.src = src;
    }

    public String gettime() {
        return time;
    }

    public void settime(String time) {
        this.time = time;
    }
}
