<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>CbucBlog</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
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
        <a href="/" class="active">首页</a>
        <a href="/blog">博客</a>
        <a href="/contact">留言</a>
        <a href="/blinks">Blink</a>
        <a href="/bulletin">公告</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="/" class="active">首页</a></li>
        <li class="layui-nav-item"><a href="/blog">博客</a></li>
        <li class="layui-nav-item"><a href="/contact">留言</a></li>
        <li class="layui-nav-item"><a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">Blink</a></li>
        <li class="layui-nav-item"><a href="/bulletin">公告</a></li>
        <li class="layui-nav-item"><a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a></li>
    </ul>
    <p class="access-count"><span class="text">访问量:</span><span class="count"><#if Session["accessCount"]?exists> ${Session["accessCount"]}</#if></span></p>
    <p class="blog-count"><span class="text">博文量:</span><span class="count"><#if Session["blogCount"]?exists> ${Session["blogCount"]}</#if></span></p>
    <p class="welcome-text"></p>
</div>

<div class="banner">
    <div class="cont w1000">
        <div class="title">
            <h3>CBUC<br/>BLOG</h3>
            <h4>well-balanced heart</h4>
        </div>
        <img src="/img/slider-image-1.png">
    </div>
</div>
<div class="connect w1000">
    <i class="fa fa-weixin"></i>
    <i class="fa fa-qq"></i>
    <i class="fa fa-github"></i>
</div>
<div class="footer-wrap">
    <#include "../footer.ftl">
</div>
<script type="text/javascript">
    $(function () {
        menu.init();
        layer.open({
            type: 1
            , anim:4
            , title: false //不显示标题栏
            , closeBtn: false
            , area: '300px;'
            , shade: 0.8
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['立即前往', '我知道了']
            , btnAlign: 'c'
            , moveType: 1 //拖拽模式，0或者1
            , content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 800;text-align: center">承接一切网站类毕设项目<br><br>点击下方按钮进入了解&nbsp;&nbsp;&nbsp;<i class="fa fa-hand-o-down" style="font-size: 20px"></i></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').attr({
                    href: '/gotoArticle/35'
                    , target: '_blank'
                });
            }
        });
    })
</script>
</body>
</html>