<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>member</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-member.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <script src="/WebContent/js/dt-member.js"></script>
    <script src="//cdn.tinymce.com/4/tinymce.min.js">
    </script>
    <script>
        tinymce.init({
            selector: 'textarea'
        });
    </script>
</head>
<body>
<!--nav1-->
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
<!--header1-->
<div class="header1">
    <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/member/dt-member.jpg" alt="" width="100%" class="img-responsive">
    <div class="page-header text-muted text-center">
        <h1 class="text-danger">工作组成员
            <small class="hidden-xs hidden-sm"> Excellent team member of the working group</small>
        </h1>
    </div>
</div>
<!--body1-->
<div class="body1">
</div>

<!--panel1-->
<div class="panel1">
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content text-muted contentP">
            </div>
        </div>
    </div>
    <div class="modal fade edit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">编辑个人上传信息</h4>
                </div>
                <div class="modal-body">
                    <form action="" method="" name="form1" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">姓名输入</label>
                                    <input type="text" class="form-control" id="name" placeholder="姓名" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="year">入组年份</label>
                                    <select id="year" name="year" class="btn btn-default" style="margin-left: 10px;">
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="position">目前职位</label>
                                    <input type="text" class="form-control" id="position" placeholder="目前职位" name="position">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <image src="" alt="..." width="25%" id="personalImage"></image>
                                    <label for="image" style="margin-top: 20px;">上传个人图片</label>
                                    <input type="file" id="image" name="image">
                                    <input type="hidden" id="isEmpty" name="isEmpty" value="notEmpty"/>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="member_id" name="member_id"/>
                        <div class="form-group" id="intr">
                            <label for="introduce">个人介绍</label><br>
                            <textarea id="introduce" name="introduce">
                            </textarea>
                        </div>
                        <button type="button" onclick="edit()" class="btn btn-default btn-lg" style="margin-top: 40px;margin-bottom: 20px;float: right;" id="btn">保存信息</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

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
<c:if test="${empty sessionScope.user}">
    <script>
        alert("登陆后即可查看会员信息");
        window.location.href='/Login';
    </script>
</c:if>
<script>
    tinymce.init({
        selector:'textarea'
    });
    {
        var year=new Date().getFullYear(); //获取当前年份
        var sel = document.getElementById ('year');//获取select下拉列表
        for ( var i = 2000; i < year+1; i++)//循环添加2006到当前年份加3年的每个年份依次添加到下拉列表
        {
            var option = document.createElement ('option');
            option.value = i;
            var txt = document.createTextNode (i);
            option.appendChild (txt);
            sel.appendChild (option);
        }
    }
    <c:if test="${not empty member}">
        document.getElementById("member_id").value="${member.memberId}";
        document.getElementById("name").value="${member.contentName}";
        document.getElementById("introduce").value = '${member.contentP}';
        document.getElementById("year").value="${member.memberYear}";
        document.getElementById("position").value="${member.memberPosition}";
        document.getElementById("personalImage").src="${member.src}";
    </c:if>
    function edit(){
        var name = document.getElementById("name").value;
        var year = document.getElementById("year").value;
        var position = document.getElementById("position").value;
        var introduce = tinyMCE.activeEditor.getContent();
        var image = document.getElementById("image").value;
        var file = document.getElementById("image");//获取图片
        var personalImage = new Image();
        personalImage.src = document.getElementById("personalImage").src;//获取图片
        var maxsize = 1*1024*1024; //1m
        var index = image.indexOf(".");//截取后缀
        var suffix = image.substring(index);//判断图片大小
        if(name==null || name==undefined || name==""){
            alert("请填写姓名");
        }else if(year==null || year==undefined || year==""){
            alert("请选择入组年份");
        }else if(position==null || position==undefined || position==""){
            alert("请填写目前职位");
        }else if(introduce==null || introduce==undefined || introduce==""){
            alert("请填写个人简介");
        }else if((image==null || image==undefined || image=="")&&!(personalImage.width>0)){
            alert("请选择照片");
        }else if(!(image==null || image==undefined || image=="")&&!(personalImage.width>0)){
            if(suffix!=".bmp"&&suffix!=".png"&&suffix!=".gif"&&suffix!=".jpg"&&suffix!=".jpeg"&&suffix!=".BMP"&&suffix!=".PNG"&&suffix!=".GIF"&&suffix!=".JPG"&&suffix!=".JPEG"){
                alert("文件格式错误，请选择图片");
            }else if((file.files[0].size>maxsize)){
                alert("图片大小不能超过1M");
            }else{
                alert("编辑成功");
                document.form1.action="/Member";
                document.form1.method="post";
                document.form1.submit();
            }
        }else{
            alert("编辑成功");
            if((image==null || image==undefined || image=="")&&(personalImage.width>0)){
                document.getElementById("isEmpty").value = document.getElementById("personalImage").src;
            }
            document.form1.action="/Member";
            document.form1.method="post";
            document.form1.submit();
        }

    }
</script>
</html>