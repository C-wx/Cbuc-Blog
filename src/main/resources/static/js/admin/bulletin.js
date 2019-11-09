/**
 * Copyright:CBUC
 */
var editor;
layui.define(['form', 'element'], function () {
    var $ = layui.$,
        element = layui.element,
        form = layui.form;
    element.render();
    form.render();

    KindEditor.options.filterMode = false;
    KindEditor.ready(function (K) {
        editor = K.create('#editor', {
            cssData: 'body {font-family: "Helvetica Neue", Helvetica, "PingFang SC", 微软雅黑, Tahoma, Arial, sans-serif; font-size: 16px}',
            width: "700px",
            height: "500px",
            items: [
                'undo', 'redo', 'source', 'code', 'plainpaste', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist',
                'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '/',
                'formatblock', 'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough',
                'lineheight', 'removeformat', 'table', 'hr', 'emoticons', 'link', 'unlink', 'preview', 'fullscreen'
            ],
            uploadJson: '/management/upload?reqType=nk',
            dialogOffset: 0, //对话框距离页面顶部的位置，默认为0居中，
            themeType: 'black',
            fixToolBar: true,
            autoHeightMode: true,
            resizeType: 1//可以改变高度
            , afterCreate: function () {
                var self = this;
                KindEditor.ctrl(document, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
                KindEditor.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    KindEditor('form[name=example]')[0].submit();
                });
            },
            //错误处理 handler
            errorMsgHandler: function (message, type) {
                try {
                    JDialog.msg({type: type, content: message, timer: 2000});
                } catch (Error) {
                    alert(message);
                }
            }
        });
    });

    var post = function (data, draft, msg) {
        data.field.draft = draft;
        data.field.cateIds = formSelects.value('cateId', 'val');
        if (data.field.editor === 'html') {
            data.field.mdContent = "";
            data.field.content = editor.html();
        }
        if (data.field.editor === 'markdown') {
            data.field.mdContent = editorMd.getMarkdown();
            data.field.content = editorMd.getHTML();
        }
        data.field.cover = $("#coverImg").find("img").attr("src") || "";
        var $tags = $("#tags>span");
        var tns = [];
        $tags.each(function (index, elem) {
            tns.push($(elem).find("em").text())
        });
        data.field.tagNames = tns;
        NBV5.post("/management/article/create", data.field);

    };

    //监听提交9
    form.on('submit(postSubmit)', function (data) {
        post(data, false, "发布博文成功！");
        return false;
    });

    form.on('submit(draftSubmit)', function (data) {
        post(data, true, "保存草稿成功！");
        return false;
    });

});