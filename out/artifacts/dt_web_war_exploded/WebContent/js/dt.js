window.onload = function () {
    achieve();
    document.body.style.opacity='1';

    window.addEventListener('resize', function () {
        var tm = null;
        var times = new Date();
        return function () {
            var curTime = new Date();
            if (tm) clearTimeout(tm);
            if (curTime - times >= 50) {
                tm = setTimeout(achieve(), 50);
            }
            times = curTime;
        }
    }());

    function achieve() {
        //scroll
        var nav = $('nav');
        var btn1 = $('btn1');//search
        window.onscroll = function () {
            if (client().width > 1270) {
                if (scroll().top > 0.1 * client().width) {
                    nav.style.display = 'block';
                    action(nav, {opacity: .8});
                } else {
                    action(nav, {opacity: 0}, function () {
                        nav.style.display = 'none';
                    });
                }
            }
        };

        //font size
        (function () {
            //get body
            var bd = document.getElementsByTagName('body')[0];
            //check

            if (client().width < 1270) {
                bd.style.fontSize = 7 / 320 * client().width + 'px';
            } else if (client().width >= 1270) {
                bd.style.fontSize = 13 / 1280 * client().width + 'px';
            }

        })();

        if (client().width > 1270) {
            (function () {
                //get
                var bgs = $('bg').children;

                var standWt = client().width;
                var standHt = client().height;
                if (standWt / standHt > 1) {
                    standWt = client().width - 17;
                } else {
                    standWt = client().width;
                }
                console.log(standWt);
                for (var h = 0; h < bgs.length - 1; h++) {
                    bgs[h].style.width = standWt + 'px';
                    bgs[0].style.height = 0.58 * standWt + 'px';
                    bgs[1].style.height = 0.57 * standWt + 'px';
                    bgs[3].style.height = 0.57 * standWt + 'px';
                    bgs[4].style.height = 0.57 * standWt + 'px';
                    bgs[2].style.height = 0.06 * standWt + 'px';
                    bgs[5].style.height = 0.15 * standWt + 'px';
                }
            })();
        }
        else if (client().width <= 1270) {
            (function () {
                //get
                var bgs = $('bg').children;

                var standWt = client().width;
                var standHt = client().height;
                if (standWt / standHt > 1) {
                    standWt = client().width - 17;
                } else {
                    standWt = client().width;
                }

                console.log(standWt);
                for (var h = 0; h < bgs.length - 1; h++) {
                    bgs[h].style.width = standWt + 'px';
                    bgs[0].style.height = 0.9 * standWt + 'px';
                    bgs[1].style.height = 1.3 * standWt + 'px';
                    bgs[2].style.height = 0.1 * standWt + 'px';
                    bgs[3].style.height = 1.3 * standWt + 'px';
                    bgs[4].style.height = 1.5 * standWt + 'px';
                    bgs[5].style.height = 0.3 * standWt + 'px';
                }
            })();
        }


//summary
        var standUl = $('standUl');
        var standUlWidth = standUl.offsetWidth;
        $('head').style.marginLeft = "0px";

        $('c1').onmousedown = function () {
            $('head').style.marginLeft = "0px";
            $('change1').innerHTML = "工作组成立伊始就受到了校领导、计算机系、网管中心、教务处以及各级领导的密切关注，不仅为工作组提供了活动空间，还经常为工作组的人才培养理念提供指导。<br>经过17年的探索，逐渐形成了“尊重教育规律、尊重行业规律、尊重个体差异、注重理论基础、注重项目实践”的培养理念。<br>一般来说，课上的教学和课下的实践相结合，一直是各专业教学的所追求的，课上的教学让学生具备扎实的基础知识，而课下的实践则培养学生运用基础理论知识解决实际问题的能力，通过实践的锻炼也会让学生更加清楚地了解基础理论知识的应用场景及作用，进而增强学生对课上基础理论知识的学习动力，理论指导实践，实践验证理论，二者相互作用，相辅相成。教学过程中经过理论和实践的多次循环才能真正取得上佳的教学效果。<br>每位同学在性格和智力上具有较大差异，教育模式和职业生涯规划也应不相。如思维缜密，喜欢专注于研发的同学更适合第二层级中系统分析员和构架师的工作，而善于交际，喜欢协调事务工作的同学则更适合第一层级中开发组长和第二层级中产品经理以及第三层级中的项目经理的角色。作为指导教师则应该尊重学生的个体差异，因材施教，对职业生涯的引导也应该因人而异，同时指导老师也需实时监测学生的学习状况，适时做出引导，避免出现重技术轻理论的情况。";
        };
        $('c2').onmousedown = function () {
            $('head').style.marginLeft = standUlWidth * 0.25 + "px";
            $('change1').innerHTML = "工作组以计算机行业人才培养为主要工作，经过10多年的摸索，逐步建立了适用于不同基础、不同爱好的同学的培养模式。依据学生掌握的专业技术能力将其分为学习期和实践期两个学习阶段。<br>1、学习期：无基础爱好者到初级专业人才阶段<br>工作组的招新工作不限定时间，对于希望报名的同学也没有任何年级、专业及技术基础要求，所有同学均可到工作组活动室直接报名。报名时工作组负责人将根据其兴趣爱好以及已经掌握的专业技能水平为其安排技术导师，该导师由具有丰富项目开发经验的正式成员担任。导师负责为学生安排学习计划，制定阶段性学习目标，并负责解答学生学习中遇到的所有技术问题。<br>2、实践期：初级专业人才阶段到高级人才阶段<br>该阶段的培养目标是通过真实的项目实践培养行业所需的高层次人才。此项目一般来自校内教师的科研项目或者学生自主联系的校外项目。项目中的所有角色均由学生担任，如：项目经理、产品经理、构架师、系统分析员、测试经理以及程序员，老师或者经验丰富的正式成员将负责指导团队成员在项目实施中遇到的各种问题。";
        };
        $('c3').onmousedown = function () {
            $('head').style.marginLeft = standUlWidth * 0.5 + "px";
            $('change1').innerHTML = "一个优秀的团队离不开成熟的团队文化，工作组非常注重团队文化的建设。Dreamtech工作组的文化由“传承”、“优秀”和“团队”三个方面组成。<br>1、传承：工作组的每位同学均从上一代导师处获益，在导师的细心指导下，从没有技术基础到可以在行业中应聘高级岗位。每位正式成员也将担负起将技能传承下去的义务。始终工作在实际项目第一线的他们拥有丰富的设计经验和娴熟的开发技能，对学习期成员的指导效果也非常理想。<br>2、优秀：工作组的每位同学在成为正式成员过程中经历了重重考核，这些考核不仅是技能上的，更多的是意志品质方面的，最后的成功也使他们养成了优秀的习惯，工作组的技术氛围十分强烈，每位同学都为了保持自己的先进性而奋发学习，再加上前人的技术积淀，技术精进迅速。工作组的“优秀”被归纳于蓝色血液精神，象征着冷静、睿智和坚毅。每位同学在高强度的项目实践中都会体会到蓝色血液的深刻含义，并影响他们的一生。<br>3、团队：计算机行业早已进入了软件工厂时代，任何项目都需要多方面人才组成团队来完成，因此团队意识的培养至关重要。工作组在学习期阶段和实践期阶段都着重培养同学的团队意识，通过多种方式提高学生的沟通意识和能力。";
        };
        $('c4').onmousedown = function () {
            $('head').style.marginLeft = standUlWidth * 0.75 + "px";
            $('change1').innerHTML = "成员先后参加各类竞赛获奖50余项，参加科研项目百余、获得各种专业技术认证20余项。为我校的竞赛和教师的科研工作发挥了积极的作用。<br>参加竞赛方面：在国际大学生程序设计竞赛（ACM）、国际数学建模竞赛（MCM）等各种竞赛中屡获佳绩。<br>校内网络建设方面：华北电力大学保定校区主页、华北电力大学缘路有你论坛、让我下载软件站、VOD点播、电力设备强度与安全研究室网站、华北电力大学工程训练中心等。<br>协助教师科研方面：由校内老师指导完成的风电场发电功率预测系统已在内蒙、山东、河北、山西等多个风力发电场安装上线，切实为风电场的输出功率预测提供了可靠的依据，经鉴定，预测精度达到了国内领先水平，2012年获得了保定市科技进步一等奖、河北省科技进步二等奖。此外，尚有多个在研项目正在进行中。<br>校外实践项目方面：工作组先后开发巨力集团网站、芝加哥中文信息学院网站（商务类网站）；CMS网站管理系统、亿赛思电力安规培训系统等（系统应用类软件开发）；乐凯数码冲印网、安新县供电有限责任公司网站等（校外网站）；沧州市电力公司变电站远程抄表系统、衡水市供电局录波远传系统等。<br>优秀毕业人才：Dreamtech工作组成员毕业后发展迅速，有的进入微软、Intel、百度、腾讯、阿里等国内外知名企业，有的发挥自己的创新能力而创业并有所成就，他们的成功也为后来的同学起到了强有力激励作用。";
        };
//expend
        var smb = $('smb');
        var mask = smb.children[1];
        var bgb = $('bgb');
        var bgi = bgb.children[0];
        smb.onmouseover = function () {
            mask.style.display = 'block';
            bgb.style.display = 'block';
            smb.onmousemove = function (ev) {
                var e = ev || window.event;
                //get
                var x = Math.round(e.clientX - smb.offsetParent.getBoundingClientRect().left - mask.offsetWidth * 0.5);
                var y = Math.round(e.clientY - smb.offsetParent.getBoundingClientRect().top - mask.offsetHeight * 0.5 - nav.offsetHeight);
                //check
                if (x <= 0) {
                    x = 0;
                } else if (x >= smb.offsetWidth - mask.offsetWidth) {
                    x = smb.offsetWidth - mask.offsetWidth;
                }
                if (y <= 0) {
                    y = 0;
                } else if (y >= smb.offsetHeight - mask.offsetHeight) {
                    y = smb.offsetHeight - mask.offsetHeight;
                }
                //move
                mask.style.left = x + 'px';
                mask.style.top = y + 'px';
                //bgi
                bgi.style.left = -x / (smb.offsetWidth / bgi.offsetWidth) + 'px';
                bgi.style.top = -y / (smb.offsetHeight / bgi.offsetHeight) + 'px';
            }
        };
        smb.onmouseout = function () {
            mask.style.display = '';
            bgb.style.display = '';
        };
//news
        var bt1 = $('item1');
        var bt2 = $('item2');
        var bt3 = $('item3');
        var pct = $('pct');
        (function () {
            onMouseOver(bt1);
            onMouseOver(bt2);
            onMouseOver(bt3);
        })();

//mouseover
        function onMouseOver(box) {
            box.onmouseover = function () {
                this.style.backgroundColor = "#f7f7f7";
                this.style.borderRightColor = "#ff8022";
                pct.children[0].src = this.children[0].getAttribute('src');
                pct.children[1].innerHTML = this.children[1].innerHTML;
            };
            box.onmouseout = function () {
                this.style.backgroundColor = "white";
                this.style.borderRightColor = "white";
            };
        }


//member
        var boxF = $('box_content');
        var ul = boxF.getElementsByTagName('ul')[0];
        console.log(ul);
        var box = ul.children;
        var change = new Array(box.length);
        var content = new Array(box.length);

        var lft = $('l_arrow');
        var rt = $('r_arrow');
        //change
        for (var i = 0; i < box.length; i++) {
            change[i] = box[i].children[0].getAttribute('src');
            content[i] = box[i].children[1].innerHTML;
        }
        {
            ul.innerHTML = '<li>\n' +
                '                            <img src="' + change[0] + '" alt="">\n' +
                '                            <div>\n' +
                '                                ' + content[0] + '\n' +
                '                            </div>\n' +
                '                            <span class="l_arrow" id="l_arrow"></span>\n' +
                '                        </li>\n' +
                '                        <li>\n' +
                '                            <img src="' + change[1] + '" alt="">\n' +
                '                            <div>\n' +
                '                                ' + content[1] + '\n' +
                '                            </div>\n' +
                '                        </li>\n' +
                '                        <li>\n' +
                '                            <img src="' + change[2] + '" alt="">\n' +
                '                            <div>\n' +
                '                                ' + content[2] + '\n' +
                '                            </div>\n' +
                '                        </li>\n' +
                '                        <li>\n' +
                '                            <img src="' + change[3] + '" alt="">\n' +
                '                            <div>\n' +
                '                                ' + content[3] + '\n' +
                '                            </div>\n' +
                '                        </li>\n' +
                '                        <li>\n' +
                '                            <img src="' + change[4] + '" alt="">\n' +
                '                            <div>\n' +
                '                                ' + content[4] + '\n' +
                '                            </div>\n' +
                '                            <span class="r_arrow" id="r_arrow"></span>\n' +
                '                        </li>';
        }
        //if<1270
        if (client().width <= 1270) {
            var json = [
                {
                    //1
                    width: 0.4 * client().width,
                    height: 0.65 * client().width,
                    top: 0,
                    left: 0.1 * client().width,
                    opacity: .02,
                    zIndex: 2
                },
                {
                    //2
                    width: 0.6 * client().width,
                    height: 0.974 * client().width,
                    top: 0.1 * client().width,
                    left: 0,
                    opacity: .02,
                    zIndex: 3
                },
                {
                    //3
                    width: 0.6 * client().width,
                    height: 0.974 * client().width,
                    top: 0.25 * client().width,
                    left: 0.18 * client().width,
                    opacity: 1,
                    zIndex: 4
                },
                {
                    //4
                    width: 0.6 * client().width,
                    height: 0.974 * client().width,
                    top: 0.1 * client().width,
                    left: 0.41 * client().width,
                    opacity: .02,
                    zIndex: 3
                },
                {
                    //5
                    width: 0.4 * client().width,
                    height: 0.65 * client().width,
                    top: 0,
                    left: 0.5 * client().width,
                    opacity: .02,
                    zIndex: 2
                }
            ];
            for (var j = 0; j < box.length; j++) {
                action(box[j], json[j]);
            }
            //移动
            boxF.appendChild(lft);
            boxF.appendChild(rt);

            //header
            var header1 = $('header1').getElementsByTagName('ul')[0];
            header1.style.height = $('header1').offsetHeight * 0.1;
        }
        else if (client().width > 1270) {
            //再定义
            lft = $('l_arrow');
            rt = $('r_arrow');
        }
        //change
        lft.onmousedown = function () {
            change.unshift(change.pop());
            content.unshift(content.pop());
            for (var i = 0; i < box.length; i++) {
                box[i].children[0].src = change[i];
                box[i].children[1].innerHTML = content[i];
            }
        };
        rt.onmousedown = function () {
            change.push(change.shift());
            content.push(content.shift());
            for (var i = 0; i < box.length; i++) {
                box[i].children[0].src = change[i];
                box[i].children[1].innerHTML = content[i];
            }
        };
    }


    /*
    函数部分
     */
    //pre function
    //clear bubble
    function clearBubble() {
        (function () {
            if (event && event.stopPropagation) {
                event.stopPropagation();
            } else {
                event.cancelBubble = true;
            }
        })();
    }

    /**
     * 获取滚动的头部距离和左边距离
     * 用法scroll().top/scroll().left
     * @returns {{top: number, left: number}}
     */
    function scroll() {
        if (window.pageYOffset != null) {
            return {
                top: window.pageYOffset,
                left: window.pageXOffset
            }
        } else if (document.compatMode === 'CSS1Compat') {
            return {
                top: document.documentElement.scrollTop,
                left: document.documentElement.scrollLeft
            }
        }
        return {
            top: document.body.scrollTop,
            left: document.body.scrollLeft
        }
    }

    /**
     * 获取css属性值
     * @param obj
     * @param attr (string)
     * @returns {*}
     */
    function getCssValue(obj, attr) {
        if (obj.currentStyle) {
            return obj.currentStyle[attr];
        } else {
            return window.getComputedStyle(obj, null)[attr];
        }
    }

    /**
     * 运动
     * @param obj
     * @param json
     * @param fn
     */
    function action(obj, json, fn) {
        clearInterval(obj.timer);
        var target = 0, begin = 0, speed = 0;
        obj.timer = setInterval(function () {
            var flag = true;
            for (var k in json) {
                if ('opacity' === k) {
                    obj.style.display = 'inline-block';
                    begin = parseInt(getCssValue(obj, k) * 100);
                    target = parseInt(json[k] * 100);
                } else {
                    begin = parseInt(getCssValue(obj, k));
                    target = parseInt(json[k]);
                }
                speed = (target - begin) * 0.1;
                speed = target > begin ? Math.ceil(speed) : Math.floor(speed);
                if ('opacity' === k) {
                    obj.style.opacity = (begin + speed) / 100;
                    obj.style.filter = "alpha(opacity:" + (begin + speed) + ")";
                } else if ("display" === k) {
                    obj.style.display = 'none';
                } else if ("zIndex" === k) {
                    obj.style[k] = json[k];
                } else {
                    obj.style[k] = (begin + speed) + 'px';
                }
                if (target !== begin) {
                    flag = false;
                }
            }
            if (flag) {
                clearInterval(obj.timer);
                if (fn) {
                    fn();
                }
            }

        }, 10);
    }

    /**
     * 获取屏幕宽高
     * @returns {{width: number, height: number}}
     */
    function client() {
        if (window.innerHeight) {
            return {
                width: window.innerWidth,
                height: window.innerHeight
            }
        } else if (window.compatMode === 'CSS1Compat') {
            return {
                width: document.documentElement.clientWidth,
                height: document.documentElement.clientHeight
            }
        }
        return {
            width: document.body.clientWidth,
            height: document.body.clientHeight
        }
    }

    function $(id) {
        return typeof id === "string" ? document.getElementById(id) : null;
    }


};

