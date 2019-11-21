$(function () {
    var flag = false
    $("#submit").click(function () {
        var name = $("#name").val();
        var email = $("#email").val();
        var message = $("#message").val();
        if (!name) {
            $("#name").addClass("border-warning");
            $("#Pname").text("名称不能为空");
            return
        }
        if (!email) {
            $("#email").addClass("border-warning");
            $("#Pemail").text("邮箱不能为空");
            return
        }
        if (!message) {
            $("#message").addClass("border-warning");
            $("#Pmessage").text("内容不能为空");
            return
        }
        if (!flag) {
            $.ajax({
                url: "contact",
                type: "POST",
                data: $("#contactForm").serialize(),
                success: function (result) {
                    if (result.code == Base.status.success) {
                        layer.load(2, {time: 888});
                        setTimeout(function () {
                            layer.msg("留言成功");
                            $("#name").val("");
                            $("#email").val("");
                            $("#message").val("");
                        }, 888);
                        flag = true;
                    } else {
                        layer.msg("服务异常,请稍后重试");
                    }
                }
            });
        } else {
            layer.msg("留言已收到,请勿重复提交!");
        }

    });
    $("#name").click(function () {
        $("#name").removeClass("border-warning");
        $("#Pname").text("");
    });
    $("#email").click(function () {
        $("#email").removeClass("border-warning");
        $("#Pemail").text("");
    });
    $("#message").click(function () {
        $("#message").removeClass("border-warning");
        $("#Pmessage").text("");
    });
});
verifyEmail = () => {
    var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    if (!reg.test($("#email").val())) {
        $("#email").addClass("border-warning");
        $("#Pemail").text("不是正确的邮箱地址");
    } else {
        $("#email").removeClass("border-warning");
        $("#Pemail").text("");
    }
}