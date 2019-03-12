<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>donation</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-donation.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/WebContent/source/page/css/jquery.pagination.css" />
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/WebContent/source/page/js/jquery.pagination.min.js"></script>
</head>
<body>
<!--nav-->
<nav class="navbar navbar-default navbar-static-top">
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
                <li><a href="/Donation">捐赠入口</a></li>
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
<div class="jumbotron header1">
    <div class="container">
        <h1>DRE@MTECH在线捐赠入口</h1>
        <p class="text-muted lead">
            曾经的我们都在这里，一起遇见、一起学习、一起生活、一起看日出、一起哭一起笑。那熟悉的桌椅板凳，熟悉同屋的你，墙上照片鼓励我们前行。无私的传承，成就了我们的梦想。我也愿意将火炬传递下去，为了那颗颗激情的心。虽然我已离去，但我的心仍与你们同在。
        </p>
    </div>
</div>
<!--content-->
<div class="container content1">
    <div class="row">
        <div class="col-md-6 mgt bg1">
            <div class="media">
                <div class="media-left media-top">
                    <a href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/未标题-1_01.png" target="_blank">
                        <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/未标题-1_01.png" class="media-object">
                        <span></span>
                    </a>
                </div>
                <div class="media-body code">
                    <h3 class="media-heading">微信捐赠平台</h3>

                    <p>打开微信"扫一扫"，扫描二维码，进入微信捐赠平台</p>
                </div>
            </div>
        </div>
        <div class="col-md-6  mgt bg2">
            <div class="media">
                <div class="media-left media-top">
                    <a href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/未标题-1_011.png" target="_blank">
                        <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/未标题-1_011.png" class="media-object">
                        <span></span>
                    </a>
                </div>
                <div class="media-body code">
                    <h3 class="media-heading">支付宝捐赠平台</h3>
                    <p>打开支付宝"扫一扫"，扫描二维码，进入微信捐赠平台</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<div class="container content2">
    <div class="row">
        <dl>
            <dt>其他形式捐赠:</dt>
            <dd>户名：Dreamtech工作组发展基金会 (中国银行)</dd>
            <dd>账号：xxxx xxxx xxxx xxxx</dd>
        </dl>
        <dl>
            <dt>联系方式：</dt>
            <dd><span title="河北省保定市华电路689号 华北电力大学(保定二校区)" class="icon-pzs"></span>华北电力大学</dd>
            <dd><span title="+86-312-7522257" class="icon-phone"></span>+86-312-7522257</dd>
        </dl>
    </div>
</div>
<!--count-->
<c:if test="${not empty sessionScope.user}">
<div class="count panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
        <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
               aria-controls="collapseOne">
                <div class="page-header text-center">
                    <h3 class="text-primary">捐款信息
                        <small class="text-warning">Donation Information</small>
                    </h3>
                </div>
            </a>
        </h4>
    </div>
    <div class="container">
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body bd">
                <table class="table table-condensed">
                    <tr class="info">
                        <th>捐款人</th>
                        <th>捐款时间</th>
                        <th>金额</th>
                        <th>备注</th>
                    </tr>
                    <tbody class="parent1">
                    <c:set var="donationStart" value="0"/>
                    <c:set var="donationEnd" value="4"/>
                    <c:forEach items="${donationList}" begin="${donationStart}" end="${donationEnd}" var="dl">
                    <tr>
                        <th>${dl.donationMember}</th>
                        <th>${dl.donationTime}</th>
                        <th>${dl.donationMoney}</th>
                        <th>${dl.donationMark}</th>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box container">
                <div id="pagination1" class="page fl" style="float: right;"></div>
            </div>
            <script>
                var totalPage = Math.ceil(${fn:length(donationList)/5});
                var donationData = eval('${donationJson}');
                $("#pagination1").pagination({
                    currentPage: 1,
                    totalPage:totalPage,
                    isShow: false,
                    count: 5,
                    prevPageText: "上一页",
                    nextPageText: "下一页",
                    callback: function(current) {
                        var i = (current-1)*5;
                        var j = i+5;
                        document.getElementsByClassName("parent1")[0].innerHTML="";
                        for(i ;i<j;i++){
                            document.getElementsByClassName("parent1")[0].innerHTML+='<tr> \n'+
                                '<th>'+donationData[i].donationMember+'</th> \n'+
                                '<th>'+donationData[i].donationTime+'</th> \n'+
                                '<th>'+donationData[i].donationMoney+'</th> \n'+
                                '<th>'+donationData[i].donationMark+'</th> \n'+
                                '</tr>';
                        }
                    }
                });
            </script>
        </div>
    </div>
