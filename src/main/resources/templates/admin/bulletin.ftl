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
    body{
        background-color: rgba(194, 194, 194, 0.3);
    }
</style>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" style="padding-bottom: 50px;">
    <div class="layui-row layui-col-space20 layui-form">
        <div class="layui-col-md8">
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">添加公告</strong>
                </div>
                <div class="layui-card-body" style="padding-top: 25px;">
                    <div id="dateSet" class="layui-col-md12" style="padding-bottom: 20px">
                        <div class="layui-col-md5 layui-col-md-offset1">
                            <div class="layui-col-md3" style="font-size: 14px; line-height: 38px">发布时间：</div>
                            <div class="layui-col-md6">
                                <input type="text" name="beginTime" id="beginTime" autocomplete="off" class="layui-input" style="width: 200px">
                            </div>
                        </div>
                        <div class="layui-col-md5">
                            <div class="layui-col-md3" style="font-size: 14px; line-height: 38px">失效时间：</div>
                            <div class="layui-col-md6">
                                <input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input" style="width: 200px">
                            </div>
                        </div>
                    </div>
                    <div id="content-editor" style="padding-top: 25px;">
                        <textarea id="editor" style="display: none;"></textarea>
                    </div>
                    <br>
                    <button type="button" class="layui-btn layui-btn-primary" lay-submit lay-filter="postSubmit"
                            style="margin-left: 950px;">
                        发布公告
                    </button>
                </div>
            </div>
            <div class="layui-card">
            <div class="layui-card-body">
                <div class="layui-card-header">
                    <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">公告管理</strong>
                </div>
                <div class="layui-card-body" style="padding-top: 25px;">
                    <table class="layui-hide" id="bulletinTable" lay-filter="bulletin"></table>
                    <script type="text/html" id="enableTpl">
                        <input type="checkbox" name="enable" value="{{d.id}}" lay-skin="switch" lay-text="已读|未读" lay-filter="enable" {{ d.status == 'D' ? 'checked' : ''}}>
                    </script>
                </div>
            </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 22px;font-family: 'kaiti';letter-spacing: 2px">历史公告</strong>
                </div>
                <div class="layui-card-body" style="padding-top: 25px;">
                    <ul class="layui-timeline" id="historyBulletin"></ul>
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