window.onload = function () {
    $.ajax({
        url: "/Member",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            window.jsonPic = data[0];
        }
    });
    //加载
    loadTime();

//创建时间节点
    function createTime(json) {
        var text = '<div class="panel panel-default">\n' +
            '        <div class="panel-heading" role="tab" id="heading' + json.num + '">\n' +
            '            <h4 class="panel-title">\n' +
            '                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse' + json.num + '" aria-expanded="true"\n' +
            '                   aria-controls="collapse' + json.num + '">\n' +
            '                    <div class="page-header">\n' +
            '                        <p class="text-primary">' + json.year + '年</p>\n' +
            '                    </div>\n' +
            '                </a>\n' +
            '            </h4>\n' +
            '        </div>\n' +
            '        <div class="container-fluid">\n' +
            '            <div id="collapse' + json.num + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading' + json.num + '">\n' +
            '                <div class="panel-body">\n' +
            '                    <div class="bdr container-fluid"">\n' +
            '\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>';
        return text;
    }

//加载时间节点
    function loadTime() {
        var j = 0;
        var json = "{";
        for (var i in window.jsonPic) {
            json += +j + ": {\"num\": " + "\"" + i + "\"," + "\"year\": " + "\"" + i + "\"},";
            j++;
        }
        json += "}";
        json = eval('(' + json + ')');
        var parent = document.getElementsByClassName('body1')[0];
        for (var k in json) {
            parent.innerHTML = createTime(json[k]) + parent.innerHTML;
        }
        parent.innerHTML = "<div class=\"panel-default\">\n" +
            "        <div class=\"panel-heading\" role=\"tab\">\n" +
            "            <h4 class=\"panel-title\">\n" +
            "                <a role=\"button\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#\" aria-expanded=\"true\">\n" +
            "                    <div class=\"page-header\">\n" +
            "                        <p class=\"text-primary\"  data-toggle=\"modal\" data-target=\".edit\">编辑个人信息</p>\n" +
            "                    </div>\n" +
            "                </a>\n" +
            "            </h4>\n" +
            "        </div>\n" +
            "    </div>" + parent.innerHTML;
        loadPic();
    }

//创建图片节点
    function createPic(json) {
        var text = '<div class="mg">\n' +
            '                            <div class="bd">\n' +
            '                                <img src="' + json.src + '">\n' +
            '                                <span class="btn span" data-toggle="modal" data-target=".bs-example-modal-lg">了解更多</span>\n' +
            '<div id="content">\n' +
            '                <h2 class="text-center text-primary">' + json.contentName + '</h2>\n' +
            '                ' + json.contentP + '\n' +

            '            </div>\n' +
            '                            </div>\n' +
            '                        </div>';

        return text;
    }

//加载图片
    function loadPic() {
        var clkPic = document.getElementsByClassName('panel');
        for (var k = 0; k < clkPic.length; k++) {
            clkPic[k].index = k;
            clkPic[k].onclick = function () {
                if (this.index !== -1) {
                    var ind;
                    ind=Number(this.children[0].id.slice(7));
                    var parent = this.getElementsByClassName('bdr')[0];
                    for (var key in window.jsonPic[ind]) {
                        parent.innerHTML += createPic(window.jsonPic[ind][key]);
                    }
                    getPic();
                    this.index = -1;
                }
            }
        }
    }

//panel图片获取
    function getPic() {
        //click get
        var btn = document.getElementsByClassName('btn');
        var getSrc = document.getElementsByClassName('bd');
        var setContentP = document.getElementsByClassName('contentP')[0];
        //panel面板获取图片
        for (var i = 0; i < btn.length; i++) {
            btn[i].index = i;
            btn[i].onclick = function () {
                var j = this.index;
                var src = getSrc[j].getElementsByTagName('img')[0].getAttribute('src');
                var name = getSrc[j].getElementsByTagName('div')[0].getElementsByTagName('h2')[0].innerText;
                var p = getSrc[j].getElementsByTagName('div')[0].innerHTML;
                setContentP.innerHTML = ' <div class="modal-header">\n' +
                    '                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span\n' +
                    '                            aria-hidden="true">&times;</span></button>\n' +
                    '                </div>' +
                    '<img src="' + src + '" alt="..." width="20%" id="img">\n' +
                    '                <h2 class="text-center text-primary" id="name">' + name + '</h2>' + p.slice(64);
            }
        }
    }
};