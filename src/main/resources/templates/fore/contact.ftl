<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Document</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/base.js"></script>
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
        <a href="/">文章</a>
        <a href="whisper.ftl">博客</a>
        <a href="/contact" class="active">留言</a>
        <a href="album.ftl">相册</a>
        <a href="about.ftl">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="index.html">文章</a></li>
        <li class="layui-nav-item"><a href="whisper.ftl">微语</a></li>
        <li class="layui-nav-item"><a href="contact.ftl" class="active">留言</a></li>
        <li class="layui-nav-item"><a href="album.ftl">相册</a></li>
        <li class="layui-nav-item"><a href="about.ftl">关于</a></li>
    </ul>
    <p class="access-count"><span class="text">访问量:</span><span class="count">1000</span></p>
    <p class="blog-count"><span class="text">博文量:</span><span class="count">1000</span></p>
    <p class="welcome-text"></p>
</div>

<div class="banner">
    <div class="cont w1000">
        <div class="title">
            <span class="contactSpan">LEAVE A MESSAGE</>
            <hr>
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="form-group">
                    <input type="text" name="name" id="name" class="form-control "
                           placeholder="Name" ">
                    <p class="help-block text-danger" id="Pname"></p>
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control"
                           placeholder="Email" required="required" onkeyup="verifyEmail()">
                    <p class="help-block text-danger" id="Pemail"></p>
                </div>
                <div class="form-group">
                                    <textarea name="message" id="message" class="form-control" rows="4"
                                              placeholder="Message" required ></textarea>
                    <p class="help-block text-danger" id="Pmessage"></p>
                </div>
                <button type="button" class="stereo-btn" id="submit">Submit</button>
            </form>
        </div>
        <img src="/img/slider-image-1.png">
    </div>
</div>
<#--<div class="content whisper-content leacots-content ">
    <div class="cont w1000">
        <div class="item-box">
            <div class="review-version">
                <div id="contact" class="text-center" style="height: 600px">
                    <div class="container" id="contactContainer">
                        <div class="section-title center">
                            <h1>LEAVE A MESSAGE</h1>
                            <hr>
                        </div>
                        <div id="contactDiv">
                            <form name="sentMessage" id="contactForm" novalidate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="name" id="name" class="form-control "
                                                   placeholder="Name" ">
                                            <p class="help-block text-danger" id="Pname"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" class="form-control"
                                                   placeholder="Email" required="required" onkeyup="verifyEmail()">
                                            <p class="help-block text-danger" id="Pemail"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <textarea name="message" id="message" class="form-control" rows="4"
                                              placeholder="Message" required style="width: 660px;"></textarea>
                                    <p class="help-block text-danger" id="Pmessage"></p>
                                </div>
                                <div id="success"></div>
                                <button type="button" class="stereo-btn" id="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <img src="/img/slider-image-1.png">
    </div>
</div>-->
<div class="footer-wrap">
    <#include "../footer.ftl">
</div>
<script type="text/javascript">
    layui.config({
        base: '/static/js/fore/'
    }).use(['element', 'laypage', 'form', 'menu', 'contact'], function () {
        element = layui.element, laypage = layui.laypage, form = layui.form, menu = layui.menu;
        laypage.render({
            elem: 'demo'
            , count: 70 //数据总数，从服务端得到
        });
        menu.init();
        menu.submit()
    })
</script>
</body>
</html>