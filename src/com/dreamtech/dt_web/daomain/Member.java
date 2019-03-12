package com.dreamtech.dt_web.daomain;

public class Member {
    //工作组成员
    private Integer memberId;
    private String memberYear;
    private String contentName;
    private String memberPosition;
    private String contentP;
    private String src;

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberYear() {
        return memberYear;
    }

    public void setMemberYear(String memberYear) {
        this.memberYear = memberYear;
    }

    public String getContentName() {
        return contentName;
    }

    public void setContentName(String contentName) {
        this.contentName = contentName;
    }

    public String getContentP() {
        return contentP;
    }

    public void setContentP(String contentP) {
        this.contentP = contentP;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getMemberPosition() {
        return memberPosition;
    }

    public void setMemberPosition(String memberPosition) {
        this.memberPosition = memberPosition;
    }
}
