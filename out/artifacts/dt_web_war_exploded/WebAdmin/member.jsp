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

        #content {
            width: 100%;
            resize: none;
            height: 100px;
        }
    </style>
</head>
<body>
<!--新增内容-->
<div class="row">
    <div class="col-md-2">
        <h1 style="margin-top: 0;"><span class="label label-default" style="user-select: none">工作组员</span></h1>
    </div>
    <div class="col-md-2 col-md-offset-8">
        <button id="add" type="button" class="btn btn-info" data-toggle="modal" data-target=".newsAdd"
                style="margin-top: 10px;margin-bottom: 30px;">发布内容
        </button>
    </div>
</div>

<!--表单内部编辑-->
<table class="table table-hover">
    <thead>
    <tr class="warning">
        <td>编号</td>
        <td>成员姓名</td>
        <td>成员简介</td>
        <td>年份</td>
        <td>成员图片</td>
        <td>编辑</td>
    </tr>
    </thead>
    <tbody id="news_list">
    <tr class="newsP">
        <td>2</td>
        <td>选址和</td>
        <td><p>士大夫撒旦法师打发斯蒂芬啥打法是否士大夫撒旦法师打发斯蒂芬啥打法是否</p>
            <p>士大夫撒旦法师打发斯蒂芬啥打法是否士大夫撒旦法师打发斯蒂芬啥打法是否</p></td>
        <td>2018/08/09</td>
        <td><a href="../images/傍晚时的城市美景.jpg" target="_blank"><img src="../images/傍晚时的城市美景.jpg" width="50"></a></td>
        <td>
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".newsEdit">编辑</button>
        </td>
    </tr>
    </tbody>
</table>

<!--弹框面板-->
<div class="modal fade newsEdit newsAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑内容</h4>
            </div>
            <form>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group col-md-2">
                            <label for="num">编号</label>
                            <input type="number" class="form-control" id="num" placeholder="编号" name="num">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="time">年份</label>
                            <input type="text" class="form-control" id="time" placeholder="时间" name="time">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="title">成员姓名</label>
                        <input type="text" class="form-control" id="title" placeholder="标题" name="name">
                    </div>

                    <div class="form-group">
                        <label for="content">成员简介</label>
                        <textarea class="form-control" id="content" placeholder="内容" name="introduce"></textarea>
                    </div>

                    <div class="form-group">
                        <img src="" alt="" id="img" width="200">
                        <label for="pic" style="display: block;margin-top: 20px;">选择图片</label>
                        <input type="file" id="pic" name="pic">
                        <p class="help-block">图片尺寸：</p>
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="save">保存修改</button>
                </div>
            </form>

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
            allBtn();
            change();
            itemDelete();

            function allBtn() {
                for (var i = 0; i < newsList.length; i++) {
                    btns[i] = newsList[i].querySelectorAll('button')[0];
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
                            var title = newsList[this.index].children[1];
                            var content = newsList[this.index].children[2];
                            var time = newsList[this.index].children[3];

                            var img = newsList[this.index].children[4].children[0].children[0];
                            var href = newsList[this.index].children[4].children[0];

                            //获取表单
                            var Num = document.getElementById('num');
                            var Title = document.getElementById('title');
                            var Content = document.getElementById('content');
                            var Time = document.getElementById('time');

                            var Img = document.getElementById('img');

                            //字符串拼接
                            var contents1 = content.innerHTML.split('</p>');
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
                            Title.value = title.innerText;
                            Content.value = text1;
                            Time.value = time.innerText;
                            Img.src = img.getAttribute('src');
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>