<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>dre@mtech</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-get.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <script src="/WebContent/js/dt-get.js"></script>
</head>
<body>
<div class="container father">
    <div class="bg">
        <form action="" class=".bg" method="" name="form1" id="form1">
            <fieldset style="padding: 20px">
                <div class="modal-header">
                    <button type="button" id="back" class="btn btn-danger" style="float: right;">返回首页</button>
                    <p class="text-primary" style="margin-left: -10px;margin-bottom: 20px;font-size: 30px;float: left;">报名</p>
                </div>
                <div class="form-group">
                    <label for="user">姓名:</label>
                    <input type="text" class="form-control" id="user" placeholder="姓名" name="name">
                </div>

                <div class="form-group" id="sex">
                        <label><span>性别：</span> <input checked="checked" type="radio" name="sex" value="男">  男</label>
                        <label><input type="radio" name="sex" value="女">  女</label>
                </div>

                <div class="form-group">
                    <label for="p0">班级:</label>
                    <input type="text" class="form-control" id="p0" placeholder="班级（例如：计算机1601）" name="class">
                </div>

                <div class="form-group">
                    <label for="p1">电话:</label>
                    <input type="number" class="form-control" id="p1" placeholder="电话" name="phone">
                </div>

                <div class="form-group" id="idea">
                    <label><span>意向：</span>
                        <select name="intention" id="check">
                            <option value="前端">前端</option>
                            <option value="后台">后台</option>
                            <option value="UI设计">UI设计</option>
                            <option value="算法设计">算法设计</option>
                            <option value="硬件">硬件</option>
                            <option value="其他">其他</option>
                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label for="p2">自我介绍 (选填):</label><br>

                    <textarea name="introduce" id="p2" cols="30" rows="10"></textarea>
                </div>

                <div class="form-group">
                    <p class="help-block">欢迎来到dreamtech工作组</p>
                </div>
                <button type="button" onclick="application()" id="btn" class="btn btn-default" value="提交">提交</button>
            </fieldset>
        </form>
    </div>
</div>
<script>
    function application(){
        var name_text = document.getElementById("user").value;
        var class_text = document.getElementById("p0").value;
        var phone_text = document.getElementById("p1").value;
        var intention_text = document.getElementById("check").value;
        if(name_text==null || name_text==undefined || name_text==""){
            alert("请填写姓名");
        }else if(class_text==null || class_text==undefined || class_text==""){
            alert("请填写班级");
        }else if(phone_text==null || phone_text==undefined || phone_text==""){
            alert("请填写电话");
        }else if(intention_text==null || intention_text==undefined || intention_text==""){
            alert("请填写意向");
        }else{
            alert("报名成功");
            document.form1.action="/Application";
            document.form1.method="post";
            document.form1.submit();
        }
    }
</script>
</body>
</html>