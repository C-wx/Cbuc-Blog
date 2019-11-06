//判断是否是IE浏览器
var isIE = Base.browser.versions.trident;
if (isIE) {
    layer.alert("请使用【Chrome（或Chrome内核）／FireFox／Safari】等浏览器访问体验更佳！");
}
//验证码图片刷新
function captchaRefresh(img) {
    $(img).attr("src", "/image/code?t=" + Math.random());
}
//layform使用
layui.use(['form', 'jquery'], function () {
    window.$ = layui.jquery;
    var form = layui.form, layer = layui.layer;
    form.verify({
        username: function (value) {
            if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                return '用户名不能有特殊字符';
            }
            if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                return '用户名首尾不能出现下划线\'_\'';
            }
            if (/^\d+\d+\d$/.test(value)) {
                return '用户名不能全为数字';
            }
            if (value.length < 4 || value.length > 12) {
                return "用户名必须4~12位，且不能包含空格";
            }
        }
        , pass: function (value) {
            if (!/^[\S]{6,12}$/.test(value)) {
                return '密码必须6到12位，且不能出现空格';
            }
        }
    });

    form.on('submit(submit)', function (data) {
        Base.ajax("/admin/login",data.field,(result)=>{
            if (result.code == Base.status.success) {
                layer.msg("登录成功");
                setTimeout(()=>{
                    console.log("...");
                },1000);
            }else if (result.code == Base.status.error) {
                layer.msg(result.msg);
                setTimeout(function () {
                    $("#verifyCode").val("");
                    captchaRefresh($("#vercode"));
                }, 1000);
            }
        });
        return false;
    });
});