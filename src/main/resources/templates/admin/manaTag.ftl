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

    body .layui-layer-tips .layui-layer-content {
        background-color: rgba(146, 184, 177);
    }

    body .layui-layer-tips i.layui-layer-TipsL, .layui-layer-tips i.layui-layer-TipsR {
        border-bottom-color: rgba(146, 184, 177);
    }
</style>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" style="padding-bottom: 50px;">
    <div class="layui-row layui-col-space20 layui-form">
        <div class="layui-col-md8">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">分类管理</strong>
                        <span class="layui-btn layui-btn-radius" id="addTag" onclick="addTag()"
                              style="height:30px;line-height: 30px;font-size: 16px;margin:0px 0px 10px 755px;">添加</span>
                    </div>
                    <div class="layui-card-body" style="padding-top: 25px;">
                        <table class="layui-hide" id="tagTable" lay-filter="bulletin"></table>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">历史标签</strong>
                </div>
                <div class="layui-card-body" style="padding-top: 25px;">
                    <ul class="layui-timeline" id="historyTag"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'manaTag']);
</script>
</body>
</html>