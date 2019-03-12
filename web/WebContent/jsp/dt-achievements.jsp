<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>achievements</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-achievements.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <script src="/WebContent/js/dt-achievements.js"></script>
    <link rel="stylesheet" href="/WebContent/source/page/css/jquery.pagination.css" />
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/WebContent/source/page/js/jquery.pagination.min.js"></script>
</head>
<body>
<!--nav-->
<nav id="top" class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse"
                    data-target="#intro" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><h1 class="text-primary">Dreamtech</h1></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="intro">
            <ul class="nav navbar-nav navbar-right" id="ul">
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--header-->
<div class="header1 container-fluid">
</div>


<!-- body -->
<div class="container body-father"></div>
<div class="container">
    <div class="box" style="margin-top: 20px;float: right;"></div>
</div>
<!--panel-->
<div class="panel-father"></div>
<%--footer--%>
<div class="footer" style="overflow:hidden;padding: 10px; background-color: #a5c6d6; margin:10px 0;">
    <div class="row">
        <div class="col-md-1">
            <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png" alt="" class="img-responsive hidden-xs hidden-sm">
        </div>
        <div class="col-md-5">
            <h3 class="footer-logo" style="color:white;">dreamtech</h3>
        </div>
        <div class="col-md-6">
            <ul class="footer_ul" style="border-radius:5px;margin-top: 4%;display:flex; justify-content: space-around;align-items: center;">
                <li><a href="http://net.ncepu.edu.cn/">华北电力大学(保定)</a></li>
                <li><a href="http://jsjx.ncepu.edu.cn/computerWeb/index.php">华北电力大学计算机系</a></li>
                <li><a href="http://www.ncepu.edu.cn/">华北电力大学(北京)</a></li>
            </ul>
            <ul class="footer_ul" style="border-radius:5px;margin-top: 5px;display:flex; justify-content: space-around;align-items: center;">
                <li><a href="https://www.oracle.com/index.html">Oracle官网</a></li>
                <li><a href="https://www.acm.org/">ACM官网</a></li>
                <li><a href="https://www.microsoft.com/zh-cn/">微软官网</a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>