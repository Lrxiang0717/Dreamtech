window.onload = function () {
    var data;
    var totalPage = 1;
    var page= '<div id="pagination" class="page fl"></div>\n';
    $.ajax({
        url:"/Achievements",
        type:"post",
        dataType:"json",
        async:false,
        success:function (jsonData) {
            data = jsonData[0].achievementsData;
            totalPage = Math.ceil(jsonData[0].achievementsCount/5);
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
                url:"/Achievements",
                type:"post",
                dataType:"json",
                data:{"currentPage":current},
                async:false,
                success:function (jsonData) {
                    data = jsonData[0].achievementsData;
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
        var text = '<div class="' + json.target + '  modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel">\n' +
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
            '        </div>\n' +
            '    </div>\n' +
            '</div>\n';
        return text;
    }

    //加载新闻内容
    load();
    var arr = [];
    var check=true;
    function load(){
        for (var i = 0; i < bodyFather.children.length; i++) {
            bodyFather.children[i].index=i;
            bodyFather.children[i].onclick = function () {
                $.ajax({
                    url:"/Achievements",
                    type:"get",
                    contentType:'application/x-www-form-urlencoded',
                    data:{id:$(this).attr('data-target'),count:Number($(this).attr('data-count'))+1},
                    async:false,
                    success:function(data){}
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
            }
        }
    }
};