/**
 * Copyright:CBUC
 */
var editor,bulletinTable;
layui.define(['form', 'element', 'laydate', 'table'], function () {
    var $ = layui.$,
        element = layui.element,
        form = layui.form,
        laydate = layui.laydate,
        table = layui.table;

    element.render();
    form.render();
    laydate.render({
        elem: '#beginTime',
        type: 'datetime',
        value: new Date(),
    });
    laydate.render({
        elem: '#endTime',
        type: 'datetime',
        value: new Date(Date.parse(new Date())+100000000)
    });

    KindEditor.options.filterMode = false;
    KindEditor.ready(function (K) {
        editor = K.create('#editor', {
            cssData: 'body {font-family: "Helvetica Neue", Helvetica, "PingFang SC", 微软雅黑, Tahoma, Arial, sans-serif; font-size: 16px}',
            width: "1060px",
            height: "400px",
            items: [
                'undo', 'redo', 'formatblock', 'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough',
                'lineheight', 'source', 'code', 'plainpaste', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist',
                'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'removeformat', 'table', 'hr',
                'emoticons', 'link', 'unlink', 'preview', 'fullscreen'
            ],
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
        data.field.content = editor.html();
        if (data.field.content == "") {
            layer.msg("发布内容不能为空");
            return;
        }
        Base.ajax("addBulletin", data.field, function (result) {
            if (result.code == Base.status.success) {
                layer.msg("发布成功");
                setTimeout(function () {
                    var $html =
                        "<li class=\"layui-timeline-item\">\n" +
                        "    <i class=\"layui-icon layui-timeline-axis\">&#xe63f;</i>\n" +
                        "    <div class=\"layui-timeline-content layui-text\">\n" +
                        "        <h3 class=\"layui-timeline-title\">" + Base.formatDate(result.data.createTime, "yyyy-MM-dd HH:mm") + "</h3>\n" +
                        "        <p>\n" + result.data.content +
                        "        <br><br></p>\n" +
                        "    </div>\n" +
                        "</li>";
                    $("#historyBulletin").prepend($html);
                    editor.html("");
                    bulletinTable.reload();
                }, 500)
            } else {
                layer.msg(result.msg);
            }
        });
        return false;
    });


    bulletinTable = table.render({
        elem: '#bulletinTable'
        , url: '/admin/bulletinPage'
        , page: true
        , limit: 10
        , height: 'full'
        , method: 'get'
        , request: {
            pageName: 'current' //页码的参数名称，默认：page
            , limitName: 'size' //每页数据量的参数名，默认：limit
        }
        , cols: [[
            {
                field: 'content'
                , width: 295
                , title: '公告内容'
                , event: 'detail'
            }
            , {
                field: 'createTime'
                , title: '创建时间'
                , sort: true
                , width: 173
                , minWidth: 100
                , templet: (d) => {
                    return Base.formatDate(d.createTime, 'yy/MM/dd HH:mm:ss');
                }
            }
            , {
                field: 'createTime'
                , title: '开始时间'
                , sort: true
                , width: 173
                , minWidth: 100
                , templet: (d) => {
                    return Base.formatDate(d.beginTime, 'yy/MM/dd HH:mm:ss');
                }
            }
            , {
                field: 'createTime'
                , title: '结束时间'
                , sort: true
                , width: 173
                , minWidth: 100
                , templet: (d) => {
                    return Base.formatDate(d.endTime, 'yy/MM/dd HH:mm:ss');
                }
            }
            , {
                title: '状态'
                , width: 110
                , align: 'center'
                , templet:(d) =>{
                    if (d.endTime < Base.formatDate(new Date(), 'yyyy-MM-dd HH:mm:ss') || d.status == 'D') {
                        return "已失效";
                    }else{
                        return "展示中";
                    }
                }
            }
            , {
                title: '操作'
                , width: 105
                , align: 'center'
                ,templet: (d) =>{
                    return "<button class='layui-btn layui-btn-primary' dataId="+d.id+" onclick='deleteBulletin(this)' style='height: 24px;line-height: 24px'>删除</button>"
                }
            }
        ]]
    });

    //监听单元格事件
    table.on('tool(bulletin)', function (obj) {
        const data = obj.data;
        if (obj.event === 'detail') {
            console.log(data)
            layer.open({
                type: 0
                , offset: 'auto'
                , id: 'layerDemo' + data.id
                , content: '<div style="padding: 20px;">' + data.content + '</div>'
                , shade: 0.3
                , anim: 5
            });
        }
    });

});
$(function () {
    Base.ajax("/admin/getHisBulletin", null, function (result) {
        if (result.code == Base.status.success) {
            result.data.forEach((data) => {
                var $html =
                    "<li class=\"layui-timeline-item\">\n" +
                    "    <i class=\"layui-icon layui-timeline-axis\">&#xe63f;</i>\n" +
                    "    <div class=\"layui-timeline-content layui-text\">\n" +
                    "        <h3 class=\"layui-timeline-title\">" + Base.formatDate(data.createTime, "yyyy-MM-dd HH:mm") + "</h3>\n" +
                    "        <p>\n" + data.content +
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
        } else {
            layer.msg(result.msg);
        }
    });


});
deleteBulletin = (d) => {
    Base.ajax("deleteBulletin", {'id': $(d).attr("dataId")}, function (result) {
        if (result.code == Base.status.success) {
            layer.msg("删除成功!");
            setTimeout(() => {
                $(d).parents(".layui-timeline-item").hide();
                bulletinTable.reload();
            }, 500)
        }
    });
}
