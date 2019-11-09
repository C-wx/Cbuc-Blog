<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/plugins/layuiadmin/style/admin.css" media="all">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="/" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a lay-href="/admin/contact" layadmin-event="message" lay-text="用户留言">
                        <i class="fa fa-bell"></i>
                        <#if (contactNum > 0)>
                        <span class="layui-badge-dot"></span>
                        </#if>
                        <span id="msgNum" style="color: darkred;">
                        <#if (contactNum > 0)>
                        ${contactNum}
                        </#if>
                        </span>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect style="margin-right: 40px">
                    <a href="javascript:;">
                        <cite style="font-size: 20px">
                        ${LOGIN_USER.username}
                        </cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/logout"><i class="fa fa-sign-out"></i> 退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo">
                    <cite><i class="fa fa-soundcloud"></i>CbucBlog</cite>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="dataStatistic" class="layui-nav-item layui-this" style="padding-top: 45px">
                        <a href="javascript:;" lay-href="/admin/dataStatistic" lay-tips="数据统计" lay-direction="2">
                            <i class="layui-icon layui-icon-tabs"></i>
                            <cite>数据统计</cite>
                        </a>
                    </li>
                    <li data-name="content" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="内容发布" lay-direction="2">
                            <i class="layui-icon layui-icon-survey"></i>
                            <cite>内容发布</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="article-post">
                                <a lay-href="/admin/modArticle">文章编辑</a>
                            </dd>
                            <dd data-name="note-post">
                                <a lay-href="/admin/modTag">标签编辑</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="contentManage" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="内容管理" lay-direction="2">
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>内容管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="article-manage">
                                <a lay-href="/admin/manaArticle">文章管理</a>
                            </dd>
                            <dd data-name="note-manage">
                                <a lay-href="/admin/manaTag">标签管理</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="dictionary" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="评论/留言" lay-direction="2">
                            <i class="layui-icon layui-icon-reply-fill"></i>
                            <cite>评论/留言</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="catetag">
                                <a lay-href="/admin/dict/catetag">评论管理</a>
                            </dd>
                            <dd data-name="keyword">
                                <a lay-href="/admin/contact">留言管理</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="bulletin" class="layui-nav-item">
                        <a lay-href="/admin/bulletin" lay-tips="公告管理" lay-direction="2">
                            <i class="layui-icon layui-icon-tips"></i>
                            <cite>公告管理</cite>
                        </a>
                    </li>
                    <li data-name="dashboard" class="layui-nav-item">
                        <a href="javascript:;" lay-href="/admin/dashboard" lay-tips="广告管理" lay-direction="2">
                            <i class="layui-icon layui-icon-dollar"></i>
                            <cite>广告管理</cite>
                        </a>
                    </li>
                    <li data-name="dashboard" class="layui-nav-item">
                        <a href="javascript:;" lay-href="/admin/dashboard" lay-tips="下载管理" lay-direction="2">
                            <i class="layui-icon layui-icon-link"></i>
                            <cite>下载管理</cite>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="/admin/dashboard" lay-attr="/admin/dashboard" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe id="LAY_content_iframe" src="/admin/dashboard" frameborder="0"
                        class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="/static/plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: '/static/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>


</body>
</html>
