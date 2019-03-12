<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0">
    <title>news</title>
    <style>
        .newsP p {
            width: 100px;
            overflow: hidden;
            -ms-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: none;
        }

        .newsP p:first-child {
            display: block;
        }
    </style>
</head>
<body>
<!--新增内容-->
<div class="row">
    <div class="col-md-2">
        <h1 style="margin-top: 0;"><span class="label label-default" style="user-select: none">报名信息</span></h1>
    </div>
</div>

<!--表单内部编辑-->
<table class="table table-hover">
    <thead>
    <tr class="warning">
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>班级</td>
        <td>电话</td>
        <td>意向</td>
        <td>自我介绍（选填）</td>
        <td>编辑</td>
    </tr>
    </thead>
    <tbody id="news_list">
    <c:forEach items="${applicationList}" var="al">
    <tr class="newsP">
        <td>${al.applicationId}</td>
        <td>${al.applicationName}</td>
        <td>${al.applicationSex}</td>
        <td><p>${al.applicationClass}</p></td>
        <td>${al.applicationPhone}</td>
        <td>${al.applicationIntention}</td>
        <td><p>${al.applicationIntroduce}</p></td>
        <td>
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target=".newsEdit">详情</button>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<!--弹框面板-->
<div class="modal fade newsEdit newsAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">详情</h4>
            </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="num">编号:</label>
                                <input type="number" disabled="disabled" class="form-control" id="num" placeholder="编号" name="num">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">姓名:</label>
                                <input type="text" disabled="disabled" class="form-control" id="name" placeholder="姓名" name="name">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="class">班级:</label>
                                <input type="text" disabled="disabled" class="form-control" id="class" placeholder="班级"
                                       name="class">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="phone">电话:</label>
                                <input type="number" disabled="disabled" class="form-control" id="phone" placeholder="电话" name="phone">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="intention">意向:</label>
                                <input type="text" disabled="disabled" name="intention" id="intention">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="sex">性别:</label>
                                <input type="text" disabled="disabled" name="sex" id="sex">
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="introduce">自我介绍:</label><br>

                        <textarea name="introduce" id="introduce" rows="10"
                                  disabled="disabled" style="width: 100%;resize: none;padding: 20px;" placeholder="自我介绍"></textarea>
                    </div>
                </div>
        </div>
    </div>
</div>

<c:if test="${empty sessionScope.adminUser}">
    <script>
        alert("请先登陆");
        window.location.href='/Admin';
    </script>
</c:if>
<script>
    $(document).ready(function () {
        {
            var newsList = document.getElementById('news_list').children;
            var btns = [];
            var del=[];
            allBtn();
            change();
            function allBtn() {
                for (var i = 0; i < newsList.length; i++) {
                    btns[i] = newsList[i].querySelectorAll('button')[0];
                    del[i] = newsList[i].querySelectorAll('button')[1];
                }
            }
            //内部修改
            function change() {

                for (var i = 0; i < btns.length; i++) {
                    btns[i].index = i;
                    btns[i].onclick = function () {
                        {
                            //获取列表内容
                            var num = newsList[this.index].children[0];
                            var name = newsList[this.index].children[1];
                            var sex = newsList[this.index].children[2];
                            var class0 = newsList[this.index].children[3];
                            var phone = newsList[this.index].children[4];
                            var intention = newsList[this.index].children[5];
                            var introduce = newsList[this.index].children[6];

                            //获取表单
                            var Num = document.getElementById('num');
                            var Name = document.getElementById('name');
                            var Sex = document.getElementById('sex');
                            var Class = document.getElementById('class');
                            var Phone = document.getElementById('phone');
                            var Intention = document.getElementById('intention');
                            var Introduce = document.getElementById('introduce');

                            //字符串拼接
                            var contents1 = introduce.innerHTML.split('</p>');
                            //去除重复数组
                            for (var i = 0; i < contents1.length; i++) {
                                if (contents1[i] === '' || contents1[i] === 'undefined') {
                                    contents1.splice(i, 1);
                                    i -= 1;
                                }
                            }
                            //拼接
                            var text1 = '';
                            for (var j = 0; j < contents1.length; j++) {
                                text1 += contents1[j].trim().slice(3) + '\n';
                            }
                            //赋值给表单
                            Num.value = num.innerText;
                            Name.value = name.innerText;
                            Sex.value = sex.innerText;
                            Class.value = class0.innerText;
                            Phone.value = phone.innerText;
                            Intention.value = intention.innerText;
                            Introduce.value = text1;
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>