showPay = () => {
    $('#pop_img').show();
    $('#pop_img').click(function () {
        $('#pop_img').hide();
    })
};
$(() => {
    /**点赞特效*/
    $(".heart").click(function () {
        var aiId = $(this).attr("aiId");
        var C = parseInt($("#likeCount").html());
        $(this).css("background-position", "");
        var D = $(this).attr("rel");
        if (D === 'like') {
            Base.ajax("/doLike", {'type': "1", 'count': 1, 'id': aiId}, function (result) {
                if (result.code != Base.status.success) {
                    layer.msg(result.msg);
                }
            });
            $("#likeCount").html(C + 1);
            $(this).addClass("heartAnimation").attr("rel", "unlike");
        }
        else {
            Base.ajax("/doLike", {'type': "1", 'count': -1, 'id': aiId}, function (result) {
                if (result.code != Base.status.success) {
                    layer.msg(result.msg);
                }
            });
            $("#likeCount").html(C - 1);
            $(this).removeClass("heartAnimation").attr("rel", "like");
            $(this).css("background-position", "left");
        }
    });
    /**评论功能*/
    $(".commentBtn").click(function () {
        if ($("#desc").val() == '') {
            Base.openError("评论内容不能为空", '#desc');
        } else {
            Base.ajax("addComment", {'content': $("#desc").val(), 'pid': $(this).attr("aiId"), 'type':"1"}, function (result) {
                if (result.code == Base.status.success) {
                    $("#noneCom").hide();
                    layer.msg("评论成功!");
                    var data = result.data;
                    var commentHtml =
                        "<div class=\"cont\">\n" +
                        "     <div class=\"img\">\n" +
                        "         <img src=\" /img/header.png\" alt=\"\">\n" +
                        "     </div>\n" +
                        "     <div class=\"text\">\n" +
                        "         <p class=\"tit\"><span class=\"name\">" + data.loginIp + "</span><span\n" +
                        "                 class=\"data\">" + Base.formatDate(data.createTime, "yyyy/MM/dd") + "</span></p>\n" +
                        "         <p class=\"ct\">" + data.content + "</p>\n" +
                        "         <div style=\"font-size: 23px;margin: 5px 0px 0px 865px\">\n" +
                        "             <i class=\"fa fa-thumbs-o-up flag\" style=\"margin-right: 10px;cursor: pointer\"\n" +
                        "                onclick=\"addLike(" + data.id + ",this)\"></i>\n" +
                        "             <i class=\"fa fa-comment-o flag\" onclick=\"slideSec("+data.id+",this)\" style=\"cursor: pointer;\"></i>\n" +
                        "         </div>\n" +
                        "     </div>\n" +
                        "     <div class=\"secondary\" cid=\""+data.id+"\" style=\"display: none\">\n" +
                        "          <div style=\"padding: 20px\" class=\"secTxt\">\n" +
                        "              <textarea placeholder=\"对此评论有何见解\" class=\"layui-textarea secCon\"></textarea>\n" +
                        "              <div style=\"text-align: right;padding-top: 8px\" >\n" +
                        "                  <button class=\"layui-btn\" onclick=\"addSec("+data.id+",this)\">评论</button>\n" +
                        "              </div>\n" +
                        "          </div>\n" +
                        "     </div>"+
                        "</div>";
                    $(".list-cont").prepend(commentHtml);
                    $("#desc").val("");
                    $("#commentNum").html(parseInt($("#commentNum").html()) + 1);
                }else{
                    layer.msg(result.msg);
                }
            })
        }
        $("#desc").click(function () {
            layer.close(errorPrompt);
        });
    });
});
var flag = false,slide = false;
/**评论点赞*/
addLike = function (cid, e) {
    debugger
    var count;
    if (!flag) {
        count = 1;
    } else {
        count = -1;
    }
    Base.ajax("doLike", {'type': "2", 'id': cid, 'count': count}, function (result) {
        if (result.code == Base.status.success) {
            if (count > 0) {
                $(e).css("color", "red");
                flag = true;
            }else{
                $(e).css("color", "black");
                flag = false;
            }
        }
    });
    console.log(cid);
};
/**展示二级评论*/
slideSec = function (cid,e) {
    if (!slide) {
        $(e).css("color","#d8d4b2");
        slide = true;
    }else{
        $(e).css("color","black");
        slide = false;
    }
  $(".secondary[cid = "+cid+"]").slideToggle();
};
/**添加二级评论*/
addSec = function (cid,e) {
    var txt = $("textarea.secCon[cid='"+cid+"']").val();
    if (txt == '' || txt == null) {
        layer.msg("评论内容不能为空!")
    } else {
        Base.ajax("addComment", {'content': txt, 'pid': cid, 'type':"2"}, function (result) {
            if (result.code == Base.status.success) {
                layer.msg("评论成功!");
                var data = result.data;
                var secComment =
                    "<div class=\"content\">\n" +
                    "     <div class=\"img\">\n" +
                    "         <img src=\" /img/header.png\" alt=\"\">\n" +
                    "     </div>\n" +
                    "     <div class=\"text\">\n" +
                    "         <p class=\"tit\"><span class=\"name\">" + data.loginIp + "</span><span\n" +
                    "                 class=\"data\">" + Base.formatDate(data.createTime, "yyyy/MM/dd") + "</span></p>\n" +
                    "         <p class=\"ct\">" + data.content + "</p>\n" +
                    "     </div>\n" +
                    "</div>";
                $(".secTxt").before(secComment);
                $(".secCon").val("");
            }
        })
    }
};