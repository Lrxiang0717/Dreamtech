<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>login</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-login.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <script src="/WebContent/js/dt-login.js"></script>
</head>
<body>
<div class="container father">
    <div class="bg">
        <form action="" class=".bg" method="" name="form1">
            <fieldset style="padding: 20px">
                <div class="modal-header">
                    <button type="button" id="back" class="btn btn-danger" style="float: right;">返回首页</button>
                    <p class="text-primary" style="margin-left: -10px;margin-bottom: 20px;font-size: 30px;float: left;">登陆</p>
                </div>
                <div class="form-group">
                    <label for="user_name">账号:</label>
                    <input type="text" class="form-control" id="user_name" placeholder="账号" name="user_name">
                </div>
                <div class="form-group">
                    <label for="user_password">密码:</label>
                    <input type="password" class="form-control" id="user_password" placeholder="密码" name="user_password">
                </div>
                <button type="button" onclick="login()" id="btn" class="btn btn-default" value="提交">提交</button>
            </fieldset>
        </form>
    </div>
</div>
<script>
    function login(){
        var user_name = document.getElementById("user_name").value;
        var user_password = document.getElementById("user_password").value;
        if(user_name==null || user_name==undefined || user_name==""){
            alert("请填写用户名");
        }else if(user_password==null || user_password==undefined || user_password==""){
            alert("请填写密码");
        }else{
            document.form1.action="/Login";
            document.form1.method="post";
            document.form1.submit();
        }
    }
    var msg ='<%=request.getParameter("msg")%>';
    if(msg === 'error'){
        alert("用户名或密码错误");
    }
</script>
<c:if test="${not empty sessionScope.user}">
    <script>
        alert("您已登陆");
        window.location.href='/';
    </script>
</c:if>
</body>
</html>