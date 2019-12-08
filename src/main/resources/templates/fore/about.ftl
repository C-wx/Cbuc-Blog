<!DOCTYPE html>
<#assign base=request.contextPath />
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Document</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!--主css-->
    <link rel="stylesheet" type="text/css" href="/css/fore/main.css">
    <!--加载meta IE兼容文件-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="header">
    <div class="menu-btn">
        <div class="menu"></div>
    </div>
    <h1 class="logo">
        <a href="index.html">
            <span>MYBLOG</span>
            <img src="../res/img/logo.png">
        </a>
    </h1>
    <div class="nav">
        <a href="index.html">文章</a>
        <a href="blinks.ftl">微语</a>
        <a href="contact.ftl">留言</a>
        <a href="album.ftl">相册</a>
        <a href="about.ftl" class="active">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="index.html">文章</a></li>
        <li class="layui-nav-item"><a href="blinks.ftl">微语</a></li>
        <li class="layui-nav-item"><a href="contact.ftl">留言</a></li>
        <li class="layui-nav-item"><a href="album.ftl">相册</a></li>
        <li class="layui-nav-item"><a href="about.ftl" class="active">关于</a></li>
    </ul>
    <#if Session["loginUser"]?exists>
        <p class="welcome-user">
            欢迎您: ${Session["loginUser"].userName}
        </p>
    <#else>
        <p class="welcome-text"></p>
    </#if>
</div>

<div class="about-content">
    <div class="w1000">
        <div class="item info">
            <div class="title">
                <h3>我的介绍</h3>
            </div>
            <div class="cont">
                <img src="../res/img/xc_img1.jpg">
                <div class="per-info">
                    <p>
                        <span class="name">小明</span><br/>
                        <span class="age">24岁</span><br/>
                        <span class="Career">设计师, 前端工程师</span><br/>
                        <span class="interest">爱好旅游,打游戏</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="item tool">
            <div class="title">
                <h3>我的技能</h3>
            </div>
            <div class="layui-fluid">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
                        <div class="cont-box">
                            <img src="../res/img/gr_img2.jpg">
                            <p>80%</p>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
                        <div class="cont-box">
                            <img src="../res/img/gr_img3.jpg">
                            <p>80%</p>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
                        <div class="cont-box">
                            <img src="../res/img/gr_img4.jpg">
                            <p>80%</p>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
                        <div class="cont-box">
                            <img src="../res/img/gr_img5.jpg">
                            <p>80%</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item contact">
            <div class="title">
                <h3>联系方式</h3>
            </div>
            <div class="cont">
                <img src="../res/img/erweima.jpg">
                <div class="text">
                    <p class="WeChat">微信：<span>1234567890</span></p>
                    <p class="qq">qq：<span>123456789</span></p>
                    <p class="iphone">电话：<span>123456789</span></p>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="footer-wrap">
    <div class="footer w1000">
        <div class="qrcode">
            <img src="../res/img/erweima.jpg">
        </div>
        <div class="practice-mode">
            <img src="../res/img/down_img.jpg">
            <div class="text">
                <h4 class="title">我的联系方式</h4>
                <p>微信<span class="WeChat">1234567890</span></p>
                <p>手机<span class="iphone">1234567890</span></p>
                <p>邮箱<span class="email">1234567890@qq.com</span></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base: '../res/js/util/'
    }).use(['element', 'laypage', 'form', 'layer', 'menu'], function () {
        element = layui.element, laypage = layui.laypage, form = layui.form, layer = layui.layer, menu = layui.menu;
        menu.init();
    })
</script>
</body>
</html>