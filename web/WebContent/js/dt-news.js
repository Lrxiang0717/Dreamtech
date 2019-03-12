window.onload = function () {
    var data;
    var dataLength = 0;
    var totalPage = 1;
    var newsComments;
    var page= '<div id="pagination" class="page fl"></div>\n';
    $.ajax({
        url:"/News",
        type:"post",
        dataType:"json",
        async:false,
        success:function (jsonData) {
            data = jsonData[0].newsData;
            totalPage = Math.ceil(jsonData[0].newsCount/5);
        }
    });
    var bodyFather = document.getElementsByClassName('body-father')[0];
    //预加载内容
    for (var d = 1; d < 6; d++) {
        loadNews(d);
    }
    document.getElementsByClassName("box")[0].innerHTML+=page;
    $("#pagination").pagination({
        currentPage: 1,
        totalPage:totalPage,
        isShow: false,
        count: 5,
        prevPageText: "上一页",
        nextPageText: "下一页",
        callback: function(current) {
            $.ajax({
                url:"/News",
                type:"post",
                dataType:"json",
                data:{"currentPage":current},
                async:false,
                success:function (jsonData) {
                    data = jsonData[0].newsData;
                }
            });
            $.ajax({
                url:"/NewsComments",
                type:"post",
                data:{"currentPage":current},
                dataType:"json",
                async:false,
                success:function (data){
                    newsComments = data;
                }
            });
            document.getElementsByClassName("container body-father")[0].innerHTML="";
            var i = 1;
            var j = i+5;
            for (i;i < j;i++) {
                loadNews(i);
            }
            load();
        }
    });
    //动态加载
    /*window.onscroll = function () {
        var clientH = document.documentElement.clientHeight || document.body.clientHeight || 0;
        var top = bodyFather.getBoundingClientRect().bottom;
        if (top - clientH < 10) {
            loadNews();
            //加载新闻内容
            load();
        }
        var scrollT = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        if (scrollT >= 800) {
            back.style.display = 'block';
        } else {
            back.style.display = '';
        }
    };*/

    //新闻
    function news(json) {
        var text = '<div class="text-muted btn-style" data-toggle="modal"  data-count="'+json.count+'" data-target="' + json.target + '">\n' +
            '        <img src="' + json.src + '" alt="" class="src">\n' +
            '        <div class="content">\n' +
            '            <h3 class="text-left text-primary">' + json.title + '</h3>\n' +
            '                ' + json.content + '\n' +
            '        </div>\n' +
            '        <span class="time">' + json.time + '</span>\n' +
            '        <span class="watch"><span class="icon-watch"></span>' + json.count + '</span>\n' +
            '    </div>';
        return text;
    }

    //加载新闻
    function loadNews(i) {
        var json;
        json = data;
        if (i <= Object.keys(json).length) {
            bodyFather.innerHTML += news(json[i-1]);
        }
    }

    //新闻内容
    function newsContent(json) {
        return '<div class="' + json.target + '  modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel">\n' +
            '    <div class="modal-dialog modal-lg" role="document">\n' +
            '        <div class="modal-content">\n' +
            '            <div class="modal-header">\n' +
            '                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>\n' +
            '                </button>\n' +
            '                <h4 class="modal-title text-primary" id="myModalLabel">' + json.title + '</h4>\n' +
            '            </div>\n' +
            '            <div class="modal-body text-muted">\n' +
            '                <img src="' + json.src + '" alt=""  width="100%">\n' +
            '                ' + json.content + '\n' +
            '            </div>\n' +
            '            <div class="modal-footer">\n' +
            '                <textarea name="" id="" class="commentContent"></textarea>\n' +
            '                <!-- Single button -->\n' +
            '                <button class="btn btn-primary ">发表评论</button>\n' +
            '                <div class="comment">\n' +
            '                    <div class="comment-style ">\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>\n' +
            '</div>\n';
    }

    //加载新闻内容
    $.ajax({
        url:"/NewsComments",
        type:"post",
        dataType:"json",
        async:false,
        success:function (data){
            newsComments = data;
        }
    });
    load();
    var arr = [];
    var check=true;
    function load(){
        for (var i = 0; i < bodyFather.children.length; i++) {
            bodyFather.children[i].index=i;
            bodyFather.children[i].onclick = function () {
                $.ajax({
                    url:"/News",
                    type:"get",
                    contentType:'application/x-www-form-urlencoded',
                    data:{id:$(this).attr('data-target'),count:Number($(this).attr('data-count'))+1},
                    async:false,
                    success:function(data){
                    }
                });
                var target = $(this).attr('data-target');
                target = target.slice(1);
                var content = this.getElementsByClassName('content')[0].innerHTML;
                var chat=content.lastIndexOf('</h3>')+6;
                content = content.slice(chat);
                var src = this.getElementsByClassName('src')[0].getAttribute('src');
                var title = this.getElementsByClassName('text-primary')[0].innerText;
                var panelFather = document.getElementsByClassName('panel-father')[0];
                var json = {
                    target: target,
                    title: title,
                    src: src,
                    content: content
                };
                panelFather.innerHTML = newsContent(json);
                //发表评论
                var father = panelFather.getElementsByClassName('modal fade')[0];
                var commentBtn = father.getElementsByClassName('btn-primary')[0];
                var commentContent = father.getElementsByClassName('comment-style')[0];
                var f = parseInt(father.className);
                //获取评论内容并发表
                commentBtn.onclick = function () {
                    var log = "";
                    $.ajax({
                        url:"/GetComment",
                        type:"post",
                        async:false,
                        success:function(data){
                            log=data;
                        }
                    });
                    if(log=="error"){
                        alert("请登录后评论");
                    }else{
                        var getCommentContent = father.getElementsByClassName('commentContent ')[0].value;
                        if (getCommentContent === '') {
                            alert('请输入内容');
                        }
                        else {
                            $.ajax({
                                url: "/GetComment",
                                type: "get",
                                async: false,
                                contentType:'application/x-www-form-urlencoded',
                                data:{id:Number(target)+1,comment:getCommentContent}
                            });
                            var text = '<p class="text-muted">'+log+ " : " + getCommentContent + '</p>';
                            commentContent.innerHTML += text;
                        }
                        arr[f] = commentContent.innerHTML.trim();
                        father.getElementsByClassName('commentContent')[0].value = '';
                    }
                };
                var jsonComment = newsComments;
                if (check) {
                    for (var key in jsonComment) {
                        for (var j in jsonComment[key]) {
                            arr[key] += '<p class="text-muted">' + jsonComment[key][j].ip + " : " + jsonComment[key][j].content + '</p>';
                        }
                        if (arr[key]) {
                            arr[key] = arr[key].slice(9);
                        }
                        check = false;
                    }
                }
                if (arr[f]) {
                    commentContent.innerHTML = arr[f];
                } else {
                    commentContent.innerHTML = '';
                }
            }
        }
    }
};