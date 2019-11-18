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
</head>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" id="LAY-message">
    <div class="layui-card">
        <div class="layui-card-header">
            <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">留言管理</strong>
        </div>
        <div class="layui-card-body">
            <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                <div id="search_area">
                    留言内容：
                    <div class="layui-inline">
                        <input class="layui-input" name="commentKeyWard" id="messageKeyword" autocomplete="off">
                    </div>
                    &nbsp;&nbsp;用户昵称：
                    <div class="layui-inline">
                        <input class="layui-input" name="nameKeyword" id="nameKeyword" autocomplete="off">
                    </div>
                    <button class="layui-btn" data-type="reload">搜索</button>
                    <button class="layui-btn layui-btn-primary" data-type="reload">重置</button>
                </div>
            </div>
            <div class="layui-card-body">
                <table class="layui-hide" id="message-table" lay-filter="message"></table>
                <script type="text/html" id="enableTpl">
                    <input type="checkbox" name="enable" value="{{d.id}}" lay-skin="switch" lay-text="已读|未读" lay-filter="enable" {{ d.status == 'D' ? 'checked' : ''}}>
                </script>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '/static' //静态资源所在路径
    }).use(["/js/admin/message"]);
</script>
</body>
</html>