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
    <!--plugins-->
    <script src="${base}/plugins/nkeditor/libs/JDialog/JDialog.min.js"></script>
    <script src="${base}/plugins/nkeditor/NKeditor-all-min.js"></script>
    <link rel="stylesheet" type="text/css" href="${base}/plugins/editormd/css/editormd.min.css">
</head>
<style>
    body {
        background-color: rgba(194, 194, 194, 0.3);
    }
</style>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" id="LAY-article-list">
    <div class="layui-card">
        <div class="layui-card-header">
            <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">文章管理</strong>
        </div>
        <div class="layui-card-body">
            <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                <div id="search_area">
                    文章标题：
                    <div class="layui-inline">
                        <input class="layui-input" id="titleKeyword" autocomplete="off">
                    </div>
                    <button class="layui-btn layuiadmin-btn-forum-list" data-type="keyLike">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                    </button>
                    <button class="layui-btn layui-btn-primary" data-type="reload">
                        <i class="layui-icon layui-icon-refresh layuiadmin-button-btn"></i>
                    </button>
                </div>
            </div>
            <div class="layui-card-body">
                <table id="article-table" lay-filter="article"></table>
                <script type="text/html" id="topTpl">
                    <input type="checkbox" name="top" value="{{d.id}}" title="置顶" lay-filter="top" {{
                           d.istop>0 ? 'checked' : '' }}>
                </script>

                <script type="text/html" id="articleBar">
                    <a class="layui-btn layui-bg-blue layui-btn-sm" target="_blank"
                       lay-tips="编辑 &quot;{{d.title}}&quot; "
                       lay-href="/admin/editArticle?id={{d.id}}">编辑</a>
                    <a class="layui-btn layui-bg-red layui-btn-sm" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'articelMana']);
</script>
</body>
</html>