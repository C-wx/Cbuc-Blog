<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign isTop = (articleInfo.istop == "1")?string('checked','') />
<#assign isMd = (articleInfo.editor == "markdown")?string('checked','') />
<#assign isHtml = (articleInfo.editor == "html")?string('checked','') />
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
    <link rel="stylesheet" href="${base}/plugins/layuiadmin/style/formSelects-v4.css" media="all">
</head>
<style>
    body {
        background-color: rgba(194, 194, 194, 0.3);
    }

    .layui-form-label {
        width: 100px;
    }

    #submitDiv {
        margin-top: -20px;
        margin-left: 900px;
    }
</style>
<body>
<div class="layui-fluid layui-anim layui-anim-upbit" id="LAY-article-add" style="padding-bottom: 50px;">
    <div class="layui-row layui-col-space20 layui-form">
        <input type="hidden" value="${tags}" id="togs">
        <input type="hidden" value="${articleInfo.id}" id="aiId">
        <input type="hidden" value="${articleContent.id}" id="acId">
        <input type="hidden" value="<#if isMd=='checked'>true</#if>" id="isMd">

        <div class="layui-col-md9">
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 20px;font-family: 'kaiti';letter-spacing: 2px">
                        内容编辑 <i class="fa fa-pencil"></i>
                    </strong>
                </div>
                <div class="layui-card-body">
                    <input type="radio" name="editor" value="markdown" title="markdown编辑器" ${isMd}
                           lay-filter="editor">
                    <input type="radio" name="editor" value="html" title="富文本编辑器" ${isHtml}
                           lay-filter="editor">
                    <hr>
                    <div id="content-editor" style="max-width: 1366px;">
                        <textarea id="editor" placeholder="输入内容"
                                  style="display: none;">${articleContent.content}</textarea>
                    </div>
                </div>
                <div class="layui-card-body" id="submitDiv">
                    <div class="layui-inline" id="isTop">
                        <label class="layui-form-label">是否置顶</label>
                        <span class="layui-inline">
                            <input type="checkbox" name="isTop" value="1" lay-skin="switch" lay-text="YES|NO" ${isTop} >
                        </span>
                    </div>
                    <button class="layui-btn" lay-submit lay-filter="postSubmit" id="submitBtn"
                            style="margin-left: 20px">
                        立即修改
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-col-md3" id="right-card">

            <div class="layui-card">
                <div class="layui-card-header">
                    <p><strong style="font-size: 18px;font-family: 'kaiti';letter-spacing: 2px">
                        封面 <i class="fa fa-image"></i>
                    </strong>
                        <button id="addRemoveCover" style="float: right;display: inline-block;margin-top: 10px;"
                                class="layui-btn layui-btn-xs layui-btn-primary"><i class="fa fa-times"></i>
                        </button>
                    </p>
                </div>
                <div class="layui-card-body">
                    <div class="layui-upload-drag" id="coverImg"
                         style="padding: 20px 5px 5px 5px;height: 120px;width: 100%;">
                        <i class="layui-icon"></i>
                        <#if articleContent.image!=''>
                          <p><img src="${articleContent.image}" style="width: 100%;height: 115px;margin-top: -57px"></p>
                        <#else><p>点击上传博文封面，或将封面拖拽到此处</p>
                        </#if>
                    </div>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 18px;font-family: 'kaiti';letter-spacing: 2px">
                        文章标题
                    </strong>
                </div>
                <div class="layui-card-body">
                    <div class="layui-form-item">
                        <input type="text" name="title" required lay-verify="required" placeholder="请输入文章标题"
                               autocomplete="off" class="layui-input" value="${articleInfo.title}">
                    </div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 18px;font-family: 'kaiti';letter-spacing: 2px">
                        文章分类
                    </strong>
                </div>
                <div class="layui-card-body">
                    <label>
                        <select name="cateId" xm-select="cateId" xm-select-search="" xm-select-max="3">
                            <option value="">请选择分类，可多选</option>
                             <#list categories as c>
                                <option value="${c.id}" <#list cates as ct >
                                        <#if ct.id == c.id>selected</#if></#list>>${c.name}</option>
                             </#list>
                        </select>
                    </label>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 18px;font-family: 'kaiti';letter-spacing: 2px">
                        标签 <i class="fa fa-lightbulb-o"></i>
                    </strong>
                </div>
                <div class="layui-card-body">
                    <div class="tags" id="tags">
                        <input type="text" name="" id="inputTags" placeholder="输入标签名称，回车生成标签"
                               autocomplete="off">
                    </div>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">
                    <strong style="font-size: 18px;font-family: 'kaiti';letter-spacing: 2px">
                        摘要 <i class="fa fa-pencil-square-o"></i>
                    </strong>
                </div>
                <div class="layui-card-body">
                    <textarea name="summary" placeholder="不填写摘要则系统自动生成" class="layui-textarea"
                              style="min-height: 300px;">${articleInfo.summary}</textarea>
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
        , formSelects: 'formSelects-v4'
    }).use(['index', 'articleEdit', 'formSelects', 'inputTags']);
</script>
<script type="text/javascript">
    var tags = $("#togs").val();
    var isMD = $("#isMd").val();
    var aiId = $("#aiId").val();
    var acId = $("#acId").val();
    if (isMD) {
        var mdContents = $("#editor").text();
    }
</script>
</body>
</html>