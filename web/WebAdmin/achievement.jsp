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
            height: 200px;
        }
    </style>
</head>
<body>
<!--新增内容-->
<div class="row">
    <div class="col-md-2">
        <h1 style="margin-top: 0;"><span class="label label-default" style="user-select: none">学术成果</span></h1>
    </div>
    <div class="col-md-1 col-md-offset-8">
        <button id='add' type="button" class="btn btn-info" data-toggle="modal" data-target=".newsAdd"
                style="margin-top: 10px;margin-bottom: 30px;">发布内容
        </button>
    </div>
</div>

<!--表单内部编辑-->
<table class="table table-hover">
    <thead>
    <tr class="warning">
        <td>编号</td>
        <td>项目标题</td>
        <td>项目内容</td>
        <td>发布时间</td>
        <td>浏览人数</td>
        <td>图片</td>
        <td>编辑</td>
        <td>删除</td>
    </tr>
    </thead>
    <tbody id="news_list">
    <c:forEach items="${achievementsList}" var="al">
    <tr class="newsP">
        <td>${al.target}</td>
        <td><p>${al.title}</p></td>
        <td>${al.content}</td>
        <td>${al.time}</td>
        <td>${al.count}</td>
        <td><a href="${al.src}" target="_blank"><img src="${al.src}" width="50"></a></td>
        <td>
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target=".newsEdit">编辑</button>
        </td>
        <td>
            <button type="button" onclick="del(${al.target})" class="btn btn-danger btn-sm">删除</button>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<!--弹窗-->
<div class="modal fade newsEdit newsAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑内容</h4>
            </div>
            <form name="form1" action="" method="" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" id="achievements_id" name="achievements_id" value="empty">
                    <div class="form-group">
                        <label for="title">项目标题</label>
                        <input type="text" class="form-control" id="title" placeholder="标题" name="achievements_title">
                    </div>

                    <div class="form-group">
                        <label for="content">项目内容</label>
                        <textarea class="form-control" id="content" placeholder="内容" name="achievements_content"></textarea>
                    </div>

                    <div class="form-group">
                        <img src="" alt="" id="img" width="200">
                        <input type="hidden" id="isEmpty" name="isEmpty" value="notEmpty"/>
                        <label for="pic" style="display: block;margin-top: 20px;">选择图片</label>
                        <input type="file" id="pic" name="achievements_image">
                        <p class="help-block">图片尺寸：</p>
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" onclick="edit()" class="btn btn-primary" id="save">保存修改</button>
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
    function del(id){
        if(confirm("确认删除?")){
            alert("删除成功");
            location="/Admin/DelAchievements?achievements_id="+id;
        }
    }
    function edit(){
        var title = document.getElementById("title").value;
        var content = tinyMCE.activeEditor.getContent();
        var pic = document.getElementById("pic").value;
        var image = new Image();
        image.src = document.getElementById("img").src;
        if(title==null || title==undefined || title==""){
            alert("请输入标题");
        }else if(content==null || content==undefined || content==""){
            alert("内容为空");
        }else if((pic==null || pic==undefined || pic=="")&&!(image.width>0)){
            alert("请选择照片")
        }else{
            alert("编辑成功");
            if((pic==null || pic==undefined || pic=="")&&(image.width>0)){
                document.getElementById("isEmpty").value = image.src;
            }
            document.form1.action="/Admin/AddAchievements";
            document.form1.method="post";
            document.form1.submit();
        }
    }
    $(document).ready(function () {
        {
            var newsList = document.getElementById('news_list').children;
            var btns = [];
            var del=[];
            allBtn();
            add();
            change();

            function allBtn() {
                for (var i = 0; i < newsList.length; i++) {
                    btns[i] = newsList[i].querySelectorAll('button')[0];
                    del[i] = newsList[i].querySelectorAll('button')[1];
                }
            }
            //新增列表
            function add() {
                var fatherAdd = document.getElementById('add');
                fatherAdd.onclick = function () {
                    //获取value
                    var Num = document.getElementById('achievements_id');
                    var Title = document.getElementById('title');
                    var Content = document.getElementById('content');
                    var Img = document.getElementById('img');

                    Num.value = 'empty';
                    Title.value = '';
                    tinymce.init({
                        selector: 'textarea',
                        convert_urls: false,
                        plugins: [
                            "link image"
                        ],
                        toolbar: "image link",
                        images_upload_handler: function(blobInfo, success, failure){
                            var xhr, formData;
                            xhr = new XMLHttpRequest();
                            xhr.withCredentials = false;
                            xhr.open("POST", "/Admin/News/Image");
                            formData = new FormData();
                            formData.append("file", blobInfo.blob());
                            xhr.onload = function(e){
                                var json;

                                if (xhr.status != 200) {
                                    failure('HTTP Error: ' + xhr.status);
                                    return;
                                }
                                json = JSON.parse(this.responseText);

                                if (!json || typeof json.location != 'string') {
                                    failure('Invalid JSON: ' + xhr.responseText);
                                    return;
                                }
                                success(json.location);
                            };
                            xhr.send(formData);
                        }
                    });
                    tinyMCE.activeEditor.setContent("");
                    Img.src='';
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
                            var img = newsList[this.index].children[5].children[0].children[0];

                            //获取表单
                            var Num = document.getElementById('achievements_id');
                            var Title = document.getElementById('title');
                            var Content = document.getElementById('content');
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
                            Img.src = img.getAttribute('src');
                            tinymce.init({
                                selector: 'textarea',
                                convert_urls: false,
                                plugins: [
                                    "link image"
                                ],
                                toolbar: "image link",
                                images_upload_handler: function(blobInfo, success, failure){
                                    var xhr, formData;
                                    xhr = new XMLHttpRequest();
                                    xhr.withCredentials = false;
                                    xhr.open("POST", "/Admin/News/Image");
                                    formData = new FormData();
                                    formData.append("file", blobInfo.blob());
                                    xhr.onload = function(e){
                                        var json;

                                        if (xhr.status != 200) {
                                            failure('HTTP Error: ' + xhr.status);
                                            return;
                                        }
                                        json = JSON.parse(this.responseText);

                                        if (!json || typeof json.location != 'string') {
                                            failure('Invalid JSON: ' + xhr.responseText);
                                            return;
                                        }
                                        success(json.location);
                                    };
                                    xhr.send(formData);
                                }
                            });
                            tinyMCE.activeEditor.setContent(text1);
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>