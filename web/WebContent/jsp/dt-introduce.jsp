<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>introduce</title>
    <link rel="shortcut icon" href="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-important.png" type="image/x-icon">
    <link rel="stylesheet" href="/WebContent/source/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WebContent/css/dt-introduce.css">
    <script src="/WebContent/source/jquery/jquery.min.js"></script>
    <script src="/WebContent/source/bootstrap/js/bootstrap.min.js"></script>
    <script src="/WebContent/js/dt-introduce.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse"
                    data-target="#intro" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><h1 class="text-primary">Dreamtech</h1></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="intro">
            <ul class="nav navbar-nav navbar-right" id="ul">
                <li><a href="/">网站首页</a></li>
                <li><a href="/Introduce">团队介绍</a></li>
                <li><a href="/News">新闻事件</a></li>
                <li><a href="/Achievements">学术成果</a></li>
                <li><a href="/Member">工作组员</a></li>
                <c:if test="${not empty sessionScope.user}">
                    <li><a href="/Donation">捐赠入口</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <li><a href="/Logout">退出</a></li>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <li><a href="/Login">登陆</a></li>
                </c:if>
                <li><a href="/Application">报名</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="header">
    <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/dt-intro/dt-intro.jpg" alt="" width="100%" class="img-responsive">
</div>
<div class="bg">
    <div class="panel-group body1" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <div class="page-header text-center mgt">
                            <h3 class="text-primary">DT简介
                                <small class="text-warning">DT Brief Introduction</small>
                            </h3>
                        </div>
                    </a>
                </h4>
            </div>
            <div class="container">
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body bd">
                        <h4 class="media-heading text-muted">Dreamtech工作组是我校计算机系将教学规律与行业特点相结合而探索出来的高级创新人才培养基地。Dreamtech工作组于2000年10月12日由学生自发成立，成员来自全校各专业的计算机爱好者，创立之初提出“昨日之起步，圆今日梦想；Dreamtech，你我共行动！”的精神口号。它象征着IT团队合作至上，青年学生朝气蓬勃的精神风貌。工作组目前下设软件组、UI组、理论组、硬件组。人才培养强调以研究性课堂理论为基础，以课外真实科研项目实践为引导，理论与实践相结合，学研双驱，充分激发青年学生自主特性的教学模式。指导老师结合行业特点及每位同学的个体差异，为其提供职业生涯规划指导，使学生提前了解并适应行业的各层次需求。近20年来Dreamtech工作组为计算机行业培养出了大量高层次人才，扩大了我校在计算机行业的影响力。</h4>
                        <h4 class="media-heading text-muted">2000年至今工作组成员已达250余人，在校成员50余人，毕业成员200余人。毕业成员绝大多数从事计算机行业，其中自主创业30余人、知名企业高管20余人，微软、Intel、Illumina、百度、阿里巴巴、腾讯等知名互联网企业170余人。工作组人才培养过程中鼓励学生参加我校教师指导的竞赛和项目实践，近年来成员先后参加各类竞赛获奖50余项，参加科研项目百余项、获得行业各种专业技术认证20余项。为我校的竞赛成绩和教师的科研工作发挥了积极的作用。</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <div class="page-header text-center mgt">
                            <h3 class="text-primary">培养理念
                                <small class="text-warning">The Idea Of Training</small>
                            </h3>
                        </div>
                    </a>
                </h4>
            </div>
            <div class="container">
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <h4 class="media-heading text-muted">
                            Dreamtech工作组成立伊始就受到了校领导、计算机系、网管中心、教务处以及各级领导的密切关注，不仅为工作组提供了活动空间，还经常为工作组的人才培养理念提供指导。经过17年的探索，逐渐形成了“尊重教育规律、尊重行业规律、尊重个体差异、注重理论基础、注重项目实践”的培养理念。一般来说，课上的教学和课下的实践相结合，一直是各专业教学的所追求的，课上的教学让学生具备扎实的基础知识，而课下的实践则培养学生运用基础理论知识解决实际问题的能力，通过实践的锻炼也会让学生更加清楚地了解基础理论知识的应用场景及作用，进而增强学生对课上基础理论知识的学习动力，理论指导实践，实践验证理论，二者相互作用，相辅相成。教学过程中经过理论和实践的多次循环才能真正取得上佳的教学效果。</h4>
                        <h4 class="media-heading text-muted">教育的最终目的是向社会、行业输送大量的可用之才，对于传统行业来说，大学教育不是终点，特别是由国有企业主导的行业，往往都会为新入职的毕业生安排大量的入职培训，用以提高学生所学专业知识与生产实践的结合能力。私有企业主导的计算机行业则很少愿意花费大量的财力、物力对新入职的毕业生进行耐心的培训，更多的是希望所招毕业生能够具备很强的专业实践能力，马上成为公司的即时战力。因此，如果学生能够在大学期间就经历过实际的项目经历，提前培养出企业所急需的专业实践能力，对于学生和企业都具有很大的积极意义。</h4>
                        <h4 class="media-heading text-muted">对于学生而言，底层的程序开发人员仅仅是职业起点。计算机开发企业往往将人才的等级划分为三个层次，即：实现级、设计级、管理级。实现级处于行业层次的最底层，新入职的员工基本上都需要经历这个层次，主要工作是用开发环境将设计级人员的思想转变成程序。在专业化程度较高的企业，设计级人员的软件设计方案已经十分详细，留给实现级开发人员的发挥空间很小，更多的是专注和熟练使用开发环境，对大学所学的专业课程知识要求较少，课堂成绩较差的同学此时的知识差距并不明显。该层级工作也往往被称为软件蓝领，用以类比建筑行业的底层搬砖工人。对创新即生存的计算机企业来说，这个层级对企业的贡献远低于设计级人员，因此该层级的薪资水平和受重视程度也远远不及设计级，但却是最辛苦的。设计级是企业的核心层级，所有产品的创造都源自于此。软件行业中的设计级工作有系统分析员、软件构架师、产品经理、测试经理等，这些工作要求员工具备很强的专业理论基础及利用理论知识指导实践进而解决实际问题的能力。对大学所学的十大基础课的掌握程度将决定此时的能力上限。很多希望应聘设计级工作的员工开始重新恶补大学课程，但往往因为生活、工作压力举步维艰。设计级的工作充满创新的乐趣和更高成果价值，薪资也远高于实现级，加之行业优势，在社会上已经属于高收入的白领阶层。同时，同领域成功解决问题的经验对该层级工作至关重要，因此，该层级员工经验越丰富，价值就越高，因而一旦晋升设计级岗位则意味着更高价值的职业生涯的开始。</h4>
                        <h4 class="media-heading text-muted">管理级处于计算机企业的顶层，一般由具有管理能力的设计级人员晋升而来。</h4>
                        <h4 class="media-heading text-muted">每位同学在性格和智力上具有较大差异，教育模式和职业生涯规划也应不相。如思维缜密，喜欢专注于研发的同学更适合第二层级中系统分析员和构架师的工作，而善于交际，喜欢协调事务工作的同学则更适合第一层级中开发组长和第二层级中产品经理以及第三层级中的项目经理的角色。作为指导教师则应该尊重学生的个体差异，因材施教，对职业生涯的引导也应该因人而异，同时指导老师也需实时监测学生的学习状况，适时做出引导，避免出现重技术轻理论的情况</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        <div class="page-header text-center mgt">
                            <h3 class="text-primary">培养模式
                                <small class="text-warning">Cultivation Model</small>
                            </h3>
                        </div>
                    </a>
                </h4>
            </div>
            <div class="container">

                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <h4 class="media-heading text-muted">
                            Dreamtech工作组以计算机行业人才培养为主要工作，经过10多年的摸索，逐步建立了适用于不同基础、不同爱好的同学的培养模式。依据学生掌握的专业技术能力将其分为学习期和实践期两个学习阶段。</h4>
                        <h4 class="media-heading text-muted">1、学习期：无基础爱好者到初级专业人才阶段</h4>
                        <h4 class="media-heading text-muted">工作组的招新工作不限定时间，对于希望报名的同学也没有任何年级、专业及技术基础要求，所有同学均可到工作组活动室直接报名。报名时工作组负责人将根据其兴趣爱好以及已经掌握的专业技能水平为其安排技术导师，该导师由具有丰富项目开发经验的正式成员担任。导师负责为学生安排学习计划，制定阶段性学习目标，并负责解答学生学习中遇到的所有技术问题。学习期后期，导师将组织同阶段的学生组成开发小组，设定虚拟任务，指导学生使用SVN等项目管理工具、编写项目文档以及培养其团队合作能力。当导师认为学生具备了项目实践的专业技能和团队合作意识后，将其上报工作组负责人，工作组负责人将为其组织由五位同领域导师组成的面试，面试通过后学生结束学习期，成为工作组正式成员，将进行第二阶段的实践期培养。如果没能通过面试则由其导师继续培养，学习期不设置学习期限。一般来说，通过学习期的同学已经具备了较好的专业技术技能和团队合作意识，已经可以胜任企业第一层级的工作，成为企业的即时战力。但培养行业的高级创新人才才是Dreamtech工作组人才培养的终极目标，要实现此目标，第二阶段的培养至关重要。</h4>
                        <h4 class="media-heading text-muted">2、实践期：初级专业人才阶段到高级人才阶段</h4>
                        <h4 class="media-heading text-muted">该阶段的培养目标是通过真实的项目实践培养行业所需的高层次人才。此项目一般来自校内教师的科研项目或者学生自主联系的校外项目。项目中的所有角色均由学生担任，如：项目经理、产品经理、构架师、系统分析员、测试经理以及程序员，老师或者经验丰富的正式成员将负责指导团队成员在项目实施中遇到的各种问题。对于初次担任某个高级角色的成员会得到指导老师的专门关注。在项目结束后，项目经理将组织团队成员对项目进行总结，使学生在项目中获得的知识得到进一步的升华。学生通过多次项目角色的锻炼后，逐步掌握了第二层级岗位的技能，在就业时很多同学直接获得了第二层级的职位。此外，第二层级的岗位技能对计算机专业课程的知识提出了要求，许多同学在实践过程中开始意识到理论专业课的重要性而开始重新学习专业课，并且表现出了强烈的学习欲望，而这将对学生的职业生涯起到极大的促进作用。</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFour">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        <div class="page-header text-center mgt">
                            <h3 class="text-primary">文化建设
                                <small class="text-warning">Cultural Construction</small>
                            </h3>
                        </div>
                    </a>
                </h4>
            </div>
            <div class="container">
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <div class="panel-body">
                        <h4 class="media-heading text-muted">
                            一个优秀的团队离不开成熟的团队文化，工作组非常注重团队文化的建设。Dreamtech工作组的文化由“传承”、“优秀”和“团队”三个方面组成。</h4>
                        <h4 class="media-heading text-muted">1、传承：工作组的每位同学均从上一代导师处获益，在导师的细心指导下，从没有技术基础到可以在行业中应聘高级岗位。每位正式成员也将担负起将技能传承下去的义务。始终工作在实际项目第一线的他们拥有丰富的设计经验和娴熟的开发技能，对学习期成员的指导效果也非常理想。</h4>
                        <h4 class="media-heading text-muted">2、优秀：工作组的每位同学在成为正式成员过程中经历了重重考核，这些考核不仅是技能上的，更多的是意志品质方面的，最后的成功也使他们养成了优秀的习惯，工作组的技术氛围十分强烈，每位同学都为了保持自己的先进性而奋发学习，再加上前人的技术积淀，技术精进迅速。工作组的“优秀”被归纳于蓝色血液精神，象征着冷静、睿智和坚毅。每位同学在高强度的项目实践中都会体会到蓝色血液的深刻含义，并影响他们的一生。</h4>
                        <h4 class="media-heading text-muted">3、团队：计算机行业早已进入了软件工厂时代，任何项目都需要多方面人才组成团队来完成，因此团队意识的培养至关重要。工作组在学习期阶段和实践期阶段都着重培养同学的团队意识，通过多种方式提高学生的沟通意识和能力。</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFive">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        <div class="page-header text-center mgt">
                            <h3 class="text-primary">培养成果
                                <small class="text-warning">Cultivation Results</small>
                            </h3>
                        </div>
                    </a>
                </h4>
            </div>
            <div class="container">
                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                    <div class="panel-body">
                        <h4 class="media-heading text-muted">
                            2000年至今工作组成员已达250余人，在校成员50余人，毕业成员200余人。毕业成员绝大多从事计算机行业，其中自主创业30余人、知名企业高管20余人，微软、Intel、Illumina、百度、阿里巴巴、腾讯等知名互联网企业170余人。工作组人才培养过程中鼓励学生参加我校教师指导的竞赛和项目实践，近年来成员先后参加各类竞赛获奖50余项，参加科研项目百余项、获得行业各种专业技术认证20余项。为我校的竞赛成绩和教师的科研工作发挥了积极的作用。</h4>
                        <h4 class="media-heading text-muted">参加竞赛方面：在国际大学生程序设计竞赛（ACM）、国际数学建模竞赛（MCM）等各种竞赛中屡获佳绩。</h4>
                        <h4 class="media-heading text-muted">校内网络建设方面：华北电力大学保定校区主页、华北电力大学缘路有你论坛、让我下载软件站、VOD点播、电力设备强度与安全研究室网站、华北电力大学工程训练中心、华北电力大学科技学院图文信息中心、华北电力大学校学生会、华北电力大学艺教中心、原应用物理系团总支网站、原应用物理系网站、华北电力大学校友会网站、华电新闻网（校内网站）、华北电力大学虚拟校园系统等。</h4>
                        <h4 class="media-heading text-muted">协助教师科研方面：由校内老师指导完成的风电场发电功率预测系统已在内蒙、山东、河北、山西等多个风力发电场安装上线，切实为风电场的输出功率预测提供了可靠的依据，经鉴定，预测精度达到了国内领先水平，2012年获得了保定市科技进步一等奖、河北省科技进步二等奖。工作组为保定天威集团合作开发的天威风力发电监控系统也已经成功开发完成并安装上线，取得了天威集团使用方的一致好评。工作组为云南电网公司开发的光伏电站功率预测系统已经通过验收。工作组为河北省电力公司开发的河北电力ERP知识库系统与应用系统知识中心已经通过验收并在河北电力公司稳定运行。此外，尚有多个在研项目正在进行中。</h4>
                        <h4 class="media-heading text-muted">校外实践项目方面：工作组先后开发巨力集团网站、芝加哥中文信息学院网站（商务类网站）；CMS网站管理系统、亿赛思电力安规培训系统、国家电网公司人力资源共享平台、国家电网公司成都援藏办事处数据库信息管理系统、北方调速公司网上订购系统等（系统应用类软件开发）；乐凯数码冲印网、安新县供电有限责任公司网站、泊头市供电责任有限公司、国家电网公司成都援藏办事处网站、保定市残疾人联合协会（校外网站）；沧州市电力公司变电站远程抄表系统、衡水市供电局录波远传系统、电能量采集监察系统、网络音视频数码录像系统、芭斯罗缤网站、电子病例管理系统等。</h4>
                        <h4 class="media-heading text-muted">优秀毕业人才：Dreamtech工作组成员毕业后多发展迅速，有的进入微软、Intel、Illumina、百度、腾讯、阿里等国内外知名企业，有的充分发挥自己的创新能力而创业并有所成就，他们的成功也为后来的同学起到了强有力激励作用。</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--footer--%>
