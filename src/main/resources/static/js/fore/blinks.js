$(function () {
    $(".addBlinks").bind('click',function () {
        Base.ajax("/checkLogin",null,function (result) {
            if (result.code == Base.status.success) {

                var addBlink = layer.open({
                    type: 1
                    , id: 1
                    , title: false
                    , zIndex: layer.zIndex
                    , content: $("#addBlink")
                    , anim: 1
                });
                layer.style(addBlink, {
                    "width": '938px'
                    , "height": '500px'
                    , "top": '200px'
                    , "left": '450px'
                    , "border-radius": '10px'
                    , "background": '#fff'
                });
            }else{
                layer.msg(result.msg,{icon:2,time:500});
                setTimeout(()=>{
                    showLoginModal();
                },500);
            }
        })
    });

    $(".definite").click(function () {
        Base.ajax("/checkLogin",null,function (result) {
            if (result.code == Base.status.success) {

            }else{
                layer.msg(result.msg,{icon:2,time:500});
                setTimeout(()=>{
                    showLoginModal();
                },500);
            }
        })
    });
});

//展示登录弹窗
showLoginModal = ()=>{
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
};

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
                layer.msg(result.msg, {icon: 5, anim: 6, time: 800});
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
                layer.msg("修改成功!",{icon:6,anim:1,time:800});
                $(".forget-container").fadeOut();
                $(".register-container").fadeOut();
                setTimeout(function () {
                    $(".login-container").fadeIn();
                }, 800);
            }else {
                layer.msg(result.msg,{icon:5,anim:6,time:800});
            }
        })
};

//上传图片
function clickImage(index){
    $("#file_"+index).click();
}

function replace_image(index){
    $("#inputImg").hide();
    // 获得图片对象
    var blob_image = $("#file_"+index)[0].files[0];
    var url = window.URL.createObjectURL(blob_image);
    // 替换image
    $("#image_"+index).attr("src",url);
    var length = $(":file").length;
    if((index+1)==length && length < 3){
        // 用户选择的是最后一张图片
        add_image(index);
    }
}
function add_image(index){
    var a = '<div id ="d_'+(index+1)+'" style="float:left;margin-left:70px;">';
    var b = '<input id="file_'+(index+1)+'" type="file" name="files" style="display:none;" onChange="replace_image('+(index+1)+')"/>'
    var c = '<img id="image_'+(index+1)+'" onclick="clickImage('+(index+1)+')" style="cursor:pointer;" src="/img/sy_img5.jpg" height="150px" width="200px"/>'
    var d = '</div>';
    $("#d_"+index).after(a+b+c+d);
}
$(function () {
    var imgName=[],imgSrc=[],imgFile=[];
    $("#upload").on('change',function (e) {
        var fileList = this.files;
        for(var i = 0; i < fileList.length; i++) {
            var imgSrcI = getObjectURL(fileList[i]);
            imgName.push(fileList[i].name);
            imgSrc.push(imgSrcI);
            imgFile.push(fileList[i]);
        }
        if(imgSrc.length==4){
            return alert("最多只能上传4张图片");
        }
        var imgSize = this.files[0].size;  //b
        if(imgSize>1024*1024*1){//1M
            return alert("上传图片不能超过1M");
        }
        if(this.files[0].type != 'image/png' && this.files[0].type != 'image/jpeg' && this.files[0].type != 'image/gif'){
            return alert("图片上传格式不正确");
        }
    })
});
function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
};
function addNewContent(obj) {
    $(obj).html("");
    for(var a = 0; a < imgSrc.length; a++) {
        var oldBox = $(obj).html();
        $(obj).html(oldBox + '<li class="content-img-list-item"><img src="'+imgSrc[a]+'" alt=""><a index="'+a+'" class="hide delete-btn"><i class="ico-delete"></i></a></li>');
    }
}
$('.content-img-list').on('mouseover','.content-img-list-item',function(){
    $(this).children('a').removeClass('hide');
});
$('.content-img-list').on('mouseleave','.content-img-list-item',function(){
    $(this).children('a').addClass('hide');
});
$(".content-img-list").on("click",'.content-img-list-item a',function(){
    var index = $(this).attr("index");
    imgSrc.splice(index, 1);
    imgFile.splice(index, 1);
    imgName.splice(index, 1);
    var boxId = ".content-img-list";
    addNewContent(boxId);
    if(imgSrc.length<4){//显示上传按钮
        $('.content-img .file').show();
    }
});