</div>
<div class="count panel panel-default">
    <div class="panel-heading" role="tab" id="heading2">
        <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true"
               aria-controls="collapse2">
                <div class="page-header text-center">
                    <h3 class="text-primary">财务明细
                        <small class="text-warning">Financial details</small>
                    </h3>
                </div>
            </a>
        </h4>
    </div>
    <div class="container">
        <div id="collapse2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading2">
            <div class="panel-body bd">
                <table class="table table-condensed">
                    <tr class="info">
                        <th>支出时间</th>
                        <th>支出金额</th>
                        <th>支出项目</th>
                        <th>经手人</th>
                        <th>佐证</th>
                        <th>备注</th>
                    </tr>
                    <tbody class="parent2">
                    <c:set var="financeStart" value="0"/>
                    <c:set var="financeEnd" value="4"/>
                    <c:forEach items="${financeList}" begin="${financeStart}" end="${financeEnd}" var="fl">
                    <tr >
                        <th>${fl.financeTime}</th>
                        <th>${fl.financeMoney}</th>
                        <th>${fl.financeProject}</th>
                        <th>${fl.financeTransactor}</th>
                        <th>${fl.financeMark}</th>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box container">
                <div id="pagination2" class="page fl" style="float: right;"></div>
            </div>
            <script>
                var totalPage = Math.ceil(${fn:length(financeList)/5});
                var financeData = eval('${financeJson}');
                console.log(data);
                $("#pagination2").pagination({
                    currentPage: 1,
                    totalPage:totalPage,
                    isShow: false,
                    count: 5,
                    prevPageText: "上一页",
                    nextPageText: "下一页",
                    callback: function(current) {
                        var i = (current-1)*5;
                        var j = i+5;
                        document.getElementsByClassName("parent2")[0].innerHTML="";
                        for(i ;i<j;i++){
                            document.getElementsByClassName("parent2")[0].innerHTML+='<tr> \n'+
                                '<th>'+financeData[i].financeTime+'</th> \n'+
                                '<th>'+financeData[i].financeMoney+'</th> \n'+
                                '<th>'+financeData[i].financeProject+'</th> \n'+
                                '<th>'+financeData[i].financeTransactor+'</th> \n'+
                                '<th><a href="'+data[i].financeEvidence+'" target="_blank"><img src="'+data[i].financeEvidence+'" width="30px" alt=""></a></th> \n'+
                                '<th>'+financeData[i].financeMark+'</th> \n'+
                                '</tr>';
                        }
                    }
                });
            </script>
        </div>
    </div>
</div>
</c:if>

<%--footer--%>
<div class="footer" style="overflow:hidden;padding: 10px; background-color: #ccc; margin:10px 0;">
    <div class="row">
        <div class="col-md-1">
            <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png" alt="" class="img-responsive hidden-xs hidden-sm">
        </div>
        <div class="col-md-5">
            <h3 class="text-muted footer-logo">dreamtech</h3>
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
<c:if test="${empty sessionScope.user}">
    <script>
        alert("登陆后即可进入捐赠入口");
        window.location.href='/Login';
    </script>
</c:if>
</html>