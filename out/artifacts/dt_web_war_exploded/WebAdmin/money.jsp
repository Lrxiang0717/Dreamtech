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
        }
    </style>
</head>
<body>
<!--新增内容-->
<div class="row">
    <div class="col-md-2">
        <h1 style="margin-top: 0;"><span class="label label-default" style="user-select: none">财务明细</span></h1>
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
        <td>支出时间</td>
        <td>支出金额</td>
        <td>支出项目</td>
        <td>经手人</td>
        <td>备注</td>
        <td>编辑</td>
        <td>删除</td>
    </tr>
    </thead>
    <tbody id="news_list">
    <c:forEach items="${financeList}" var="fl">
    <tr class="newsP">
        <td>${fl.financeId}</td>
        <td>${fl.financeTime}</td>
        <td>${fl.financeMoney}</td>
        <td><p>${fl.financeProject}</p></td>
        <td>${fl.financeTransactor}</td>
        <td><p>${fl.financeMark}</p></td>
        <td>
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target=".newsEdit">编辑</button>
        </td>
        <td>
            <button onclick="del(${fl.financeId})" type="button" class="btn btn-danger btn-sm">删除</button>
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
                <h4 class="modal-title">编辑内容</h4>
            </div>
            <form name="form1" action="" method="">
            <div class="modal-body">
                    <input type="hidden" id="num" name="finance_id" value="empty">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="project">支出项目</label>
                            <input type="text" class="form-control" id="project" placeholder="项目" name="finance_project">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="money">支出金额</label>
                            <input type="number" class="form-control" id="money" placeholder="金额" name="finance_money">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="people">经手人</label>
                            <input type="text" class="form-control" id="people" placeholder="姓名" name="finance_transactor">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="ps">备注</label>
                            <input type="text" class="form-control" id="ps" placeholder="备注" name="finance_mark">
                        </div>
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
            location="/Admin/DelFinance?finance_id="+id;
        }
    }
    function edit(){
        var Project = document.getElementById('project').value;
        var Money = document.getElementById('money').value;
        var People = document.getElementById('people').value;
        if(Project==null || Project==undefined || Project==""){
            alert("请输入项目");
        }else if(Money==null || Money==undefined || Money==""){
            alert("请输入金额");
        }else if(People==null || People==undefined || People==""){
            alert("请输入经手人");
        }else{
            alert("编辑成功");
            document.form1.action="/Admin/AddFinance";
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
                    del[i]=newsList[i].querySelectorAll('button')[1];
                }
            }
            function add() {
                var fatherAdd = document.getElementById('add');
                fatherAdd.onclick = function () {
                    //获取父标签
                    //获取value
                    var Num = document.getElementById('num');
                    var Project = document.getElementById('project');
                    var Money = document.getElementById('money');
                    var People = document.getElementById('people');
                    var Ps = document.getElementById('ps');

                    Num.value = 'empty';
                    Project.value = '';
                    Money.value = '';
                    People.value='';
                    Ps.value='';
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
                            var money = newsList[this.index].children[2];
                            var project = newsList[this.index].children[3];
                            var people = newsList[this.index].children[4];
                            var ps = newsList[this.index].children[5];

                            //获取表单
                            var Num = document.getElementById('num');
                            var Project = document.getElementById('project');
                            var Money = document.getElementById('money');
                            var People = document.getElementById('people');
                            var Ps = document.getElementById('ps');

                            //赋值给表单
                            Num.value = num.innerText;
                            People.value = people.innerText;
                            Money.value = money.innerText;
                            Ps.value = ps.innerText;
                            Project.value = project.innerText;
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>