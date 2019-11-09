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
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" id="LAY-message">
    <div class="layui-col-md9">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div>
                        <h3>公告管理</h3>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header">内容编辑</div>
                    <div class="layui-card-body">
                        <div id="content-editor" style="max-width: 1366px;">
                            <textarea id="editor" placeholder="输入内容" style="display: none;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '/static' //静态资源所在路径
    }).use(["/js/admin/bulletin"]);
</script>
</body>
</html>