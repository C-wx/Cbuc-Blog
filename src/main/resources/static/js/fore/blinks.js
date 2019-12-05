$(function () {
    $(".definite").click(function () {
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
    let resName = Base.verifyNull($("#registerName").val(),"#registerName");
    let resPhone = Base.verifyNull($("#registerPhone").val(),"#registerPhone");
    let resPwd = Base.verifyNull($("#registerPwd").val(),"#registerPwd");
    let resQuestion = Base.verifyNull($("#registerQuestion").val(),"#registerQuestion");
    let resAnswer = Base.verifyNull($("#registerAnswer").val(),"#registerAnswer");
    console.log(resName);
};