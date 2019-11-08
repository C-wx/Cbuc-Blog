/**
 * Copyright:CBUC
 */
layui.define(['form', 'layer', 'table', 'element'], function () {
    var table = layui.table
        , element = layui.element
        , layer = layui.layer
        , form = layui.form;
    element.render();

    var messageTable = table.render({
        elem: '#message-table'
        , url: '/admin/contactPage'
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
                field: 'name'
                , title: '用户昵称'
                , sort: true
                , width: 230
            }
            , {
                field: 'email'
                , title: '用户邮箱'
                , width: 230
            }
            , {
                field: 'message'
                , minWidth: 250
                , title: '评论内容'
                , event: 'detail'
            }
            , {
                field: 'loginIp'
                , title: '访问IP'
                , width: 230
            }
            , {
                field: 'createTime'
                , title: '留言时间'
                , sort: true
                , width: 230
                , minWidth: 100
                , templet: (d) => {
                    return Base.formatDate(d.createTime, 'yy/MM/dd HH:mm:ss');
                }
            }
            , {
                title: '状态'
                , width: 95
                , align: 'center'
                , toolbar: '#enableTpl'
                , fixed: 'right'
            }
        ]]
    });


    form.on('switch(enable)', function () {
        const checkedStatus = this.checked;
        Base.ajax(
            "/admin/modContact"
            , {
                id: this.value,
                status: checkedStatus
            }
            , (result) => {
                if (result.code == Base.status.success) {
                    if (result.data < 1) {
                        $("#msgNum", window.parent.document).html(' ');
                    } else {
                        $("#msgNum", window.parent.document).html(result.data);
                    }
                }else{
                    layer.msg(result.msg);
                    setTimeout(()=>{
                        $(this).context.checked = !checkedStatus;
                        form.render('checkbox');
                    },500);
                }
            }
        );
    });

    //监听单元格事件
    table.on('tool(message)', function (obj) {
        const data = obj.data;
        if (obj.event === 'detail') {
            layer.open({
                type: 0
                , offset: 'auto'
                , id: 'layerDemo' + data.id
                , content: '<div style="padding: 20px;">' + data.message + '</div>'
                , shade: 0.3
                , anim: 5
            });
        }
    });

    table.on('sort(message)', function (obj) {
        var sort;
        if (obj.field == "createTime") {
            sort = "CREATE_TIME";
        }else {
            sort = obj.field;
        }
        messageTable.reload({
            initSort: obj
            , where: {
                sort: sort
                , order: obj.type
            }
        });
    });

    var $ = layui.$
    , active = {
        reload: function () {
            let commentKeyWard = $("#messageKeyword").val();
            let nameKeyword = $("#nameKeyword").val();
            //执行重载
            table.reload('message-table', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    commentKeyWard:commentKeyWard,
                    nameKeyword: nameKeyword
                }
            });
        }
    };

    $('.layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    $('.layui-btn-primary').on('click', function (){
        $("#messageKeyword").val("");
        $("#nameKeyword").val("");
        table.reload('message-table', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {
                commentKeyWard:$("#messageKeyword").val(),
                nameKeyword: $("#nameKeyword").val()
            }
        });
    });
});