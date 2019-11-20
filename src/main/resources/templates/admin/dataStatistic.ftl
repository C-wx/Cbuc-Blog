<!DOCTYPE html>
<#assign base=request.contextPath />
<head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!--jquery-->
    <script src="${base}/js/jquery-1.11.2.min.js"></script>
    <script src="${base}/js/base.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${base}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- layui -->
    <script src="${base}/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="${base}/plugins/layui/css/layui.css">
    <!--css-->
    <link rel="stylesheet" href="${base}/plugins/layuiadmin/style/admin.css" media="all">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${base}/vendor/font-awesome/css/font-awesome.min.css">
    <!--echart-->
    <script src="${base}/plugins/layuiadmin/lib/extend/echarts.js"></script>
</head>
<style>
    body {
        background-color: rgba(194, 194, 194, 0.3);
    }
</style>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">数据总计</strong>
                        </div>
                        <div class="layui-card-body">
                            <div class="layui-carousel layadmin-carousel layadmin-backlog">
                                <ul class="layui-row layui-col-space10">
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>评论总计</h3>
                                            <p><cite>${dataMap.commentTotal}</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>留言总计</h3>
                                            <p><cite>${dataMap.contactTotal}</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>用户总计</h3>
                                            <p><cite>1</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>访问总计</h3>
                                            <p><cite>${dataMap.viewTotal}</cite></p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">当日数据</strong>
                        </div>
                        <div class="layui-card-body">
                            <div class="layui-carousel layadmin-carousel layadmin-backlog">
                                <ul class="layui-row layui-col-space10">
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>今日评论</h3>
                                            <p><cite>${dataMap.commentNowday}</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>今日留言</h3>
                                            <p><cite>${dataMap.contactNowday}</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>今日新增用户</h3>
                                            <p><cite>999</cite></p>
                                        </div>
                                    </li>
                                    <li class="layui-col-xs6">
                                        <div class="layadmin-backlog-body">
                                            <h3>今日访问</h3>
                                            <p><cite>${dataMap.viewNowday}</cite></p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">博文发布统计</strong>
                        </div>
                        <div class="layui-card-body">
                            <div class="layui-input-inline">
                                <span style="position: relative;left: 10px;top: 12px;">统计周期:</span>
                                <input type="text" name="date" id="date" class="layui-input" style="position: relative;left: 100px;top: -20px;">
                            </div>
                            <div id="main" style="width: 1000px;height:400px;position: relative;top: -20px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">最新评论</strong>
                </div>
                <div class="layui-card-body layadmin-takerates">
                    <p>
                        <span class="layui-word-aux">文章：</span>
                        <span>${lastData.comment.detail}</span>
                    </p>
                    <hr>
                    <p>
                        <span class="layui-word-aux">用户：</span>
                        <span>${lastData.comment.loginIp}</span>
                    </p>
                    <hr>
                    <p style="word-break: break-all;">
                        <span class="layui-word-aux">评论：</span>
                        <span>${lastData.comment.content}</span>
                    </p>
                    <hr>
                    <p th:inline="text">
                        <span class="layui-word-aux">时间：</span>
                        <span>${lastData.comment.createTime?string('yyyy-MM-dd hh:mm:ss')}</span>
                    </p>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">最新留言</strong>
                </div>
                <div class="layui-card-body layadmin-takerates">
                    <p>
                        <span class="layui-word-aux">用户：</span>
                        <span>${lastData.contact.email}</span>
                    </p>
                    <hr>
                    <p style="word-break: break-all;">
                        <span class="layui-word-aux">留言：</span>
                        <span>${lastData.contact.message}</span>
                    </p>
                    <hr>
                    <p th:inline="text">
                        <span class="layui-word-aux">时间：</span>
                        <span>${lastData.contact.createTime?string('yyyy-MM-dd hh:mm:ss')}</span>
                    </p>
                </div>
            </div>

            <div class="layui-card" style="height: 390px;">
                <div class="layui-card-header">
                    <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">操作日志</strong>
                </div>
                <div class="layui-card-body" style="padding-top: 25px;">
                    <ul class="layui-timeline" id="accessLog"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '/static/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'dataStatistic']);
</script>
</body>
</html>