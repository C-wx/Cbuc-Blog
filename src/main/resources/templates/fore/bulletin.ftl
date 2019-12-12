<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>CbucBlog</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="/js/base.js"></script>
    <script src="/js/fore/menu.js"></script>
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
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
    <h1 class="logo" style="font-size: 4.5rem;">
        <a href="/">
            <span>MYBLOG</span>
            <img src="/img/logo.png">
        </a>
    </h1>
    <div class="nav">
        <a href="/">首页</a>
        <a href="/blog">博客</a>
        <a href="/contact">留言</a>
        <a href="/blinks">Blink</a>
        <a onclick="/bulletin" class="active">公告</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="/">首页</a></li>
        <li class="layui-nav-item"><a href="/blog">博客</a></li>
        <li class="layui-nav-item"><a href="/contact" class="active">留言</a></li>
        <li class="layui-nav-item"><a href="/blinks">Blink</a></li>
        <li class="layui-nav-item"><a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a></li>
    </ul>
    <p class="access-count"><span class="text">访问量:</span><span class="count"><#if Session["accessCount"]?exists> ${Session["accessCount"]}</#if></span></p>
    <p class="blog-count"><span class="text">博文量:</span><span class="count"><#if Session["blogCount"]?exists> ${Session["blogCount"]}</#if></span></p>
    <#if Session["loginUser"]?exists>
        <p class="welcome-user">
            欢迎您: ${Session["loginUser"].userName}
        </p>
    <#else>
        <p class="welcome-text"></p>
    </#if>
</div>

<div class="banner">
    <div class="cont w1000">
        <div id="Bulletin">
            <div class="BulletinTitle">公告栏:</div>
        </div>
        <img src="/img/slider-image-1.png">
    </div>
</div>
<div class="footer-wrap">
    <#include "../footer.ftl">
</div>
<script type="text/javascript">
    $(function () {
        Base.ajax("getBulletin",null,function (result) {
            if (result.code == Base.status.success) {
                var data = result.data;
                data.reverse();
                data.forEach(function (data) {
                    var bulletinHtml =
                            "<blockquote class=\"layui-elem-quote\">\n" +
                            "<div>"+data.content+"</div><br>" +
                            "<div style='margin-left: 530px'>---&nbsp;&nbsp;"+Base.formatDate(data.createTime,"yyyy-MM-dd")+"</div>"+
                            "</blockquote>";
                    $(".BulletinTitle").after(bulletinHtml);
                })

            }
        })
    })
</script>
</body>
</html>