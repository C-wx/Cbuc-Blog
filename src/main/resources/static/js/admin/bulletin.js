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
            width: "780px",
            height: "200px",
            items: [
                'undo', 'redo', 'source', 'code', 'plainpaste', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist',
                'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall',
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

    //监听提交9
    form.on('submit(postSubmit)', function (data) {
        alert(editor.html());
        return false;
    });

});
$(function () {
    Base.ajax("/admin/getHisBulletin",null,function (result) {
        if (result.code == Base.status.success) {
            result.data.forEach((data) => {
                var $html =
                    "<li class=\"layui-timeline-item\">\n" +
                    "    <i class=\"layui-icon layui-timeline-axis\">&#xe63f;</i>\n" +
                    "    <div class=\"layui-timeline-content layui-text\">\n" +
                    "        <h3 class=\"layui-timeline-title\">"+Base.formatDate(data.createTime,"yyyy-MM-dd HH:mm")+"</h3>\n" +
                    "        <p>\n" + data.content+
                    "        <br><br></p>\n" +
                    "    </div>\n" +
                    "</li>";
                $("#historyBulletin").append($html);
            });
            const $end =
                "<li class=\"layui-timeline-item\">\n" +
                "    <i class=\"layui-icon layui-timeline-axis\" style='color: red'>&#xe63f;</i>\n" +
                "    <div class=\"layui-timeline-content layui-text\">\n" +
                "        <div class=\"layui-timeline-title\">过去</div>\n" +
                "    </div>\n" +
                " </li>"
            $("#historyBulletin").append($end);
        }else{
            layer.msg(result.msg);
        }

    });
});