<div class="footer" style="overflow:hidden;padding: 10px; background-color: #337ab7; margin:10px 0;">
    <div class="row">
        <div class="col-md-1">
            <img src="https://dtweb.oss-cn-beijing.aliyuncs.com/dt_web/images/logo_03.png" alt="" class="img-responsive hidden-xs hidden-sm">
        </div>
        <div class="col-md-5">
            <h3 class="footer-logo" style="color:white;">dreamtech</h3>
        </div>
        <div class="col-md-6">
            <ul class="footer_ul" style="border-radius:5px;margin-top: 4%;display:flex; justify-content: space-around;align-items: center;">
                <li><a href="http://net.ncepu.edu.cn/">华北电力大学(保定)</a></li>
                <li><a href="http://jsjx.ncepu.edu.cn/computerWeb/index.php">华北电力大学计算机系</a></li>
                <li><a href="http://www.ncepu.edu.cn/">华北电力大学(北京)</a></li>
            </ul>
            <ul class="footer_ul" style="border-radius:5px;margin-top: 5px;display:flex; justify-content: space-around;align-items: center;">
                <li><a href="https://www.oracle.com/index.html">Oracle官网</a></li>
                <li><a href="https://www.acm.org/">ACM官网</a></li>
                <li><a href="https://www.microsoft.com/zh-cn/">微软官网</a></li>
            </ul>
        </div>

    </div>
</div>
</body>
</html>