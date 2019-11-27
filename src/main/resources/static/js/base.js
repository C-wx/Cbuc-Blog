/**
 * Copyright:CBUC
 */
var Base = {
    status: {
        success: 200,
        error: 501
    }
    , browser: {
        versions: function () {
            var u = navigator.userAgent,
                app = navigator.appVersion;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') === -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') === -1, //是否web应该程序，没有头部与底部
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                qq: u.match(/\sQQ/i) === " qq" //是否QQ
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    }, ajax: function (url, data, success) {
        $.ajax({
            type: 'post'
            , dataType: 'json'
            , url: url
            , data: data
            , success: success
            , error: function () {
                layer.msg("发生未知错误！");
            }
        })
    }
    , post: function (url, pData) {
        $.ajax({
            url: url,
            type: "post",
            dataType: "json",
            data: pData,
            success: function (resp) {
                layer.msg(resp.message);
                setTimeout(function () {
                    if (resp.code === 200 || resp.code === -1) {
                        location.reload();
                    }
                }, 1000);
            }, error: function (xhr, err, ex) {
                layer.msg(xhr.responseJSON.message)
            }
        })
    }
    , formatDate: function (date, format) {
        return new Date(date).format(format);
    }
    , isEnable: function (data) {
        if (data.status == 'D') {
            return "(已删除)";
        }else if (Base.formatDate(data.endTime, 'yyyy-MM-dd HH:mm:ss') < Base.formatDate(new Date(), 'yyyy-MM-dd HH:mm:ss')){
            return "(已失效)";
        } else{
            return "(生效中)";
        }
    }
    , openError: function (msg, target) {
        errorPrompt = layer.tips('<span style="font-size: 14px">' + msg + '</span>', target, {
            tips: [1, '#ffb3a6'],
            time: 30000
        });
    }
    ,verifyEmail: function () {
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!reg.test($("#email").val())) {
            $("#email").addClass("border-warning");
            Base.openError("不是正确的邮箱地址","#email");
        } else {
            $("#email").removeClass("border-warning");
            layer.close(errorPrompt);
        }
    }

};
Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "H+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
};