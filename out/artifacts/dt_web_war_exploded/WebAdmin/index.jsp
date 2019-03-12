<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="../WebContent/source/bootstrap/css/bootstrap.css">
    <script src="../WebContent/source/jquery/jquery.js"></script>
    <script src="../WebContent/source/bootstrap/js/bootstrap.js"></script>
    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script src="https://cdn.bootcss.com/tinymce/4.7.4/tinymce.min.js"></script>
    <script src="http://gosspublic.alicdn.com/aliyun-oss-sdk-4.4.4.min.js"></script>
    <style>
        body {
            background-color: #e8e8e8;
        }

        .a-style {
            user-select: none;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
    <script>
        $(document).ready(function () {
            auto();

            function auto() {
                var aim = $("#everyContent");

                $("#ne").click(function () {
                    aim.load("/Admin/News");
                    sessionStorage.click = 1;
                });
                $("#ac").click(function () {
                    aim.load("/Admin/Achievements");
                    sessionStorage.click = 2;
                });
                $("#do").click(function () {
                    aim.load("/Admin/Donation");
                    sessionStorage.click = 4;
                });
                $("#mo").click(function () {
                    aim.load("/Admin/Finance");
                    sessionStorage.click = 5;
                });
                $("#ge").click(function () {
                    aim.load("/Admin/Application");
                    sessionStorage.click = 6;
                });

                switch (Number(sessionStorage.click)) {
                    case 2:
                        aim.load("/Admin/Achievements");
                        break;
                    case 4:
                        aim.load("/Admin/Donation");
                        break;
                    case 5:
                        aim.load("/Admin/Finance");
                        break;
                    case 6:
                        aim.load("/Admin/Application");
                        break;
                    default:
                        aim.load("/Admin/News");
                }
            }
        });
    </script>
</head>
<body>
<div>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="page-header">
                <h1>后台管理页面</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-2 col-xs-offset-1">
            <div class="list-group">
                <a class="list-group-item a-style" id="ne">新闻事件</a>
                <a class="list-group-item a-style" id="ac">学术成果</a>
                <a class="list-group-item a-style" id="do">捐款信息</a>
                <a class="list-group-item a-style" id="mo">财务明细</a>
                <a class="list-group-item a-style" id="ge">报名信息</a>
            </div>
        </div>

        <div class="col-xs-8">
            <div id="everyContent" class="well">

            </div>
        </div>
    </div>
</div>
</body>
</html>