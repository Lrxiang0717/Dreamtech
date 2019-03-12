<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8" name="viewport"
          content="width=device-width,  initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>dt</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png"
          type="image/x-icon">
    <script src="/WebContent/js/dt.js"></script>
    <link rel="stylesheet" href="/WebContent/css/dt.css">
</head>
<body>
<div class="hdScroll">
    <div class="bg" id="bg">
        <!--header-->
        <div class="header ht" id="header">
            <div class="header1" id="header1">
                <div class="logo">
                    <h1><img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png" alt=""></h1>
                </div>
                <span>DR@MTECH</span>
                <div class="header-open" id="header_open"></div>
                <ul>
                    <li><a href="/">网站首页</a></li>
                    <li><a href="/Introduce">团队介绍</a></li>
                    <li><a href="/News">新闻事件</a></li>
                    <li><a href="/Achievements">学术成果</a></li>
                    <li><a href="/Member">工作组员</a></li>
                    <c:if test="${not empty sessionScope.user}">
                        <li><a href="/Donation">捐赠入口</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <li><a href="/Logout">退出</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <li><a href="/Login">登陆</a></li>
                    </c:if>
                    <li><a href="/Application">报名</a></li>
                </ul>
                <div class="logo_center"><img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png"
                                              alt=""></div>
                <div class="logo_shadow"><img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_06.png"
                                              alt=""></div>
                <div class="title_l"></div>
                <div class="title_r"></div>
                <c:forEach items="${homeTitleList}" var="htl">
                    <div class="${htl.homeTitleId}">
                        <h3>${htl.homeTitleName}</h3>
                        <p>${htl.homeTitleContent}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--summary-->
        <div class="summary ht" id="summary">
            <div class="summary1">
                <div class="photo" id="smb">
                    <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt_paper.jpg" alt="">
                    <span id="mask"></span>
                </div>
                <div class="bg-photo" id="bgb">
                    <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt_paper.jpg" alt="">
                </div>
                <div class="summary_content">
                    <ul id="standUl">
                        <c:forEach items="${homeSummaryList}" var="hsl">
                            <li id="${hsl.homeSummaryId}"><p>${hsl.homeSummaryName}</p></li>
                        </c:forEach>
                    </ul>
                    <div class="t2" id="head"></div>
                    <div class="t_1">
                        <div class="t3">
                            <p id="change1">${homeSummaryList.get(0).homeSummaryContent}</p>
                        </div>
                    </div>
                </div>
                <div class="watermark"></div>
            </div>
        </div>
        <!--nav-->
        <div class="nav nt" id="nav">
            <div class="nav1">
                <div class="nav_logo">
                    <h2><img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png" alt=""></h2>
                    <p>DRE@MTECH</p>
                </div>
                <ul>
                    <li><a href="/">网站首页</a></li>
                    <li><a href="/Introduce">团队介绍</a></li>
                    <li><a href="/News">新闻事件</a></li>
                    <li><a href="/Achievements">学术成果</a></li>
                    <li><a href="/Member">工作组员</a></li>
                    <li><a href="/Donation">捐赠入口</a></li>
                    <c:if test="${not empty sessionScope.user}">
                        <li><a href="/Logout">退出</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <li><a href="/Login">登陆</a></li>
                    </c:if>
                    <li><a href="/Application">报名</a></li>
                </ul>
            </div>
        </div>
        <!--news-->
        <div class="news  ht" id="news">
            <div class="news1">
                <div class="title">新闻动态</div>
                <p>News & Events</p>
                <c:forEach items="${newsList}" var="nl" varStatus="var">
                    <a href="/News">
                        <div class="item${var.count}" id="item${var.count}">
                            <img src="${nl.src}" alt="">
                            <p>${nl.title}</p>
                            <p>${nl.content}</p>
                            <p>${nl.time}</p>
                        </div>
                    </a>
                </c:forEach>
                <div class="more"><a href="/News">查看更多</a></div>
                <div class="pct" id="pct">
                    <img src="${newsList.get(0).src}" alt="">
                    <div class="dp"> ${newsList.get(0).title}</div>
                </div>
            </div>
        </div>
        <!--member-->
        <div class="member ht" id="member">
            <div class="member1">
                <div class="title_m">历届组员</div>
                <p>Excellent team member</p>
                <div class="box_content" id="box_content">
                    <ul>
                        <li>
                            <img src="${firstMember.src}" alt="">
                            <div class="rm">
                                <h3 id="t1_1">${firstMember.contentName}</h3>
                                <p id="t1_2">${firstMember.memberPosition}</p>
                                <span><a href="/Member" id="t1_3">了解更多</a></span>
                            </div>
                            <span class="l_arrow" id="l_arrow"></span>
                        </li>
                        <c:forEach items="${memberList}" var="ml">
                            <li>
                                <img src="${ml.src}" alt="">
                                <div class="rm">
                                    <h3 id="t0_1">${ml.contentName}</h3>
                                    <p id="t0_2">${ml.memberPosition}</p>
                                    <span><a href="/Member" id="t0_3">了解更多</a></span>
                                </div>
                            </li>
                        </c:forEach>
                        <li>
                            <img src="${lastMember.src}" alt="">
                            <div class="rm">
                                <h3 id="t4_1">${lastMember.contentName}</h3>
                                <p id="t4_2">${lastMember.memberPosition}</p>
                                <span><a href="/Member" id="t4_3">了解更多</a></span>
                            </div>
                            <span class="r_arrow" id="r_arrow"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--footer-->
        <div class="footer ft" id="footer">
            <div class="footer1">
                <div class="footer_logo"><img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png"
                                              alt=""></div>
                <div class="footer_title">
                    <p>DRE@MTECH</p>
                    <span>联系电话：+86-312-7522257</span>
                    <span>地址：华北电力大学（保定） 教十A座（608）</span>
                </div>
                <ul class="link-bar">
                    <li><a href="http://net.ncepu.edu.cn/">华北电力大学(保定)</a></li>
                    <li><a href="http://jsjx.ncepu.edu.cn/computerWeb/index.php">华北电力大学计算机系</a></li>
                    <li><a href="http://www.ncepu.edu.cn/">华北电力大学(北京)</a></li>
                    <li><a href="https://www.oracle.com/index.html">Oracle官网</a></li>
                    <li><a href="https://www.acm.org/">ACM官网</a></li>
                    <li><a href="https://www.microsoft.com/zh-cn/">微软官网</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--js coming-->
<script>
    var standUl = document.getElementById('standUl');
    var standUlWidth = standUl.offsetWidth;
    document.getElementById('head').style.marginLeft = "0px";
    <c:forEach items="${homeSummaryList}" var="hsl" varStatus="var">
    document.getElementById('${hsl.homeSummaryId}').onmousedown = function () {
        document.getElementById('head').style.marginLeft = standUlWidth * ${var.index/4} +"px";
        document.getElementById('change1').innerHTML = "${hsl.homeSummaryContent}";
    };
    </c:forEach>
</script>
</body>
</html>