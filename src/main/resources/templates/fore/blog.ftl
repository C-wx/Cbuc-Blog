<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Document</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="/js/base.js"></script>
    <script src="/js/fore/blog.js"></script>
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
    <link rel="stylesheet" href="/css/index/style.css" id="theme-stylesheet">
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
        <a href="/blog" class="active">博客</a>
        <a href="/contact">留言</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">Blink</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="/">首页</a></li>
        <li class="layui-nav-item"><a href="/blog" class="active">博客</a></li>
        <li class="layui-nav-item"><a href="/contact">留言</a></li>
        <li class="layui-nav-item"><a href="album.ftl">Blink</a></li>
        <li class="layui-nav-item"><a href="about.ftl">关于</a></li>
    </ul>
    <p class="access-count"><span class="text">访问量:&nbsp;</span><span
            class="count"><#if Session["accessCount"]?exists> ${Session["accessCount"]}</#if></span></p>
    <p class="blog-count"><span class="text">博文量:&nbsp;</span><span
            class="count"><#if Session["blogCount"]?exists> ${Session["blogCount"]}</#if></span></p>
    <p class="welcome-text"></p>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-1"></div>
        <aside class="col-lg-3">
            <!-- 搜索栏-->
            <div class="widget search">
                <header>
                    <h3 class="h6">Search the blog</h3>
                </header>
                <form action="#" class="search-form">
                    <div class="form-group">
                        <input type="search" placeholder="What are you looking for?">
                        <button type="submit" class="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <!-- 最热博客 -->
            <div class="widget latest-posts">
                <header>
                    <h3 class="h6">Latest Posts</h3>
                </header>
                <div class="blog-posts">
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <!-- 标签栏-->
            <div class="widget categories">
                <header>
                    <h3 class="h6">Categories</h3>
                </header>
            </div>
        </aside>
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-7">
            <div class="content" style="padding: 0px">
                <div class="cont w1000">
                    <div class="list-item"></div>
                    <nav aria-label="Page navigation example" style="position: relative; left: 250px">
                        <ul class="pagination pagination-template d-flex justify-content-center"></ul>
                    </nav>
                </div>
            </div>

        </main>
    </div>
</div>
<div class="footer-wrap">
    <#include "../footer.ftl">
</div>
<script type="text/javascript">
    layui.config({
        base: '/static/js/fore/'
    }).use(['element', 'laypage', 'jquery', 'menu', 'mm'], function () {
        menu = layui.menu;
        menu.init();
    })
</script>
</body>
</html>