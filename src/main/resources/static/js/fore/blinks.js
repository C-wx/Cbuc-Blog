$(function () {
    $(".definite").click(function () {
        $("#logName").val("");
        $("#logPwd").val("");
        $(".register-container").hide();
        $(".login-container").show();
        var idx = layer.open({
            type: 1
            , id: 1
            , title: false
            , zIndex: layer.zIndex
            , content: $("#popUp")
            , anim: 3
        });
        layer.style(idx, {
            "width": '380px'
            , "height": '476px'
            , "top": '200px'
            , "left": '750px'
            , "border-radius": '10px'
            , "background": '#fff'
        });
        $(".login-tip-click").click(function () {
            $(".login-container").fadeOut();
            $(".forget-container").fadeOut();
            setTimeout(function () {
                $(".register-container").fadeIn();
            }, 400);

        });
        $(".register-tip-click").click(function () {
            $(".register-container").fadeOut();
            $(".forget-container").fadeOut();
            setTimeout(function () {
                $(".login-container").fadeIn();
            }, 400);
        });
        $(".login-forget").click(function () {
            $(".login-container").fadeOut();
            $(".register-container").fadeOut();
            setTimeout(function () {
                $(".forget-container").fadeIn();
            }, 400);
        });
        return false;
    });
});
inputOnfocus = function (e) {
    $(e).css({"border": "1px black solid", "color": "black"});
};
inputOnblur = function (e) {
    $(e).css({"border": "1px #efefef solid"});
};
register = function () {
    let resName =  $("#registerName").val();
    let resPhone = $("#registerPhone").val();
    let resPwd = $("#registerPwd").val();
    let resQuestion = $("#registerQuestion").val();
    let resAnswer = $("#registerAnswer").val();
    if (!Base.verifyNull(resName, "#registerName")) {
        return;
    }
    if (!Base.verifyNull(resPhone, "#registerPhone")) {
        return;
    }
    if (!Base.verifyNull(resPwd, "#registerPwd")) {
        return;
    }
    if (!Base.verifyNull(resAnswer, "#registerAnswer")) {
        return;
    }
    var pattern1 = /1((((3[0-3,5-9])|(4[5,7,9])|(5[0-3,5-9])|(66)|(7[1-3,5-8])|(8[0-9])|(9[1,8,9]))\d{8})|((34)[0-8]\d{7}))/;
    if (!pattern1.test(resPhone)) {
        $("#registerPhone").css("border","1px orange solid");
        layer.msg("请填写正确的手机号码");
        return;
    }
    if (!resQuestion) {
        layer.msg("请选择问题~");
        return;
    }
    Base.ajax("registerUser"
        ,{"userName":resName,"phone":resPhone,"password":resPwd,"question":resQuestion,"answer":resAnswer}
        ,function (result) {
            if (result.code == Base.status.success) {
                layer.msg("注册成功!",{icon:6,anim:2,time:800});
                $(".register-container").fadeOut();
                $(".forget-container").fadeOut();
                setTimeout(function () {
                    $(".login-container").fadeIn();
                }, 400);
            }
    })
};
doLogin=function () {
    let logName =  $("#logName").val();
    let logPwd = $("#logPwd").val();
    if (!Base.verifyNull(logName, "#logName")) {
        return;
    }
    if (!Base.verifyNull(logPwd, "#logPwd")) {
        return;
    }
    Base.ajax("doLogin"
        , {"userName": logName, "password": logPwd}
        , function (result) {
            if (result.code == Base.status.success) {
                layer.msg("登录成功!", {icon: 6, anim: 1, time: 800});
                $(".welcome-text").text("欢迎您" + logName);
                setTimeout(function () {
                    layer.closeAll();
                }, 800);
            } else {
                layer.msg("用户名或密码错误!", {icon: 5, anim: 6, time: 800});
            }
        })
};
savePwd=function () {
    let savName =  $("#savName").val();
    let savPwd = $("#savPwd").val();
    let savQuestion = $("#savQuestion").val();
    let savAnswer = $("#savAnswer").val();
    if (!Base.verifyNull(savName, "#savName")) {
        return;
    }
    if (!Base.verifyNull(savPwd, "#savPwd")) {
        return;
    }
    if (!Base.verifyNull(savQuestion, "#savQuestion")) {
        return;
    }
    if (!Base.verifyNull(savAnswer, "#savAnswer")) {
        return;
    }
    Base.ajax("savePwd"
        ,{"userName":savName,"password":savPwd,"question":savQuestion,"answer":savAnswer}
        ,function (result) {
            if (result.code == Base.status.success) {
                layer.msg("登录成功!",{icon:6,anim:1,time:800});
                setTimeout(function () {
                    layer.closeAll();
                },800);
            }else {
                layer.msg("用户名或密码错误!",{icon:5,anim:6,time:800});
            }
        })
};